//
//  RoversViewController.swift
//  Rovers
//
//  Created by Jay Canty on 3/4/18.
//  Copyright © 2018 JC. All rights reserved.
//

import UIKit

class RoversViewController: UIViewController {
    
    @IBOutlet weak var rightNavBarItem: UIBarButtonItem!
    @IBOutlet weak var gridContainerView: GridContainerView!
    var rovers = GridModel.shared.getRovers()
    var roverViewLookup = [RoverView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStartPositions()
    }
    
    @IBAction func rightNavBarButtonPressed(_ sender: UIBarButtonItem) {
        rove()
    }
    
    private func rove() {
        let endIndex = getMaxManuvers()
        UIView.animateKeyframes(
            withDuration: Double(endIndex),
            delay: 0,
            options: .calculationModePaced,
            animations: {
                for positionIndex in 1...endIndex {
                    UIView.addKeyframe(
                        withRelativeStartTime: Double(positionIndex-1)/Double(endIndex),
                        relativeDuration: 1/Double(endIndex),
                        animations: {
                            self.moveToRoversNextPositon(atIndex: positionIndex)
                    })
                }
        },
            completion: { complete in
                
        })
    }
    
    private func displayStartPositions() {
        for rover in rovers {
            let startPosition = rover.positions.first!
            let gridViewWithPosition = getGridView(atPosition: startPosition)
            let roverView = RoverView(frame: gridViewWithPosition.frame)
            roverViewLookup.append(roverView)
            gridContainerView.addSubview(roverView)
        }
    }
    
    private func moveToRoversNextPositon(atIndex index: Int) {
        for (roverIndex, rover) in rovers.enumerated() {
            if rover.positions.count > index {
                let gridView = getGridView(atPosition: rover.positions[index])
                roverViewLookup[roverIndex].center = gridView.center
            }
        }
    }
    
    private func getGridView(atPosition position: Position) -> GridView {
        return gridContainerView.subviews.filter { view in
            guard let gridView = view as? GridView else {
                return false
            }
            return gridView.position == position
        }.first as! GridView
    }
    
    private func getMaxManuvers() -> Int {
        return rovers.map { rover in
            return rover.positions.count
        }.max()! - 1
    }
}
