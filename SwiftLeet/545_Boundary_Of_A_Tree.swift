//
//  545_Boundary_Of_A_Tree.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/27/25.
//

import Foundation

class BoundaryOfATreeSolution {
    private var rslt = [Int]()

    func boundaryOfBinaryTree(_ root: TreeNode?) -> [Int] {
        guard let root else {
            return []
        }

        if !isLeaf(root) {
            rslt.append(root.val)
        }

        leftBounds(root.left)
        addLeaves(root)
        rightBounds(root.right)

        return rslt
    }

    private func isLeaf(_ node: TreeNode) -> Bool {
        node.left == nil && node.right == nil
    }

    private func leftBounds(_ node: TreeNode?) {
        var cur = node

        while let c = cur {
            if !(isLeaf(c)) {
                rslt.append(c.val)
            }

            cur = c.left ?? c.right
        }
    }

    private func rightBounds(_ node: TreeNode?) {
        var temp = [Int]()
        var cur = node

        while let c = cur {
            if !(isLeaf(c)) {
                temp.append(c.val)
            }

            cur = c.right ?? c.left
        }

        rslt += temp.reversed()
    }

    private func addLeaves(_ node: TreeNode?) {
        guard let node else {
            return
        }

        if isLeaf(node) {
            rslt.append(node.val)
        } else {
            addLeaves(node.left)
            addLeaves(node.right)
        }
    }
}
