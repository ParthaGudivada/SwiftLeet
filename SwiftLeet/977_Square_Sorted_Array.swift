//
//  977_Square_Sorted_Array.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/4/25.
//

import Foundation

class SquareSortedArraySolution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        let len = nums.count
        var l = 0
        var r = len - 1
        var idx = r
        var rslt = Array(repeating: 0, count: len)

        while l <= r {
            if abs(nums[l]) > abs(nums[r]) {
                rslt[idx] = nums[l] * nums[l]
                l += 1
            } else {
                rslt[idx] = nums[r] * nums[r]
                r -= 1
            }

            idx -= 1
        }

        return rslt 
    }
}
