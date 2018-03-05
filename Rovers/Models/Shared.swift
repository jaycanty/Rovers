//
//  Shared.swift
//  Rovers
//
//  Created by Jay Canty on 3/4/18.
//  Copyright © 2018 JC. All rights reserved.
//

import Foundation

struct Position {
    var x: Int
    var y: Int
    
    static func == (lhs: Position, rhs: Position) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    func isNorth(_ position: Position) -> Bool {
        return true
    }
}

enum Direction {
    case north
    case east
    case south
    case west
}

enum DrawState {
    case none
    case start
    case arrow(Direction)
}
