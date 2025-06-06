//
//  426_Convert_Binary_Tree_To_Sorted.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/24/25.
//

import Foundation

class ConvertBinaryTreeSolution {
    private var first: TreeNode? = nil
    private var last: TreeNode? = nil

    func treeToDoublyList(_ root: TreeNode?) -> TreeNode? {
        inOrder(root)
        return first
    }

    private func inOrder(_ node: TreeNode?) {
        guard let node else {
            return
        }

        inOrder(node.left)
        linkNode(node)
        inOrder(node.right)
    }

    private func linkNode(_ node: TreeNode) {
        if first == nil {
            first = node
        } else {
            last?.right = node
            node.left = last
        }

        last = node
    }
}
