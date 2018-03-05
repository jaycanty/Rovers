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
    let gridModel = GridModel.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        let rovers = gridModel.getRovers()
        for rover in rovers {
            let startPosition = rover.positions.first!
            let gridViewWithPosition = gridContainerView.subviews.filter { view in
                    guard let gridView = view as? GridView else {
                        return false
                    }
                    return gridView.position == startPosition
                }.first!
            let roverView = RoverView(frame: gridViewWithPosition.frame)
            gridContainerView.addSubview(roverView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rightNavBarButtonPressed(_ sender: Any) {
        
    }
}
