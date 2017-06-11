//
//  GridViewController.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 8/14/15.
<<<<<<< HEAD
=======
//  Modified by Zulwiyoza Putra on 11/25/16.
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}


// MARK: - GridViewController

class GridViewController {
    
    // MARK: Properties
    
    var gridView: GridView
<<<<<<< HEAD
    var ships: [Ship] = []
=======
    var metaShips: [MetaShip] = []
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
    var shipCounts: [ShipSize:Int] = [
        .small: 0,
        .medium: 0,
        .large: 0,
        .xLarge: 0
    ]
    var mineCount = 0
<<<<<<< HEAD
    var seamonsterCount = 0
=======
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
    
    // MARK: Initializers
    
    init(frame: CGRect, isInteractive: Bool = false) {
        gridView = GridView(frame: frame)
        gridView.isInteractive = isInteractive
    }
    
    func reset() {
<<<<<<< HEAD
        ships.removeAll(keepingCapacity: true)
=======
        metaShips.removeAll(keepingCapacity: true)
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
        for shipSize in shipCounts.keys {
            shipCounts[shipSize] = 0
        }
        mineCount = 0
<<<<<<< HEAD
        seamonsterCount = 0
=======
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
        gridView.reset()
        gridView.setNeedsDisplay()
    }
    
    // MARK: Add Ship
    
    func addShip(_ ship: Ship, playerType: PlayerType = .human) -> Bool {
        
        guard isShipRequired(ship) else {
            if let shipSize = ShipSize(rawValue: ship.length) , playerType == .human {
                print("ERROR: Cannot add \(ship). You already have enough \(shipSize) ships.")
            }
            return false
        }
        
        guard !isShipOutOfBounds(ship) else {
            if playerType == .human {
                print("ERROR: Cannot add \(ship). Ship is out of bounds.")
            }
            return false
        }
        
        guard !isShipOverlapping(ship) else {
            if playerType == .human {
                print("ERROR: Cannot add \(ship). Ship overlaps another ship.")
            }
            return false
        }
        
        let start = ship.location, end = ShipEndLocation(ship)
<<<<<<< HEAD
        
        for x in start.x...end.x {
            for y in start.y...end.y {
                                
                ship.hitTracker.cellsHit[gridView.grid[x][y].location] = false
                
                gridView.grid[x][y].containsObject = true
                gridView.grid[x][y].ship = ship
=======
        let metaShip = MetaShip()
        
        for x in start.x...end.x {
            for y in start.y...end.y {
                
                metaShip.cells.append(gridView.grid[x][y].location)
                metaShip.cellsHit[gridView.grid[x][y].location] = false
                
                gridView.grid[x][y].containsObject = true
                gridView.grid[x][y].metaShip = metaShip
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
                
                // place "front-end" of ship
                if x == start.x && y == start.y {
                    if ship.isVertical {
<<<<<<< HEAD
                        gridView.markShipPieceAtLocation(GridLocation(x: x, y: y), orientation: .endUp, playerType: playerType, isWooden: ship.isWooden)
                    } else {
                        gridView.markShipPieceAtLocation(GridLocation(x: x, y: y), orientation: .endLeft, playerType: playerType, isWooden: ship.isWooden)
                    }
=======
                        gridView.markShipPieceAtLocation(GridLocation(x: x, y: y), orientation: .endUp, playerType: playerType)                    } else {
                        gridView.markShipPieceAtLocation(GridLocation(x: x, y: y), orientation: .endLeft, playerType: playerType)                    }
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
                    continue
                }
                
                // place "back-end" of ship
                if x == end.x && y == end.y {
                    if ship.isVertical {
<<<<<<< HEAD
                        gridView.markShipPieceAtLocation(GridLocation(x: x, y: y), orientation: .endDown, playerType: playerType, isWooden: ship.isWooden)
                    } else {
                        gridView.markShipPieceAtLocation(GridLocation(x: x, y: y), orientation: .endRight, playerType: playerType, isWooden: ship.isWooden)
                    }
=======
                        gridView.markShipPieceAtLocation(GridLocation(x: x, y: y), orientation: .endDown, playerType: playerType)                    } else {
                        gridView.markShipPieceAtLocation(GridLocation(x: x, y: y), orientation: .endRight, playerType: playerType)                    }
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
                    continue
                }
                
                // place middle piece of ship
<<<<<<< HEAD
                gridView.markShipPieceAtLocation(GridLocation(x: x, y: y), orientation: ((ship.isVertical) ? .bodyVert : .bodyHorz), playerType: playerType, isWooden: ship.isWooden)
            }
        }
        
        ships.append(ship)
=======
                gridView.markShipPieceAtLocation(GridLocation(x: x, y: y), orientation: ((ship.isVertical) ? .bodyVert : .bodyHorz), playerType: playerType)
            }
        }
        
        metaShips.append(metaShip)
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
        shipCounts[ShipSize(rawValue: ship.length)!]! += 1
        return true
    }
    
    // MARK: Add Mine
    
