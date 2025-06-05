//
//  896_Monotonic_Array.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/4/25.
//

import Foundation

final class MonotonicArraySolution {
    func isMonotonic(_ nums: [Int]) -> Bool {
        let len = nums.count
        var mInc = true
        var mDec = true

        for i in 1 ..< len {
            if nums[i] > nums[i - 1] {
                mDec = false
            }

            if nums[i] < nums[i - 1] {
                mInc = false
            }

            if mInc == false && mDec == false {
                return false
            }
        }

        return true
    }
}

final class MonotonicArrayVariantSolution {
    enum MonoType {
        case increasing
        case decreasing
        case neither
    }

    func countMonotonicSequences(_ nums: [Int]) -> Int {
        var rslt = 0
        var monoType: MonoType = .neither
        let len = nums.count

        for i in 1 ..< len {
            let cur = nums[i]
            let prev = nums[i - 1]

            if cur > prev {
                if monoType != .increasing {
                    rslt += 1
                    monoType = .increasing
                }

            } else if cur < prev {
                if monoType != .decreasing {
                    rslt += 1
                    monoType = .decreasing
                }
            } else {
                monoType = .neither
            }
        }

        return rslt
    }
}

//let soln = MonotonicArrayVariantSolution()
//var nums = [5, 5, 5, 5, 9, 4, 1]
//print(soln.countMonotonicSequences(nums))
//nums = [1, 1, 1, 1]
//print(soln.countMonotonicSequences(nums))
//nums = [1, 2, 3, 4, 3, 2, 1, 2, 3, 4]
//print(soln.countMonotonicSequences(nums))
