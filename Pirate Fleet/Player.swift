//
//  Player.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 8/27/15.
<<<<<<< HEAD
=======
//  Modified by Zulwiyoza Putra on 11/25/16.
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

<<<<<<< HEAD
=======
// MARK: - PlayerMine
// Used to give students a clean interface 😉!

struct PlayerMine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
// MARK: MoveType

enum MoveType {
    case normalMove
    case guaranteedHit
}

// MARK: - Player

class Player {

    // MARK: Properties
    
    var playerDelegate: PlayerDelegate?
    var playerType: PlayerType
<<<<<<< HEAD
    var lastHitPenaltyCell: Cell? = nil
=======
    var lastHitPenaltyCell: _Mine_? = nil
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
    var numberOfMisses: Int = 0
    var numberOfHits: Int = 0
    
    var performedMoves = Set<GridLocation>()
    var gridViewController: GridViewController
    var gridView: GridView {
        get {
            return gridViewController.gridView
        }
    }
    var grid: [[GridCell]] {
        get {
            return gridViewController.gridView.grid
        }
    }
    var availableMoves = [MoveType]()
    
    // MARK: Initializers
    
    init(frame: CGRect) {
        gridViewController = GridViewController(frame: frame)
        playerType = .computer
    }

    func reset() {
        gridViewController.reset()
        numberOfMisses = 0
        numberOfHits = 0
        lastHitPenaltyCell = nil
        performedMoves.removeAll(keepingCapacity: true)
        availableMoves.append(.normalMove)
    }
    
    // MARK: Pre-Game Check
    
    func numberOfMines() -> Int {
        return gridViewController.mineCount
    }
    
<<<<<<< HEAD
    func numberOfSeamonsters() -> Int {
        return gridViewController.seamonsterCount
    }
    