<<<<<<< HEAD
    func addMine(_ mine: Mine, playerType: PlayerType = .human) -> Bool {
=======
    func addMine(_ mine: _Mine_, playerType: PlayerType = .human) -> Bool {
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
        
        let x = mine.location.x, y = mine.location.y

        guard !isLocationOutOfBounds(mine.location) else {
            if playerType == .human {
                print("ERROR: Cannot add \(mine). Mine is out of bounds.")
            }
            return false
        }
        
        guard mineCount < Settings.RequiredMines && !gridView.grid[x][y].containsObject else {
            if playerType == .human {
                print("ERROR: Cannot add \(mine). You already have enough mines.")
            }
            return false
        }
        
        gridView.grid[x][y].containsObject = true
        gridView.grid[x][y].mine = mine
        gridView.markImageAtLocation(mine.location, image: Settings.Images.Mine, hidden: ((playerType == .computer) ? true : false))
        mineCount += 1
        return true
    }
    
<<<<<<< HEAD
    // MARK: Add Seamonster
    
    func addSeamonster(_ seamonster: SeaMonster, playerType: PlayerType = .human) -> Bool {
        
        let x = seamonster.location.x, y = seamonster.location.y
        
        guard !isLocationOutOfBounds(seamonster.location) else {
            if playerType == .human {
                print("ERROR: Cannot add \(seamonster). Seamonster is out of bounds.")
            }
            return false
        }
        
        guard seamonsterCount < Settings.RequiredSeamonsters && !gridView.grid[x][y].containsObject else {
            if playerType == .human {
                print("ERROR: Cannot add \(seamonster). You already have enough sea monsters.")
            }
            return false
        }
        
        gridView.grid[x][y].containsObject = true
        gridView.grid[x][y].seamonster = seamonster
        gridView.markImageAtLocation(seamonster.location, image: Settings.Images.SeaMonster, hidden: ((playerType == .computer) ? true : false))
        seamonsterCount += 1
        return true
    }
    
=======
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
    // MARK: Fire Cannon
    
    func fireCannonAtLocation(_ location: GridLocation) -> Bool {
        
        let x = location.x, y = location.y
        
        guard gridView.grid[x][y].containsObject else {
            return false
        }
        
<<<<<<< HEAD
        gridView.grid[x][y].ship?.hitTracker.cellsHit[location] = true
        if let mine = gridView.grid[x][y].mine {
            gridView.markImageAtLocation(mine.location, image: Settings.Images.MineHit)
        } else if let seamonster = gridView.grid[x][y].seamonster {
            gridView.markImageAtLocation(seamonster.location, image: Settings.Images.SeaMonsterHit)
=======
        gridView.grid[x][y].metaShip?.cellsHit[location] = true
        if let mine = gridView.grid[x][y].mine {
            gridView.markImageAtLocation(mine.location, image: Settings.Images.MineHit)
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
        } else {
            gridView.markImageAtLocation(location, image: Settings.Images.Hit)
        }
        return true
    }
}

// MARK: - Pre-Game Checks

extension GridViewController {
    
    func hasRequiredShips() -> Bool {
        for (shipType, count) in shipCounts {
            if count != Settings.RequiredShips[shipType] {
                return false
            }
        }
        return true
    }
    
    func hasRequiredMines() -> Bool {
        return mineCount == Settings.RequiredMines
    }
<<<<<<< HEAD
    
    func hasRequiredSeamonsters() -> Bool {
        return seamonsterCount == Settings.RequiredSeamonsters
    }
=======
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
}

// MARK: - In-Game Checks

extension GridViewController {
    
    func checkSink(_ location: GridLocation) -> Bool {
        guard (gridView.grid[location.x][location.y].mine == nil) else {
            return false
        }
        
<<<<<<< HEAD
        if let ship = gridView.grid[location.x][location.y].ship {
=======
        if let ship = gridView.grid[location.x][location.y].metaShip {
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
            return ship.sunk
        } else {
            return false
        }
    }
    
    func checkForWin() -> Bool {
<<<<<<< HEAD
        for ship in ships {
=======
        for ship in metaShips {
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
            if ship.sunk == false {
                return false
            }
        }
        return true
    }
    
    func numberSunk() -> Int {
        var numberSunk = 0
<<<<<<< HEAD
        for ship in ships {
=======
        for ship in metaShips {
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
            if ship.sunk == true {
                numberSunk += 1
            }
        }
        return numberSunk
    }
}

// MARK: - Adding Ship Checks

extension GridViewController {
<<<<<<< HEAD
        
=======
    
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
    fileprivate func isLocationOutOfBounds(_ location: GridLocation) -> Bool {
        return (location.x >= Settings.DefaultGridSize.width || location.y >= Settings.DefaultGridSize.height || location.x < 0 || location.y < 0)
    }
    
    fileprivate func isShipOutOfBounds(_ ship: Ship) -> Bool {
        let start = ship.location, end = ShipEndLocation(ship)
        return (end.x >= Settings.DefaultGridSize.width || end.y >= Settings.DefaultGridSize.height || start.x < 0 || end.x < 0)
    }
    
    fileprivate func isShipRequired(_ ship: Ship) -> Bool {
        if let shipSize = ShipSize(rawValue: ship.length) {
            return shipCounts[shipSize] < Settings.RequiredShips[shipSize]
        } else {
            print("ERROR: Cannot add \(ship). Ship has an invalid length of \(ship.length).")
            return false
        }
    }
    
    fileprivate func isShipOverlapping(_ ship: Ship) -> Bool {
        let start = ship.location, end = ShipEndLocation(ship)
        for x in start.x...end.x {
            for y in start.y...end.y {
                if gridView.grid[x][y].containsObject { return true }
            }
        }
        return false
    }
}
