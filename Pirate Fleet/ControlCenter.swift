//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
<<<<<<< HEAD
=======
//  Modified by Zulwiyoza Putra on 11/25/16.
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
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
<<<<<<< HEAD
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
protocol Cell {
    var location: GridLocation {get}
}

// TODO: Adopt and implement the PenaltyCell protocol
struct Mine: Cell {
    let location: GridLocation

}

// TODO: Adopt and implement the PenaltyCell protocol
struct SeaMonster: Cell {
    let location: GridLocation
=======
}

struct Mine: _Mine_ {
    var location: GridLocation
    var explosionText: String
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
}

class ControlCenter {
    
<<<<<<< HEAD
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
        
        let mine1 = Mine(location: GridLocation(x: 6, y: 0))
        human.addMineToGrid(mine1)
        
        let mine2 = Mine(location: GridLocation(x: 3, y: 3))
        human.addMineToGrid(mine2)
        
        let seamonster1 = SeaMonster(location: GridLocation(x: 5, y: 6))
        human.addSeamonsterToGrid(seamonster1)
        
        let seamonster2 = SeaMonster(location: GridLocation(x: 2, y: 2))
        human.addSeamonsterToGrid(seamonster2)
=======
    func addShipsAndMines(_ human: Human) {
        // Adding some ships
        let smallShip = Ship(length: 2, location: GridLocation(x: 0, y: 0), isVertical: false)
        human.addShipToGrid(smallShip)
        
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 1), isVertical: false)
        human.addShipToGrid(mediumShip1)
        
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 0, y: 2), isVertical: false)
        human.addShipToGrid(mediumShip2)
        
        let largeShip = Ship(length: 4, location: GridLocation(x: 0, y: 3), isVertical: false)
        human.addShipToGrid(largeShip)
        
        let extraLargeShip = Ship(length: 5, location: GridLocation(x: 0, y: 4), isVertical: false)
        human.addShipToGrid(extraLargeShip)
        
        //Adding some mines
        let mine1 = Mine(location: GridLocation(x: 5, y: 0), explosionText: "mine1 explode!")
        human.addMineToGrid(mine1)
        
        let mine2 = Mine(location: GridLocation(x: 5, y: 2), explosionText: "mine2 explode!")
        human.addMineToGrid(mine2)
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
    }
    
    func calculateFinalScore(_ gameStats: GameStats) -> Int {
        
        var finalScore: Int
<<<<<<< HEAD
        
        let sinkBonus = (5 - gameStats.enemyShipsRemaining) * gameStats.sinkBonus
        let shipBonus = (5 - gameStats.humanShipsSunk) * gameStats.shipBonus
        let guessPenalty = (gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman) * gameStats.guessPenalty
        
        finalScore = sinkBonus + shipBonus - guessPenalty
=======
        let totalRequiredShips = 5
        
        finalScore = 0
        
        let enemyShipsSunk = totalRequiredShips - gameStats.enemyShipsRemaining
        let sinkBonus = gameStats.sinkBonus
        let humanShipsRemaining = gameStats.humanShipsSunk
        let shipBonus = gameStats.shipBonus
        let numberOfGuesses = gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman
        let guessPenalty = gameStats.guessPenalty
        
        finalScore = (enemyShipsSunk * sinkBonus) + (humanShipsRemaining * shipBonus) - (numberOfGuesses * guessPenalty)
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
        
        return finalScore
    }
}
