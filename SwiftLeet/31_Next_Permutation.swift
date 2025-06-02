//
//  31_Next_Permutation.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/2/25.
//

import Foundation

final class NextPermutationSolution {
    func nextPermutation(_ nums: inout [Int]) {
        // find pivot index
        let len = nums.count
        var prev = nums[len - 1]
        var pivotIdx = -1

        for idx in stride(from: len - 2, through: 0, by: -1) {
            let cur = nums[idx]

            if cur < prev {
                pivotIdx = idx
                break
            }

            prev = cur
        }

        // if pivot does not exist, then reverse the entire array
        if pivotIdx == -1 {
            nums.reverse()
            return
        }

        // find an element higher than the pivot as we scan from right to left
        for idx in stride(from: len - 1, through: 0, by: -1) {
            if nums[idx] > nums[pivotIdx] {
                nums.swapAt(idx, pivotIdx)
                break
            }
        }

        // reverse the elements after the pivot index
        nums[(pivotIdx + 1)...].reverse()
    }
}

final class PreviousPermutationSolution {
    func previousPermutation(_ nums: inout [Int]) {
        // find pivot index
        let len = nums.count
        var prev = nums[len - 1]
        var pivotIdx = -1

        for idx in stride(from: len - 2, through: 0, by: -1) {
            let cur = nums[idx]

            if cur > prev {
                pivotIdx = idx
                break
            }

            prev = cur
        }

        // if pivot does not exist, then reverse the entire array
        if pivotIdx == -1 {
            nums.reverse()
            return
        }

        // find an element higher than the pivot as we scan from right to left
        for idx in stride(from: len - 1, through: 0, by: -1) {
            if nums[idx] < nums[pivotIdx] {
                nums.swapAt(idx, pivotIdx)
                break
            }
        }

        // reverse the elements after the pivot index
        nums[(pivotIdx + 1)...].reverse()
    }
}

//let soln = PreviousPermutationSolution()
//var nums = [3, 2, 1]
//soln.previousPermutation(&nums)
//print(nums)
//nums = [1, 2, 3]
//soln.previousPermutation(&nums)
//print(nums)
//nums = [9, 4, 8, 3, 5, 5, 8, 9]
//soln.previousPermutation(&nums)
//print(nums)

