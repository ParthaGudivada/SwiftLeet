//
//  162_Peak_Element.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/31/25.
//

import Foundation

final class PeakElementSolution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var l = 0
        var r = nums.count - 1

        while l < r {
            let m = ( l + r ) / 2

            if nums[m] < nums[m + 1] {
                l = m + 1
            } else {
                r = m
            }
        }

        return l
    }
}

final class ValleyElementSolution {
    func findValleyElement(_ nums: [Int]) -> Int {
        var l = 0
        var r = nums.count - 1

        while l < r {
            let m = ( l + r ) / 2

            if nums[m] <= nums[m + 1] {
                r = m
            } else {
                l = m + 1
            }
        }

        return r
    }
}
