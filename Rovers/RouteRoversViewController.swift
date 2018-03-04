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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onGridViewPressed(notification:)),
            name: .gridViewPressed,
            object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func onGridViewPressed(notification: Notification) {
        print((notification.object as! GridView).position)
    }
}
