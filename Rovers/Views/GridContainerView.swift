//
//  GridContainerView.swift
//  Rovers
//
//  Created by Jay Canty on 3/4/18.
//  Copyright © 2018 JC. All rights reserved.
//

import UIKit

class GridContainerView: UIView {
    
    @IBInspectable var isRouteMode: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        drawGrid()
    }
    
    func drawGrid() {
        backgroundColor = isRouteMode ? UIColor.darkGray : Constants.marsColor
        let gridSize = GridModel.shared.gridSize
        let fudge: CGFloat = isRouteMode ? 1 : 0
        let gridEdge = frame.width / CGFloat(gridSize)
        for xIndex in (0..<gridSize) {
            for yIndex in (0..<gridSize) {
                let x = CGFloat(xIndex) * gridEdge
                let y = CGFloat(yIndex) * gridEdge
                let gridViewFrame = CGRect(
                    x: x + fudge,
                    y: y + fudge,
                    width: gridEdge - fudge*2,
                    height: gridEdge - fudge*2
                )
                let gridView = GridView(
                    frame: gridViewFrame,
                    position: Position(x: xIndex, y: yIndex)
                )
                addSubview(gridView)
            }
        }
    }
}
