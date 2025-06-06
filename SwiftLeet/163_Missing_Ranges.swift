//
//  163_Missing_Ranges.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/26/25.
//

import Foundation

final class MissingRangesSolution {
    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [[Int]] {
        if nums.isEmpty {
            return [[lower, upper]]
        }

        let len = nums.count
        var missing = [[Int]]()

        if lower < nums[0] {
            missing.append([lower, nums[0] - 1])
        }

        for i in stride(from: 0, to: len - 1, by: 1) {
            let cur = nums[i]
            let next = nums[i + 1]

            if next - cur >= 2 {
                missing.append([cur + 1, next - 1])
            }
        }

        if upper > nums[len - 1] {
            missing.append([nums[len - 1] + 1, upper])
        }

        return missing
    }
}

final class MissingRangesVariantSolution {
    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
        var curLower = lower
        var nums = nums
        nums.append(upper + 1)
        var rslt = [String]()

        for num in nums {
            let diff = num - curLower

            if diff == 1 {
                rslt.append(String(curLower))
            } else if diff == 2 {
                rslt.append(String(curLower))
                rslt.append(String(curLower + 1))
            } else if diff > 2 {
                rslt.append("\(curLower)-\(num - 1)")
            }

            curLower = num + 1
        }

        return rslt
    }
}

//let soln = MissingRangesVariantSolution()
//let nums = [5, 8, 9, 15, 16, 18, 20]
//print(soln.findMissingRanges(nums, 2, 87))
