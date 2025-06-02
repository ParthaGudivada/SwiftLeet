//
//  1570_Dot_Product_Sparse_Vectors.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/2/25.
//

import Foundation

final class SparseVector {
    struct IdxToNum {
        let idx: Int
        let num: Int

        init(_ idx: Int, _ num: Int) {
            self.idx = idx
            self.num = num

        }
    }

    private(set) var idxNums = [IdxToNum]()

    init(_ nums: [Int]) {
        for (i, val) in nums.enumerated() where val != 0 {
            idxNums.append(IdxToNum(i, val))
        }
    }

    // Return the dotProduct of two sparse vectors
    func dotProduct(_ vec: SparseVector) -> Int {
        let other = vec.idxNums

        let l1 = idxNums.count
        var i1 = 0

        let l2 = other.count
        var i2 = 0

        var rslt = 0

        while ( i1 < l1 && i2 < l2 ) {
            let f1 = idxNums[i1]
            let f2 = other[i2]

            if f1.idx == f2.idx {
                rslt += f1.num * f2.num
                i1 += 1
                i2 += 1
            } else if f1.idx < f2.idx {
                i1 += 1
            } else {
                i2 += 1
            }
        }

        return rslt
    }
}

