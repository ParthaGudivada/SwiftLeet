//
//  270_Closest_Binary_Search_Tree.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/24/25.
//

import Foundation

final class ClosestBinarySearchTreeSolution {
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        var node = root

        var closest = Double(Int.max)
        var rslt = 0

        while node != nil {
            let curVal = node!.val
            let dist = abs(target - Double(curVal))

            if dist == 0 {
                return curVal
            }

            if dist < closest || dist == closest && curVal < rslt {
                closest = dist
                rslt = curVal
            }

            if Double(curVal) < target {
                node = node?.right
            } else {
                node = node?.left
            }
        }

        return rslt
    }
}
