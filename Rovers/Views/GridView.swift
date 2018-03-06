//
//  GridView.swift
//  Rovers
//
//  Created by Jay Canty on 3/4/18.
//  Copyright © 2018 JC. All rights reserved.
//

import UIKit

class GridView: UIView {
    var position: Position!
    fileprivate var drawState: DrawState = .none
    
    init(frame: CGRect, position: Position) {
        super.init(frame: frame)
        self.position = position
        backgroundColor = Constants.marsColor
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
            radius: bounds.width * 0.3, // Circle diameter is %60 of width
            startAngle: 0,
            endAngle: CGFloat.pi*2,
            clockwise: true
        )
        UIColor.green.set()
        circlePath.fill()
    }
    
    func drawArrow(_ direction: Direction) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        var startPoint, centerPoint, endPoint: CGPoint
        switch direction {
        case .north:
            startPoint = CGPoint(x: bounds.width/3, y: bounds.height - bounds.height/3)
            centerPoint = CGPoint(x: bounds.width/2, y: bounds.height/3)
            endPoint = CGPoint(x: bounds.width - bounds.width/3, y: bounds.height - bounds.height/3)
        case .east:
            startPoint = CGPoint(x: bounds.width/3, y: bounds.height/3)
            centerPoint = CGPoint(x: bounds.width - bounds.width/3, y: bounds.height/2)
            endPoint = CGPoint(x: bounds.width/3, y: bounds.height - bounds.height/3)
        case .south:
            startPoint = CGPoint(x: bounds.width/3, y: bounds.height/3)
            centerPoint = CGPoint(x: bounds.width/2, y: bounds.height - bounds.height/3)
            endPoint = CGPoint(x: bounds.width - bounds.width/3, y: bounds.height/3)
        case .west:
            startPoint = CGPoint(x: bounds.width - bounds.width/3, y: bounds.height/3)
            centerPoint = CGPoint(x: bounds.width/3, y: bounds.height/2)
            endPoint = CGPoint(x: bounds.width - bounds.width/3, y: bounds.height - bounds.height/3)
        }
        context.setStrokeColor(UIColor.white.cgColor)
        context.setLineWidth(2)
        context.move(to: startPoint)
        context.addLine(to: centerPoint)
        context.addLine(to: endPoint)
        context.strokePath()
    }
}