    func readyToPlay(checkMines: Bool = true, checkMonsters: Bool = true) -> Bool {
        let shipsReady = gridViewController.hasRequiredShips()
        
        let minesReady = (checkMines == true) ? gridViewController.hasRequiredMines() : true
        
        let monstersReady = (checkMonsters == true) ? gridViewController.hasRequiredSeamonsters() : true
        
        return shipsReady && minesReady && monstersReady
=======
    func readyToPlay(checkMines: Bool = true) -> Bool {
        
        let shipsReady = gridViewController.hasRequiredShips()
        let minesReady = (checkMines == true) ? gridViewController.hasRequiredMines() : true
        
        return shipsReady && minesReady
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
    }
    
    // MARK: Attacking  
    
    func attackPlayer(_ player: Player, atLocation: GridLocation) {
        
        performedMoves.insert(atLocation)
        
        // hit a mine?
        if let mine = player.grid[atLocation.x][atLocation.y].mine {
            lastHitPenaltyCell = mine
            numberOfMisses += 1
            player.gridView.markImageAtLocation(mine.location, image: Settings.Images.MineHit)
        }
        
<<<<<<< HEAD
        // hit a seamonster?
        if let seamonster = player.grid[atLocation.x][atLocation.y].seamonster {
            lastHitPenaltyCell = seamonster
            numberOfMisses += 1
            player.gridView.markImageAtLocation(seamonster.location, image: Settings.Images.SeaMonsterHit)
        }
        
=======
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
        // hit a ship?
        if !player.gridViewController.fireCannonAtLocation(atLocation) {
            numberOfMisses += 1
            player.gridView.markImageAtLocation(atLocation, image: Settings.Images.Miss)
        } else {
            // we hit something!
            numberOfHits += 1
        }
        
        if let playerDelegate = playerDelegate {
            
            if player.gridViewController.checkSink(atLocation) {
                playerDelegate.playerDidSinkAtLocation(self, location: atLocation)
            }
            
            if player.gridViewController.checkForWin() {
                playerDelegate.playerDidWin(self)
            }
            playerDelegate.playerDidMove(self)
        }
    }
    
    func attackPlayerWithGuaranteedHit(_ player: Player) {
        var hitShip = false
        
        while hitShip == false {
            let location = RandomGridLocation()
            if !performedMoves.contains(location) {
                // hit a mine?
                if let _ = player.grid[location.x][location.y].mine {
                    continue
                }
                
<<<<<<< HEAD
                // hit a seamonster?
                if let _ = player.grid[location.x][location.y].seamonster {
                    continue
                }
                
=======
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
                // hit a ship?
                if !player.gridViewController.fireCannonAtLocation(location) {
                    continue
                } else {
                    
                    hitShip = true
                    numberOfHits += 1
                    performedMoves.insert(location)
                    
                    if let playerDelegate = playerDelegate {
                        
                        if player.gridViewController.checkSink(location) {
                            playerDelegate.playerDidSinkAtLocation(self, location: location)
                        }
                        
                        if player.gridViewController.checkForWin() {
                            playerDelegate.playerDidWin(self)
                        }
                        playerDelegate.playerDidMove(self)
                    }
                }
            }
        }
    }
    
    func attackPlayerWithGuaranteedMine(_ player: Player) -> Bool {
        var hitMine = false
        
        if player.numberOfMines() == 0 {
            return false
        } else {
            while hitMine == false {
                let location = RandomGridLocation()
                if !performedMoves.contains(location) {
                    // hit a mine?
                    if let mine = player.grid[location.x][location.y].mine {
                        hitMine = true
                        self.lastHitPenaltyCell = mine
                        self.gridViewController.mineCount -= 1
                        let _ = player.gridViewController.fireCannonAtLocation(mine.location)
                        
                        performedMoves.insert(mine.location)
                        
                        if let playerDelegate = playerDelegate {
                            if player.gridViewController.checkForWin() {
                                playerDelegate.playerDidWin(self)
                            }
                            playerDelegate.playerDidMove(self)
                        }
                    } else {
                        continue
                    }
                }
            }
            return true
        }
    }
    
    func canAttackPlayer(_ player: Player, atLocation: GridLocation) -> Bool {
        return locationInBounds(atLocation) && !performedMoves.contains(atLocation)
    }
    
    func locationInBounds(_ location: GridLocation) -> Bool {
        return !(location.x < 0 || location.y < 0 || location.x >= Settings.DefaultGridSize.width || location.y >= Settings.DefaultGridSize.height)
    }
    
    
    // MARK: Modify Grid
    
    func revealShipAtLocation(_ location: GridLocation) {
<<<<<<< HEAD
        let connectedCells = grid[location.x][location.y].ship?.cells
        gridView.revealLocations(connectedCells!)
    }
    
    func addPlayerShipsMinesMonsters(_ numberOfMines: Int = 0, numberOfSeamonsters: Int = 0) {
=======
        let connectedCells = grid[location.x][location.y].metaShip?.cells
        gridView.revealLocations(connectedCells!)
    }
    
    func addPlayerShipsMines(_ numberOfMines: Int = 0) {
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
        
        // randomize ship placement
        for (requiredShipType, requiredNumber) in Settings.RequiredShips {
            for _ in 0..<requiredNumber {
                let shipLength = requiredShipType.rawValue
                
                var shipLocation = RandomGridLocation()
                var vertical = Int(arc4random_uniform(UInt32(2))) == 0 ? true : false
<<<<<<< HEAD
                var ship = Ship(length: shipLength, location: shipLocation, isVertical: vertical, isWooden: false)
=======
                var ship = Ship(length: shipLength, location: shipLocation, isVertical: vertical)
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
                
                while !gridViewController.addShip(ship, playerType: .computer) {
                    shipLocation = RandomGridLocation()
                    vertical = Int(arc4random_uniform(UInt32(2))) == 0 ? true : false
<<<<<<< HEAD
                    ship = Ship(length: shipLength, location: shipLocation, isVertical: vertical, isWooden: false)
=======
                    ship = Ship(length: shipLength, location: shipLocation, isVertical: vertical)
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
                }
            }
        }
                
        // random mine placement
        for _ in 0..<numberOfMines {
            var location = RandomGridLocation()
<<<<<<< HEAD
            var mine = Mine(location: location)
            while !gridViewController.addMine(mine, playerType: .computer) {
                location = RandomGridLocation()
                mine = Mine(location: location)
            }
        }
        
        // random seamonster placement
        for _ in 0..<numberOfSeamonsters {
            var location = RandomGridLocation()
            var seaMonster = SeaMonster(location: location)
            while !gridViewController.addSeamonster(seaMonster, playerType: .computer) {
                location = RandomGridLocation()
                seaMonster = SeaMonster(location: location)
=======
            var mine = PlayerMine(location: location, explosionText: Settings.DefaultMineText)
            while !gridViewController.addMine(mine, playerType: .computer) {
                location = RandomGridLocation()
                mine = PlayerMine(location: location, explosionText: Settings.DefaultMineText)
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
            }
        }
    }
}
