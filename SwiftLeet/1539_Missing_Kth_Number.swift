//
//  1539_Missing_Kth_Number.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/23/25.
//

import Foundation

final class MissingKthNumberSolution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var l = 0
        var r = arr.count - 1

        while l <= r  {
            let m = ( (r - l) / 2) + l
            let missing = arr[m] - m - 1

            if missing < k {
                l = m + 1
            } else {
                r = m - 1
            }
        }

        return k + r + 1
    }
}

final class MissingKthNumberVariantSolution {
    func findKthPositiveFromStart(_ arr: [Int], _ k: Int) -> Int {
        var left = 0
        var right = arr.count - 1

        while left <= right {
            let mid = ( ( right - left ) / 2) + left
            let missing = arr[mid] - mid - arr[0]

            if missing < k {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return k + right + arr[0]
    }
}
