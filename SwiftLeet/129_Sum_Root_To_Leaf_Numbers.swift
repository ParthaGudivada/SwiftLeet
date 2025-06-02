//
//  129_Sum_Root_To_Leaf_Numbers.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/2/25.
//

import Foundation

final class SumRootToLeafNumbersSolution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        var totSum = 0
        preOrderDFS(root, 0, &totSum)
        return totSum
    }

    private func preOrderDFS(_ node: TreeNode?, _ curSum: Int, _ totSum: inout Int) {
        guard let node else {
            return
        }

        let newSum = curSum * 10 + node.val

        if node.left == nil && node.right == nil {
            totSum += newSum
            return
        }

        preOrderDFS(node.left, newSum, &totSum)
        preOrderDFS(node.right, newSum, &totSum)
    }
}

// node value can have multiple digits
final class SumRootToLeafNumbersVariant1Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        var totSum = 0
        preOrderDFS(root, 0, &totSum)
        return totSum
    }

    private func preOrderDFS(_ node: TreeNode?, _ curSum: Int, _ totSum: inout Int) {
        guard let node else {
            return
        }

        var curVal = node.val
        var tenTimes = 1

        while curVal > 0 {
            tenTimes *= 10
            curVal /= 10
        }

        let newSum = (node.val == 0 ? curSum * 10 : curSum * tenTimes) + node.val

        if node.left == nil && node.right == nil {
            totSum += newSum
            return
        }

        preOrderDFS(node.left, newSum, &totSum)
        preOrderDFS(node.right, newSum, &totSum)
    }
}

// node value is either positive or negative and can range from -9 to +9
// (Negative Path / Positive Path variant)
final class SumRootToLeafNumbersVariant2Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        var totSum = 0
        preOrderDFS(root, 0, 0, &totSum)
        return totSum
    }

    private func preOrderDFS(_ node: TreeNode?, _ curSum: Int, _ negCount: Int, _ totSum: inout Int) {
        guard let node else {
            return
        }

        let curVal = node.val
        let newNegCount = negCount + ( curVal < 0 ? 1 : 0 )
        let newSum = curSum * 10 + abs(curVal)

        if node.left == nil && node.right == nil {
            let finalSign = newNegCount % 2 == 0 ? 1 : -1
            totSum += (newSum * finalSign)
            return
        }

        preOrderDFS(node.left,  newSum, newNegCount, &totSum)
        preOrderDFS(node.right, newSum, newNegCount, &totSum)
    }
}
