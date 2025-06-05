//
//  75_Sort_Colors.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/4/25.
//

import Foundation

final class SortColorsSolution {
    func sortColors(_ nums: inout [Int]) {
        var l = 0
        var m = 0
        var h = nums.count - 1

        while m <= h {
            if nums[m] == 0 {
                nums.swapAt(l, m)
                l += 1
                m += 1
            } else if nums[m] == 1 {
                m += 1
            } else {
                nums.swapAt(m, h)
                h -= 1
            }
        }
    }
}
