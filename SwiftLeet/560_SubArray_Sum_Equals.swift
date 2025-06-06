//
//  560_SubArray_Sum_Equals.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/30/25.
//

import Foundation

final class SubArraySumSolution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var prefixSumFre = [Int: Int]()
        prefixSumFre[0] = 1
        var curPrefixSum = 0
        var rslt = 0

        for num in nums {
            curPrefixSum += num
            rslt += prefixSumFre[curPrefixSum - k, default: 0]
            prefixSumFre[curPrefixSum, default: 0] += 1
        }

        return rslt
    }
}

final class SubArraySumVariant1Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var prefixSumSet = Set<Int>()
        prefixSumSet.insert(0)
        var prefixSum = 0

        for num in nums {
            prefixSum += num

            if prefixSumSet.contains(prefixSum - k) {
                return true
            }

            prefixSumSet.insert(prefixSum)
        }

        return false
    }
}

final class SubArraySumVariant2Solution {
    func subArraySum(_ nums: [Int], _ k: Int) -> Bool {
        let len = nums.count
        var l = 0
        var curSum = 0

        for r in 0 ..< len {
            curSum += nums[r]

            while curSum > k {
                curSum -= nums[l]
                l += 1
            }

            if curSum == k {
                return true
            }
        }

        return false
    }
}
