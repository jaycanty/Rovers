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
    let gridModel = GridModel.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        let rovers = gridModel.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rightNavBarButtonPressed(_ sender: Any) {
    }
}
