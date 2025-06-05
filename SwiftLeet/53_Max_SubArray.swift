//
//  53_Max_SubArray.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/5/25.
//

import Foundation

final class MaxSubArraySolution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSum = Int.min
        var sum = 0

        for num in nums {
            sum += num
            maxSum = max(maxSum, sum)
            sum = sum < 0 ? 0 : sum
        }

        return maxSum
    }
}
