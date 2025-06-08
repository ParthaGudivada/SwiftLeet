//
//  480_Find_Sliding_Median.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/2/25.
//

import Foundation

final class SlidingMedianSolution {
    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        let len = nums.count
        var rslt = [Double]()
        var window = nums[0 ..< k].sorted()

        for i in k ..< len {
            rslt.append(median(window))

            if let firstIndex = window.firstIndex(of: nums[i - k]) {
                window.remove(at: firstIndex)
            }

            var l = 0
            var r = window.count
            let cur = nums[i]

            while l < r {
                let m = (l + r) / 2

                if window[m] < cur {
                    l = m + 1
                } else {
                    r = m
                }
            }

            window.insert(cur, at: l)
        }

        rslt.append(median(window))
        return rslt
    }

    private func median(_ window: [Int]) -> Double {
        let k = window.count

        if k % 2 == 1 {
            return Double( window[k / 2] )
        } else {
            return Double( window[k / 2]   + window[ (k - 1) / 2] ) / 2.0
        }
    }
}
