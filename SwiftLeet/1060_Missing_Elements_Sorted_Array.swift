//
//  1060_Missing_Elements_Sorted_Array.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/6/25.
//

import Foundation

class MissingElementsSortedArraySolution {
    func missingElement(_ nums: [Int], _ k: Int) -> Int {
        let len = nums.count
        var l = 0
        var r = len - 1

        while l <= r {
            let m = ( ( r - l ) / 2 ) + l
            let missing = nums[m] - m - nums[0]

            if missing < k {
                r = m + 1
            } else {
                l = m - 1
            }
        }

        return r + k + nums[0]
    }
}
