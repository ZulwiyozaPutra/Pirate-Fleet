//
//  GridView.swift
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

// MARK: - GridViewDelegate

protocol GridViewDelegate {
    func didTapCell(_ location: GridLocation)
}

// MARK: - GridView

class GridView: UIView {
    
    // MARK: Properties
    
    var grid: [[GridCell]]!
    var delegate: GridViewDelegate? = nil
    var isInteractive = false {
        willSet {
            if newValue {
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCell))
                addGestureRecognizer(tapGesture)
            } else {
                if let gestureRecognizers = gestureRecognizers {
                    for gestureRecognizer in gestureRecognizers {
                        if gestureRecognizer is UITapGestureRecognizer {
                            removeGestureRecognizer(gestureRecognizer)
                        }
                    }
                }
            }
        }
    }
    let cellBackgroundImage = UIImage(named: Settings.Images.Water)
    
    // MARK: Initializers
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        grid = [[GridCell]]()
        
        let center = self.center
        let sideLength = getSideLength()
        self.frame = CGRect(x: 0, y: 0, width: sideLength * CGFloat(Settings.DefaultGridSize.width), height: sideLength * CGFloat(Settings.DefaultGridSize.height))
        self.center = center
        
        for x in 0..<Settings.DefaultGridSize.width {
            var cells = [GridCell]()
            for y in 0..<Settings.DefaultGridSize.height {
                
                let view = UIView()
                view.frame = CGRect(x: CGFloat(x) * sideLength, y: CGFloat(y) * sideLength, width: sideLength, height: sideLength)
                
                addBackgroundToView(view, backgroundImage: cellBackgroundImage)
                
<<<<<<< HEAD
                let gridCell = GridCell(location: GridLocation(x: x, y: y), view: view, containsObject: false, mine: nil, ship: nil, seamonster: nil)
=======
                let gridCell = GridCell(location: GridLocation(x: x, y: y), view: view, containsObject: false, mine: nil, metaShip: nil)
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
                cells.append(gridCell)
                self.addSubview(view)
            }
            grid.append(cells)
        }
    }

    // MARK: Reset
    
    func reset() {
        for x in 0..<Settings.DefaultGridSize.width {
            for y in 0..<Settings.DefaultGridSize.height {
                
                for view in grid[x][y].view.subviews {
                    view.removeFromSuperview()
                }
                grid[x][y].containsObject = false
                grid[x][y].mine = nil
<<<<<<< HEAD
                grid[x][y].seamonster = nil
                if let _ = grid[x][y].ship {
                    grid[x][y].ship = nil
=======
                if let _ = grid[x][y].metaShip {
                    grid[x][y].metaShip = nil
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
                }
                
                addBackgroundToView(grid[x][y].view, backgroundImage: cellBackgroundImage)
            }
        }
    }
    
    // MARK: Side Length
    
    fileprivate func getSideLength() -> CGFloat {
        let widthwiseSide = frame.size.width / CGFloat(Settings.DefaultGridSize.width)
        let lengthwiseSide = frame.size.height / CGFloat(Settings.DefaultGridSize.height)
        return (widthwiseSide > lengthwiseSide) ? lengthwiseSide : widthwiseSide
    }
    
    // MARK: Add Background To View
    
    fileprivate func addBackgroundToView(_ view: UIView, backgroundImage: UIImage?) {
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = backgroundImage
        view.addSubview(imageView)
        view.sendSubview(toBack: imageView)
    }
    
    // MARK: UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let grid = grid else { return }
        
        let size = Settings.DefaultGridSize
        let sideLength = getSideLength()
        let center = self.center
        self.frame = CGRect(x: 0, y: 0, width: sideLength * CGFloat(size.width), height: sideLength * CGFloat(size.height))
        self.center = center
        
        for x in 0..<size.width {
            for y in 0..<size.height {
                grid[x][y].view.frame = CGRect(x: CGFloat(x) * sideLength, y: CGFloat(y) * sideLength, width: sideLength, height: sideLength)
                for subview in grid[x][y].view.subviews {
                    subview.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: grid[x][y].view.frame.size)
                }
            }
        }
    }
}

// MARK: - GridViewDelegate

