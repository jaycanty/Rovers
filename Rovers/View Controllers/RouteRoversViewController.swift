//
//  RouteRoversViewController.swift
//  Rovers
//
//  Created by Jay Canty on 3/4/18.
//  Copyright © 2018 JC. All rights reserved.
//

import UIKit

class RouteRoversViewController: UIViewController {
    
    @IBOutlet weak var gridContainerView: GridContainerView!
    @IBOutlet weak var currentRoverLabel: UILabel!
    @IBOutlet weak var maneuversLabel: UILabel!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    private let gridModel = GridModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onGridViewPressed(notification:)),
            name: .gridViewPressed,
            object: nil
        )

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gridModel.resetRoutingState()
        resetDisplay()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func onGridViewPressed(notification: Notification) {
        let gridView = notification.object as! GridView
        if let nextState = gridModel.getGridViewDrawState(forPosition: gridView.position) {
            gridView.redraw(drawState: nextState)
            let count = gridModel.getCurrentRover().positions.count
            nextButton.isEnabled = (count == gridModel.maxManeuvers)
            setManeuvers(count)
        }
    }
    
    @IBAction func nextPressed(_ sender: UIBarButtonItem) {
        if gridModel.isRoutingComplete() {
            performSegue(withIdentifier: Constants.toRoverSequeName, sender: nil)
        } else {
            gridModel.routeNextRover()
            resetDisplay()
        }
    }
    
    private func resetDisplay() {
        setManeuvers(0)
        currentRoverLabel.text = gridModel.getCurrentRoverName()
        nextButton.isEnabled = false
        wipeGridView()
    }
    
    private func wipeGridView() {
        for gridView in gridContainerView.subviews as! [GridView] {
            gridView.redraw(drawState: .none)
        }
    }
    
    private func setManeuvers(_ count: Int) {
        maneuversLabel.text = "maneuvers: \(count)/\(gridModel.maxManeuvers)"
    }
}
