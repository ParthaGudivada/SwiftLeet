//
//  1094_Car_Pooling.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/6/25.
//

import Foundation

final class CarPoolingSolution {
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var carStops = Array(repeating: 0, count: 1001)

        for trip in trips {
            carStops[trip[1]] += trip[0]
            carStops[trip[2]] -= trip[0]
        }

        var curCapacity = 0

        for delta in carStops {
            curCapacity += delta

            if curCapacity > capacity {
                return false
            }
        }

        return true 
    }
}
