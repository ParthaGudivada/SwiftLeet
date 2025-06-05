//
//  1011_Capacity_To_Ship_Packages.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/5/25.
//

import Foundation

final class CapacityToShipPackagesSolution {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var l = weights.max()!
        var r = weights.reduce(0, +)
        var rslt = l

        while l <= r {
            let m = ( ( r - l ) / 2 ) + l

            if isCapacitySufficient(m, weights, days) {
                rslt = m
                r = m - 1
            } else {
                l = m + 1
            }
        }

        return rslt
    }

    private func isCapacitySufficient(_ capacity: Int, _ weights: [Int], _ days: Int) -> Bool {
        var avail = capacity
        var neededDays = 1

        for weight in weights {
            if avail - weight < 0 {
                neededDays += 1

                if neededDays > days {
                    return false
                }

                avail = capacity
            }

            avail -= weight
        }

        return true
    }
}
