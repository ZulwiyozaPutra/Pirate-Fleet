//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
    let isWooden: Bool
    

// TODO: Add the computed property, cells.
    var cells: [GridLocation] {
        get {
            // Hint: These two constants will come in handy
            let start = self.location
            let end: GridLocation = ShipEndLocation(self)
            
            // Hint: The cells getter should return an array of GridLocations.
            var occupiedCells = [GridLocation]()
            
            // If horizontal
            if start.x == end.x {
                for y in start.y...end.y {
                    occupiedCells.append(GridLocation(x: start.x, y: y))

                }
                return occupiedCells
                
            // If vertical
            } else if start.y == start.y {
                for x in start.x...end.x {
                    occupiedCells.append(GridLocation(x: x, y: start.y))
                }
                return occupiedCells
            // If diagonal
            } else {
                print("Error: Cells are diagonal")
                return occupiedCells
            }
        }
    }
    
    var hitTracker: HitTracker
// TODO: Add a getter for sunk. Calculate the value returned using hitTracker.cellsHit.
    var sunk: Bool {
        get {
            for cell in hitTracker.cellsHit {
                if hitTracker.cellsHit[cell.key] == false {
                    return false
                }
            }
            return true
        }
    }

    
    init(length: Int, location: GridLocation, isVertical: Bool, isWooden: Bool) {
        self.length = length
        self.hitTracker = HitTracker()
        self.location = location
        self.isVertical = isVertical
        self.isWooden = isWooden
    }
    
    init(length: Int, location: GridLocation, isVertical: Bool) {
        self.length = length
        self.hitTracker = HitTracker()
        self.location = location
        self.isVertical = isVertical
        self.isWooden = false
    }
}

// TODO: Change Cell protocol to PenaltyCell and add the desired properties
protocol PenaltyCell {
    var location: GridLocation { get }
    
    var guaranteesHit: Bool { get }
    
    var penaltyText: String { get }
}

// TODO: Adopt and implement the PenaltyCell protocol
struct Mine: PenaltyCell {
    var guaranteesHit: Bool

    var penaltyText: String

    let location: GridLocation
    
    init(location: GridLocation, penaltyText: String) {
        self.location = location
        self.penaltyText = penaltyText
        self.guaranteesHit = false
    }
    
    init(location: GridLocation, penaltyText: String, guaranteesHit: Bool) {
        self.location = location
        self.penaltyText = penaltyText
        self.guaranteesHit = guaranteesHit
    }

}

// TODO: Adopt and implement the PenaltyCell protocol
struct SeaMonster: PenaltyCell {
    var guaranteesHit: Bool
    
    var penaltyText: String

    let location: GridLocation
}

class ControlCenter {
    
    func placeItemsOnGrid(_ human: Human) {
        
        let smallShip = Ship(length: 2, location: GridLocation(x: 3, y: 4), isVertical: true, isWooden: false)
        human.addShipToGrid(smallShip)
        
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false, isWooden: false)
        human.addShipToGrid(mediumShip1)
        
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 3, y: 1), isVertical: false, isWooden: false)
        human.addShipToGrid(mediumShip2)
        
        let largeShip = Ship(length: 4, location: GridLocation(x: 6, y: 3), isVertical: true, isWooden: false)
        human.addShipToGrid(largeShip)
        
        let xLargeShip = Ship(length: 5, location: GridLocation(x: 7, y: 2), isVertical: true, isWooden: false)
        human.addShipToGrid(xLargeShip)
        
        let mine1 = Mine(location: GridLocation(x: 6, y: 0), penaltyText: "Lucky for you the scallywag has turned and fled. Time to juice up!", guaranteesHit: false)
        human.addMineToGrid(mine1)
        
        let mine2 = Mine(location: GridLocation(x: 3, y: 3), penaltyText: "CP tripped... on your explosion. RIP")
        human.addMineToGrid(mine2)
        
        let seamonster1 = SeaMonster(guaranteesHit: true, penaltyText: "CP solo'd baron nashor.", location: GridLocation(x: 5, y: 6))
        human.addSeamonsterToGrid(seamonster1)
        
        let seamonster2 = SeaMonster(guaranteesHit: true, penaltyText: "CP wanted to feel big but the Sea Monster was bigger.", location: GridLocation(x: 2, y: 2))
        human.addSeamonsterToGrid(seamonster2)
    }
    
    func calculateFinalScore(_ gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        let sinkBonus = (5 - gameStats.enemyShipsRemaining) * gameStats.sinkBonus
        let shipBonus = (5 - gameStats.humanShipsSunk) * gameStats.shipBonus
        let guessPenalty = (gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman) * gameStats.guessPenalty
        
        finalScore = sinkBonus + shipBonus - guessPenalty
        
        return finalScore
    }
}
