//
//  Constants.swift
//  Rovers
//
//  Created by Jay Canty on 3/4/18.
//  Copyright © 2018 JC. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let roverCount = 4
    static let marsColor = UIColor(displayP3Red: 145/255, green: 97/255, blue: 75/255, alpha: 1.0)
    static let toRoverSequeName = "ToRoverViewController"
}

extension Notification.Name {
    static let gridViewPressed = Notification.Name("gridViewPressed")
}
