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
    var maxManuvers: Int {
        return gridSize*gridSize / 4
    }
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
    
    func updateRovers(_ rover: Rover) {
        rovers.insert(rover, at: routingState.rawValue)
    }
    
    func getGridViewDrawState(forPosition position: Position) -> DrawState {
        var rover = getCurrentRover()
        if (rover.positions.count == 0) {
            rover.positions.append(position)
            updateRovers(rover)
            return .start
        } else {
            // TODO: check for collison
            if (rover.positions.count > maxManuvers) {
                return .none
            }
            let lastPostion = rover.positions.last!
            if (lastPostion.x == position.x && abs(lastPostion.y - position.y) == 1) { // North or south
                rover.positions.append(position)
                updateRovers(rover)
                return .arrow(lastPostion.y - position.y > 0 ? .north : .south)
            } else if (lastPostion.y == position.y && abs(lastPostion.x - position.x) == 1) { // East or west
                rover.positions.append(position)
                updateRovers(rover)
                return .arrow(lastPostion.x - position.x > 0 ? .west : .east)
            }
            return .none
        }
    }
}
