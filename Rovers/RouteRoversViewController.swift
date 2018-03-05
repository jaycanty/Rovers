//
//  RouteRoversViewController.swift
//  Rovers
//
//  Created by Jay Canty on 3/4/18.
//  Copyright © 2018 JC. All rights reserved.
//

import UIKit

class RouteRoversViewController: UIViewController {
    
    @IBOutlet weak var currentRoverLabel: UILabel!
    @IBOutlet weak var initialPositionLabel: UILabel!
    @IBOutlet weak var routeLabel: UILabel!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onGridViewPressed(notification:)),
            name: .gridViewPressed,
            object: nil
        )
        GridModel.shared.resetRoutingState()
        currentRoverLabel.text = GridModel.shared.getCurrentRoverName()
        initialPositionLabel.text = "-"
        routeLabel.text = "-"
        nextButton.isEnabled = false
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func onGridViewPressed(notification: Notification) {
        let gridView = notification.object as! GridView
        let nextState = GridModel.shared.getGridViewDrawState(forPosition: gridView.position)
        gridView.redraw(drawState: nextState)
    }
    
    @IBAction func nextPressed(_ sender: UIBarButtonItem) {
    }
}
