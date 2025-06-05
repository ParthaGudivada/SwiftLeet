//
//  896_Monotonic_Array.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/4/25.
//

import Foundation

class MonotonicArraySolution {
    func isMonotonic(_ nums: [Int]) -> Bool {
        let len = nums.count
        var mInc = true
        var mDec = true

        for i in 1 ..< len {
            if nums[i] > nums[i - 1] {
                mDec = false
            }

            if nums[i] < nums[i - 1] {
                mInc = false
            }

            if mInc == false && mDec == false {
                return false
            }
        }

        return true
    }
}
