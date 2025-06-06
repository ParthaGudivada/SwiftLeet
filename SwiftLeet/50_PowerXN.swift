//
//  50_PowerXN.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/30/25.
//

import Foundation

class ExponentialPowerSolution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var base = x
        var exp = abs(n)
        var rslt = 1.0

        while exp > 0 {
            if exp % 2 == 1 {
                rslt *= base
            }

            base *= base
            exp /= 2
        }

        return n < 0 ? ( 1 / rslt) : rslt
    }
}
