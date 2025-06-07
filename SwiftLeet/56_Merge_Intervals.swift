//
//  56_Merge_Intervals.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/1/25.
//

import Foundation

final class MergeIntervalsSolution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted { $0[0] < $1[0]}
        let len = intervals.count
        var rslt = [[Int]]()
        rslt.append(intervals[0])
        
        for idx in 1 ..< len {
            let cur = intervals[idx]
            
            if let last = rslt.last, cur[0] <= last[1] {
                rslt[rslt.count - 1][1] = max(cur[1], last[1])
            } else {
                rslt.append(cur)
            }
        }
        
        return rslt
    }
}

final class MergeIntervalsVariantSolution {
    func mergeTwo(_ list1: [[Int]], _ list2: [[Int]]) -> [[Int]] {
        let l1 = list1.count
        var i1 = 0

        let l2 = list2.count
        var i2 = 0

        var rslt = [[Int]]()

        while i1 < l1 && i2 < l2 {
            if list1[i1][0] <= list2[i2][0] {
                tryMerge(&rslt, list1[i1])
                i1 += 1
            } else {
                tryMerge(&rslt, list2[i2])
                i2 += 1
            }
        }

        while i1 < l1 {
            tryMerge(&rslt, list1[i1])
            i1 += 1
        }

        while i2 < l2 {
            tryMerge(&rslt, list2[i2])
            i2 += 1
        }

        return rslt
    }

    private func tryMerge(_ rslt: inout [[Int]], _ cur: [Int]) {
        if rslt.isEmpty || cur[0] > rslt.last![1] {
            rslt.append(cur)
        } else {
            let last = rslt.last!
            rslt[rslt.count - 1][1] = max(last[1], cur[1])
        }
    }
}
