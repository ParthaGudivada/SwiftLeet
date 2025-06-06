//
//  34_Find_First_Last_Position.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/23/25.
//

import Foundation

final class FindFirstLastPositionSolution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let lIdx = binSearchIdx(nums, target, true)
        let rIdx = binSearchIdx(nums, target, false)
        return [lIdx, rIdx]
    }

    private func binSearchIdx(_ nums: [Int], _ target: Int, _ leftBias: Bool) -> Int {
        var l = 0
        var r = nums.count - 1
        var startIdx = -1

        while l <= r {
            let m = ( ( r - l ) / 2 ) + l
            let cur = nums[m]

            if cur < target {
                l = m + 1
            } else if cur > target {
                r = m - 1
            } else {
                startIdx = m

                if leftBias {
                    r = m - 1
                } else {
                    l = m + 1
                }
            }
        }

        return startIdx
    }
}

final class FindFirstLastPositionVariant1Solution {
    func countOfTargetIn(_ nums: [Int], _ target: Int) -> Int {
        let lIdx = binSearchIdx(nums, target, true)
        let rIdx = binSearchIdx(nums, target, false)

        if rIdx == -1 || lIdx == -1 {
            return 0
        }

        return rIdx - lIdx + 1
    }

    private func binSearchIdx(_ nums: [Int], _ target: Int, _ leftBias: Bool) -> Int {
        var l = 0
        var r = nums.count - 1
        var startIdx = -1

        while l <= r {
            let m = ( ( r - l ) / 2) + l
            let cur = nums[m]

            if cur < target {
                l = m + 1
            } else if cur > target {
                r = m - 1
            } else {
                startIdx = m

                if leftBias {
                    r = m - 1
                } else {
                    l = m + 1
                }
            }
        }

        return startIdx
    }
}

//let soln = FindFirstLastPositionVariant1Solution()
//let nums = [2, 2, 3, 3, 3, 9, 9, 9, 9, 9, 10, 12, 12]
//print(soln.countOfTargetIn(nums, 3))
//print(soln.countOfTargetIn(nums, 2))
//print(soln.countOfTargetIn(nums, 12))
//print(soln.countOfTargetIn(nums, 15))

final class FindFirstLastPositionVariant2Solution {
    func countOfUniqueElements(_ nums: [Int]) -> Int {
        var rslt = 0
        let len = nums.count

        var l = 0

        while l < len {
            let cur = nums[l]
            let endIdxOfCur = binSearchEndIdx(nums, cur)

            if endIdxOfCur == -1 {
                break
            }

            rslt += 1
            l = endIdxOfCur + 1
        }

        return rslt
    }

    private func binSearchEndIdx(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1
        var idx = -1

        while l <= r {
            let m = ( ( r - l ) / 2 ) + l
            let cur = nums[m]


            if cur < target {
                l = m + 1
            } else if cur > target {
                r = m - 1
            } else {
                idx = m

                // move the index towards right as we always start with the left idx
                l = m + 1
            }
        }

        return idx
    }
}

//let soln = FindFirstLastPositionVariant2Solution()
//let nums = [2, 2, 3, 3, 3, 9, 9, 9, 9, 9, 10, 12, 12]
//print(soln.countOfUniqueElements(nums))
