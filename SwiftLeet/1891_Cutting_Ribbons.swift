//
//  1891_Cutting_Ribbons.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/5/25.
//

import Foundation

final class CuttingRibbonsSolution {
    func maxLength(_ ribbons: [Int], _ k: Int) -> Int {
        var l = 1
        var r = ribbons.max() ?? 0

        var rslt = 0

        while l <= r {
            let m = ( ( r - l ) / 2 ) + l

            var cuts = 0
            for ribbon in ribbons {
                cuts += ( ribbon / m )
            }

            if cuts >= k {
                rslt = m
                l = m + 1
            } else {
                r = m - 1
            }
        }

        return rslt
    }
}
