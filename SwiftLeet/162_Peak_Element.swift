//
//  162_Peak_Element.swift
//  SwiftLeet
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
        if nums.isEmpty {
            return -1
        }

        let len = nums.count
        if len == 1 {
            return 0
        }

        if nums[0] < nums[1] { return 0 }
        if nums[len - 1] < nums[len - 2] { return len - 1 }

        var l = 1
        var r = len - 2

        while l <= r {
            let m = (l + r) / 2

            if nums[m - 1] > nums[m] && nums[m] < nums[m + 1] {
                return m
            } else if nums[m - 1] < nums[m] {
                r = m - 1
            } else {
                l = m + 1
            }
        }

        return -1
    }
}
