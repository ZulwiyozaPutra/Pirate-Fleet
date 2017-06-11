//
//  Protocols-Extensions.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 8/26/15.
<<<<<<< HEAD
=======
//  Modified by Zulwiyoza Putra on 11/25/16.
>>>>>>> df6bc0c922ceb4137eb2f8d6fbe7757a7fc21d4f
//  Copyright © 2015 Udacity. All rights reserved.
//

// MARK: - GridLocation (+ Hashable, Equatable)

extension GridLocation: Hashable {
    var hashValue: Int {
        return x.hashValue ^ y.hashValue
    }
}

func ==(lhs: GridLocation, rhs: GridLocation) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}
