//
//  236_Lowest_Common_Ancestor.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/30/25.
//

import Foundation

final class LowestCommonAncestorSolution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        postOrderDFS(root, p, q)
    }

    private func postOrderDFS(_ node: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode?  {
        if node === p || node === q || node == nil {
            return node
        }

        let leftKeyNode = postOrderDFS(node?.left, p, q)
        let rightKeyNode = postOrderDFS(node?.right, p, q)

        if leftKeyNode != nil && rightKeyNode != nil {
            return node
        }

        return leftKeyNode ?? rightKeyNode
    }
}

final class LowestCommonAncestorVariantSolution {
    func lowestCommonAncestor(_ root: NArrNode?, _ p: NArrNode?, _ q: NArrNode?) -> NArrNode? {
        dfs(root, p, q)
    }

    private func dfs(_ node: NArrNode?, _ p: NArrNode?, _ q: NArrNode?) -> NArrNode? {
        if node === p || node === q || node == nil {
            return nil
        }

        var keyNodes = [NArrNode]()
        for child in node!.children {
            guard let keyNode = dfs(child, p, q) else {
                return nil
            }

            keyNodes.append(keyNode)
        }

        if keyNodes.count == 2 {
            return node
        } else if keyNodes.count == 1 {
            return keyNodes[0]
        } else {
            return nil
        }
    }
}
