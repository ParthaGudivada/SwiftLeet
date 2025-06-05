//
//  124_Binary_Tree_Path_Maximum.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/5/25.
//

import Foundation

final class BinaryTreePathMaximumSolution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = Int.min
        _ = dfs(root, &maxSum)
        return maxSum
    }

    private func dfs(_ node: TreeNode?, _ maxSum: inout Int) -> Int  {
        guard let node else {
            return 0
        }

        let lMax = max(dfs(node.left, &maxSum), 0)
        let rMax = max(dfs(node.right, &maxSum), 0)

        // global maximum tacking
        maxSum = max(maxSum, lMax + node.val + rMax)

        // local value
        return node.val + max(lMax, rMax)
    }
}
