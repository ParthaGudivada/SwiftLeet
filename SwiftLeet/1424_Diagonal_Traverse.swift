//
//  1424_Diagonal_Traverse.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/3/25.
//

import Foundation
final class DiagonalTraverseImproperSolution {
    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        let rows = nums.count
        var maxKey = 0
        var idxToVals = [Int: [Int]]()

        for r in 0 ..< rows {
            for c in 0 ..< nums[r].count {
                idxToVals[r + c, default: []].append(nums[r][c])
                maxKey = max(maxKey, r + c)
            }
        }

        var rslt = [Int]()

        for i in 0 ... maxKey {
            guard let vals = idxToVals[i] else {
                continue
            }
            rslt.append(contentsOf: vals.reversed())
        }

        return rslt
    }
}

final class DiagonalTraverseImproperVariantSolution {
    func findAntDiagonalOrder(_ nums: [[Int]]) -> [[Int]] {
        let rows = nums.count
        var maxRC = 0
        var idxToVals = [Int: [Int]]()

        for r in 0 ..< rows {
            for c in 0 ..< nums[r].count {
                idxToVals[r + c, default: []].append(nums[r][c])
                maxRC = max(maxRC, r + c)
            }
        }

        var rslt = [[Int]]()

        for i in 0 ... maxRC {
            guard let vals = idxToVals[i] else {
                continue
            }

            rslt.append(vals)
        }

        return rslt
    }
}

//let soln = DiagonalTraverseImproperVariantSolution()
//var nums = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
//print(soln.findAntDiagonalOrder(nums))
//nums = [[1, 3, 6], [2, 5], [4, 7]]
//print(soln.findAntDiagonalOrder(nums))
