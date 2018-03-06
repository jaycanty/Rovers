//
//  GridModel.swift
//  Rovers
//
//  Created by Jay Canty on 3/4/18.
//  Copyright © 2018 JC. All rights reserved.
//

import Foundation

class GridModel {
    static let shared = GridModel()
    
    var gridSize: Int = 0
    var maxManuvers: Int {
        return gridSize*gridSize / Constants.roverCount
    }
    private var currentRouterIndex = 0
    private var rovers = [Rover]()
    
    private init() {}
    
    func resetRoutingState() {
        rovers = Array(repeating: Rover(), count: 4)
        print(rovers)
    }
    
    func getCurrentRoverName() -> String {
        return "Rover \(currentRouterIndex + 1)"
    }
    
    func getRovers() -> [Rover] {
        return rovers
    }
    
    func getCurrentRover() -> Rover {
        return rovers[currentRouterIndex]
    }
    
    func isRoutingComplete() -> Bool {
        return currentRouterIndex == (Constants.roverCount - 1)
    }
    
    func routeNextRover() {
        currentRouterIndex += 1
    }
    
    func updateRovers(_ rover: Rover) {
        rovers[currentRouterIndex] = rover
    }
    
    func getGridViewDrawState(forPosition position: Position) -> DrawState? {
        var rover = getCurrentRover()
        // TODO: check for collison
        if rover.positions.count == 0 {
            rover.positions.append(position)
            updateRovers(rover)
            return .start
        } else {
            if rover.positions.count > maxManuvers {
                return nil
            }
            let lastPostion = rover.positions.last!
            if (lastPostion.x == position.x) && (abs(lastPostion.y - position.y) == 1) { // North or south
                rover.positions.append(position)
                updateRovers(rover)
                return .arrow(lastPostion.y - position.y > 0 ? .north : .south)
            } else if (lastPostion.y == position.y) && (abs(lastPostion.x - position.x) == 1) { // East or west
                rover.positions.append(position)
                updateRovers(rover)
                return .arrow(lastPostion.x - position.x > 0 ? .west : .east)
            }
            return nil
        }
    }
}
