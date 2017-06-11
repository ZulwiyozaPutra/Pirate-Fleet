//
//  Structs.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 8/26/15.
<<<<<<< HEAD
=======
//  Modified by Zulwiyoza Putra on 11/25/16.
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - GridSize

struct GridSize {
    let width: Int
    let height: Int
}

// MARK: - GridCell

struct GridCell {
    let location: GridLocation
    let view: UIView
    var containsObject: Bool
<<<<<<< HEAD
    var mine: Mine?
    var ship: Ship?
    var seamonster: SeaMonster?
=======
    var mine: _Mine_?
    var metaShip: MetaShip?
}

// MARK: - MetaShip

class MetaShip {
    var cells: [GridLocation] = []
    var cellsHit: [GridLocation: Bool] = [:]
    var sunk: Bool {
        get {
            for (_, hit) in cellsHit {
                if hit == false {
                    return false
                }
            }
            return true
        }
    }
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
}

// MARK: - GameStats

struct GameStats {
    let numberOfHitsOnEnemy: Int
    let numberOfMissesByHuman: Int
    let enemyShipsRemaining: Int
    let humanShipsSunk: Int
    let sinkBonus: Int
    let shipBonus: Int
    let guessPenalty: Int
}
<<<<<<< HEAD

// MARK: - HitTracker

class HitTracker {
    var cellsHit: [GridLocation: Bool] = [:]
}
=======
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