extension GridView {
    func didTapCell(_ tapGestureRecognizer: UITapGestureRecognizer) {
        guard let delegate = delegate else { return }
        guard isInteractive else { return }
        
        let tapLocation = tapGestureRecognizer.location(in: self)
        let width = self.frame.size.width / CGFloat(grid.count)
        let height = self.frame.size.height / CGFloat(grid[0].count)
        
        let location = GridLocation(x: Int(tapLocation.x / width), y: Int(tapLocation.y / height))
        delegate.didTapCell(location)
    }
}

// MARK: - Add Images to Grid

extension GridView {
    
    func markImageAtLocation(_ location: GridLocation, image: String, hidden: Bool = false) {
        addImageAtLocation(location, image: image, hidden: hidden)
    }
    
<<<<<<< HEAD
    func markShipPieceAtLocation(_ location: GridLocation, orientation: ShipPieceOrientation, playerType: PlayerType, isWooden: Bool) {
=======
    func markShipPieceAtLocation(_ location: GridLocation, orientation: ShipPieceOrientation, playerType: PlayerType) {
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
        
        // if placing a computer piece, then hide it by default
        let hidden = (playerType == .computer) ? true : false
        
        switch orientation {
        case .endUp:
<<<<<<< HEAD
            if isWooden {
                addImageAtLocation(location, image: Settings.Images.WoodenShipHeadUpWithFlag, hidden: hidden)
            } else {
                addImageAtLocation(location, image: Settings.Images.ShipEndUp, hidden: hidden)
            }
        case .endDown:
            if isWooden {
                addImageAtLocation(location, image: Settings.Images.WoodenShipHeadDown, hidden: hidden)
            } else {
                addImageAtLocation(location, image: Settings.Images.ShipEndDown, hidden: hidden)
            }
        case .endLeft:
            if isWooden {
                addImageAtLocation(location, image: Settings.Images.WoodenShipHeadLeft, hidden: hidden)
            } else {
                addImageAtLocation(location, image: Settings.Images.ShipEndLeft, hidden: hidden)
            }
        case .endRight:
            if isWooden {
                addImageAtLocation(location, image: Settings.Images.WoodenShipHeadRightWithFlag, hidden: hidden)
            } else {
                addImageAtLocation(location, image: Settings.Images.ShipEndRight, hidden: hidden)
            }
        case .bodyHorz:
            if isWooden {
                addImageAtLocation(location, image: Settings.Images.WoodenShipBodyHorz, hidden: hidden)
            } else {
                addImageAtLocation(location, image: Settings.Images.ShipBodyHorz, hidden: hidden)
            }
        case .bodyVert:
            if isWooden {
                addImageAtLocation(location, image: Settings.Images.WoodenShipBodyVert, hidden: hidden)
            } else {
                addImageAtLocation(location, image: Settings.Images.ShipBodyVert, hidden: hidden)
            }
=======
            addImageAtLocation(location, image: Settings.Images.ShipEndUp, hidden: hidden)
        case .endDown:
            addImageAtLocation(location, image: Settings.Images.ShipEndDown, hidden: hidden)
        case .endLeft:
            addImageAtLocation(location, image: Settings.Images.ShipEndLeft, hidden: hidden)
        case .endRight:
            addImageAtLocation(location, image: Settings.Images.ShipEndRight, hidden: hidden)
        case .bodyHorz:
            addImageAtLocation(location, image: Settings.Images.ShipBodyHorz, hidden: hidden)
        case .bodyVert:
            addImageAtLocation(location, image: Settings.Images.ShipBodyVert, hidden: hidden)
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
        }
    }
    
    func revealLocations(_ locations: [GridLocation]) {
        for location in locations {
            for views in grid[location.x][location.y].view.subviews {
                views.isHidden = false
            }
        }
    }
    
    fileprivate func addImageAtLocation(_ location: GridLocation, image: String, hidden: Bool = false) {
        let imageView = UIImageView(image: UIImage(named: image))
        imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: self.grid[location.x][location.y].view.frame.size)
        imageView.isHidden = hidden
        self.grid[location.x][location.y].view.addSubview(imageView)
    }
}
