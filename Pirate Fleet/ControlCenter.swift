//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Modified by Zulwiyoza Putra on 11/25/16.
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
}

class ControlCenter {
    
    func addShipsAndMines(_ human: Human) {
        // Write your code here!
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
    }
    
    func calculateFinalScore(_ gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        finalScore = 0                
        
        return finalScore
    }
}
