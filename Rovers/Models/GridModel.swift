//
//  GridModel.swift
//  Rovers
//
//  Created by Jay Canty on 3/4/18.
//  Copyright © 2018 JC. All rights reserved.
//

import Foundation

enum RoutingState: Int {
    case rover1
    case rover2
    case rover3
    case rover4
}

class GridModel {
    static let shared = GridModel()
    
    var gridSize: Int = 0
    var routingState: RoutingState = .rover1
    var rovers = [Rover]()
    
    private init() {}
    
    func resetRoutingState() {
        routingState = .rover1
        rovers = Array(repeating: Rover(), count: 4)
        print(rovers)
    }
    
    func getCurrentRoverName() -> String {
        return "Rover \(routingState.rawValue + 1)"
    }
    
    func getCurrentRover() -> Rover {
        return rovers[routingState.rawValue]
    }
}
