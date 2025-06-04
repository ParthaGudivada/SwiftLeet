//
//  498_Diagonal_Traverse.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/3/25.
//

import Foundation

class DiagonalTraverseSolution {
    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        let rows = mat.count
        let cols = mat[0].count
        var idxToVals = [Int: [Int]]()

        for r in 0 ..< rows {
            for c in 0 ..< cols {
                idxToVals[r + c, default: []].append(mat[r][c])
            }
        }

        var rslt = [Int]()
        for i in 0 ... (rows + cols - 2) {
            if let vals = idxToVals[i] {
                if i % 2 == 0 {
                    rslt.append(contentsOf: Array(vals.reversed()))
                } else {
                    rslt.append(contentsOf: vals)
                }
            }
        }

        return rslt
    }
}
