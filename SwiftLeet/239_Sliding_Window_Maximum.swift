//
//  Solution 3.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/29/25.
//

import Collections

final class Sliding_Window_MaximumSolution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var idxArr = Deque<Int>()
        var rslt = [Int]()

        for (i, val) in nums.enumerated() {
            while let j = idxArr.last,  nums[j] < val {
                idxArr.removeLast()
            }

            idxArr.append(i)

            if let first = idxArr.first, first == i - k {
                idxArr.removeFirst()
            }

            if let first = idxArr.first, i >= k - 1 {
                rslt.append(nums[first])
            }
        }

        return rslt
    }
}
