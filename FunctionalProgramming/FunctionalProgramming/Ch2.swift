//
//  Ch2.swift
//  FunctionalProgramming
//
//  Created by Pratikbhai Patel on 2/19/16.
//  Copyright © 2016 Pratikbhai Patel. All rights reserved.
//

import Foundation
import CoreGraphics

typealias Position = CGPoint
typealias Distance = CGFloat

typealias Region = Position -> Bool

class BattleShip {
    
    var ownPosition: Position = Position(x: 0, y: 0)
    let minimumDistance: Distance = 2.0
    
    // Check if a ship is in range
    func inRange(target: Position, range: Distance) -> Bool {
        return sqrt(target.x * target.x + target.y * target.y) <= range
    }
    
    // Check range in respect to our own position
    func inRange2(target: Position, ownposition: Position, range: Distance) -> Bool {
        let dx = ownposition.x - target.x
        let dy = ownposition.y - target.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        return targetDistance <= range
    }
    
    // Check to make sure they are farther away than the minimum distance
    // so that we don't damage our own ship
    func inRange3(target: Position, ownposition: Position, range: Distance) -> Bool {
        let dx = ownposition.x - target.x
        let dy = ownposition.y - target.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        return targetDistance <= range && targetDistance > minimumDistance
    }
    
    // Also check to make sure that the target ship is not in a range 
    // such that it will cause damage to a friendly ship

    func inRange4(target: Position, ownposition: Position, friendly: Position, range: Distance) -> Bool {
        let dx = ownposition.x - target.x
        let dy = ownposition.y - target.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        let friendlyDx = ownposition.x - friendly.x
        let friendlyDy = ownposition.y - friendly.y
        let friendlyDistance = sqrt(friendlyDx * friendlyDx + friendlyDy * friendlyDy)
        
        return targetDistance <= range
            && targetDistance > minimumDistance
            && friendlyDistance > minimumDistance
    }
    // ^ nuts and dificult to maintain
    
    func circle(radius: Distance) -> Region {
        return { point in
            sqrt(point.x * point.x + point.y * point.y) <= radius
        }
    }
    
}

