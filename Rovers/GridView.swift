//
//  GridView.swift
//  Rovers
//
//  Created by Jay Canty on 3/4/18.
//  Copyright © 2018 JC. All rights reserved.
//

import UIKit

enum Direction {
    case north
    case east
    case south
    case west
}

enum DrawState {
    case none
    case start
    case arrow(Direction)
}

class GridView: UIView {
    var position: (Int, Int)!
    fileprivate var drawState: DrawState = .none
    
    init(frame: CGRect, position: (Int, Int)) {
        super.init(frame: frame)
        self.position = position
        backgroundColor = UIColor.lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let notification = Notification(
            name: .gridViewPressed,
            object: self,
            userInfo: nil
        )
        NotificationCenter.default.post(notification)
    }
    
    func redraw(drawState: DrawState) {
        self.drawState = drawState
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        switch drawState {
        case .none:
            return
        case .start:
            drawStart()
        case .arrow(let direction):
            drawArrow(direction)
        }
    }
    
    func drawStart() {
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: bounds.width/2, y: bounds.height/2),
            radius: bounds.width * 0.4, // Circle diameter is %80 of width
            startAngle: 0,
            endAngle: CGFloat.pi*2,
            clockwise: true
        )
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.green.cgColor
        layer.addSublayer(shapeLayer)
    }
    
    func drawArrow(_ direction: Direction) {
        
    }
}
