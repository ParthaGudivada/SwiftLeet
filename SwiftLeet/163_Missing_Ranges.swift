//
//  163_Missing_Ranges.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/26/25.
//

import Foundation

class MissingRangesSolution {
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

//final class MissingRangesVariantSolution {
//    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
//        var nums = nums
//        nums.append(upper + 1)
//        var curLower = lower
//        var missing = [String]()
//
//        for num in nums {
//            let diff = num - curLower
//
//            if diff == 1 {
//                missing.append("\(curLower)")
//            } else if diff == 2 {
//                missing.append("\(curLower)")
//                missing.append("\(curLower + 1)")
//            } else if diff > 2  {
//                missing.append("\(curLower)-\(num - 1)")
//            }
//
//            curLower = num + 1
//        }
//
//        return missing
//    }
//}

final class MissingRangesVariantSolution {
    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
        var missing = [String]()
        var curLower = lower
        var nums = nums
        nums.append(upper + 1)

        for num in nums {
            let diff = num - curLower
            
            if diff == 1 {
                missing.append("\(curLower)")
            } else if diff == 2 {
                missing.append("\(curLower)")
                missing.append("\(curLower + 1)")
            } else if diff > 2 {
                missing.append("\(curLower)-\(num - 1)")
            }

            curLower = num + 1
        }

        return missing
    }
}
