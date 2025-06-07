//
//  523_Continuous_SubArray_Sum.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/7/25.
//

import Foundation

final class ContinuousSubArraySumSolution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var prefixSumModToIdx = [Int: Int]()
        prefixSumModToIdx[0] = -1
        var prefixSum = 0

        for (idx, num) in nums.enumerated() {
            prefixSum += num
            let curMod = prefixSum % k

            if let prevIdx = prefixSumModToIdx[curMod] {
                if idx - prevIdx >= 2 {
                    return true
                }
            } else {
                prefixSumModToIdx[curMod] = idx
            }
        }

        return false
    }
}
