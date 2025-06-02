//
//  986_Interval_List_Intersection.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/2/25.
//

import Foundation

final class IntervalListIntersectionSolution {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        let list1 = firstList
        let l1 = list1.count
        var i1 = 0

        let list2 = secondList
        let l2 = list2.count
        var i2 = 0

        var rslt = [[Int]]()

        while i1 < l1 && i2 < l2 {
            let p1 = list1[i1]
            let p2 = list2[i2]

            let beg = max(p1[0], p2[0])
            let end = min(p1[1], p2[1])

            if beg <= end {
                rslt.append([beg, end])
            }

            if p1[1] < p2[1] {
                i1 += 1
            } else {
                i2 += 1
            }
        }

        return rslt
    }
}
