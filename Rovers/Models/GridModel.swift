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
    var maxManeuvers: Int {
        return gridSize*gridSize / Constants.roverCount
    }
    private var currentRouterIndex = 0
    private var rovers = [Rover]()
    
    private init() {}
    
    func resetRoutingState() {
        currentRouterIndex = 0
        rovers = Array(repeating: Rover(), count: 4)
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
        if isCollision(atPosition: position) {
            return nil
        }
        if rover.positions.count == 0 {
            rover.positions.append(position)
            updateRovers(rover)
            return .start
        } else {
            if rover.positions.count == maxManeuvers {
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
    
    private func isCollision(atPosition position: Position) -> Bool {
        let current = getCurrentRover()
        var otherRovers = rovers
        otherRovers.remove(at: currentRouterIndex)
        for otherRover in otherRovers {
            // If they are in the same position at the same time
            if otherRover.positions.count > current.positions.count {
                let otherPosition = otherRover.positions[current.positions.count]
                if otherPosition == position {
                    return true
                }
            }
            // headon collision
            for (index, otherPosition) in otherRover.positions.enumerated() {
                if otherPosition == position {
                    if (otherRover.positions.count > (index + 1)) && (current.positions.count > 0) {
                        if otherRover.positions[index + 1] == current.positions.last! {
                            return true
                        }
                    }
                }
            }
        }
        return false
    }
}
