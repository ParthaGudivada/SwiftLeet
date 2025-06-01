//
//  34_Find_First_Last_Position.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/23/25.
//

import Foundation

final class FindFirstLastPositionSolution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let lIdx = binSearch(nums, target, true)
        let rIdx = binSearch(nums, target, false)
        return [lIdx, rIdx]
    }

    private func binSearch(_ nums: [Int], _ target: Int, _ leftBias: Bool) -> Int {
        var l = 0
        var r = nums.count - 1
        var idx = -1

        while l <= r {
            let m = ((r - l) / 2) + l
            let val = nums[m]

            if val == target {
                idx = m

                if leftBias {
                    r = m - 1
                } else {
                    l = m + 1
                }
            } else if val < target {
                l = m + 1
            } else {
                r = m - 1
            }
        }

        return idx
    }
}

final class FindFirstLastPositionVariant1Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> Int {
        let lIdx = binSearch(nums, target, true)
        let rIdx = binSearch(nums, target, false)

        if rIdx == -1 || lIdx == -1 {
            return 0
        }

        return rIdx - lIdx + 1
    }

    private func binSearch(_ nums: [Int], _ target: Int, _ leftBias: Bool) -> Int {
        var l = 0
        var r = nums.count - 1
        var idx = -1

        while l <= r {
            let m = ((r - l) / 2) + l
            let val = nums[m]

            if val == target {
                idx = m

                if leftBias {
                    r = m - 1
                } else {
                    l = m + 1
                }
            } else if val < target {
                l = m + 1
            } else {
                r = m - 1
            }
        }

        return idx
    }
}

final class FindFirstLastPositionVariant2Solution {
    func countOfUniqueElements(_ nums: [Int]) -> Int {
        var rslt = 0
        var r = 0

        while r < nums.count {
            let tar = nums[r]

            let lastIdxOfTar = binSearch(nums, tar)
            if lastIdxOfTar != -1 {
                rslt += 1
                r = lastIdxOfTar + 1
            } else {
                break
            }
        }


        return rslt
    }

    private func binSearch(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1
        var idx = -1

        while l <= r {
            let m = (( r - l ) / 2) + l
            let val = nums[m]

            if val == target {
                idx = m

                l = m + 1
            } else if val < target {
                l = m + 1
            } else {
                r = m - 1
            }
        }

        return idx
    }
}
