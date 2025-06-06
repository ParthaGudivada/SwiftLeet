//
//  26_Remove_Duplicates_Sorted_Array.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/6/25.
//

import Foundation

class RemoveDuplicatesSortedArraySolution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let len = nums.count
        var l = 0

        for r in 0 ..< len {
            if nums[r] != nums[l] {
                l += 1
                nums.swapAt(r, l)
            }
        }

        return l + 1
    }
}
