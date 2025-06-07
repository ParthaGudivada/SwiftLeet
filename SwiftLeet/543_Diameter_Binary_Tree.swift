//
//  543_Diameter_Binary_Tree.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/7/25.
//

import Foundation

final class DiameterOfBinaryTreeSolution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var diameter = 0
        height(root, &diameter)
        return diameter
    }

    @discardableResult
    private func height(_ node: TreeNode?, _ diameter: inout Int) -> Int {
        guard let node else {
            return 0
        }

        let leftH = height(node.left, &diameter)
        let rightH = height(node.right, &diameter)
        diameter = max(diameter, leftH + rightH)

        return 1 + max(leftH, rightH)
    }
}

final class DiameterOfNArrTreeSolution {
    func diameterOfNArrTree(_ root: NArrNode) -> Int {
        var diameter = 0
        height(root, &diameter)
        return diameter
    }

    @discardableResult
    private func height(_ node: NArrNode?, _ diameter: inout Int) -> Int {
        guard let node else {
            return 0
        }

        var maxH1 = 0
        var maxH2 = 0

        for child in node.children {
            let ht = height(child, &diameter)

            if ht > maxH1 {
                maxH2 = maxH1
                maxH1 = ht
            } else if ht > maxH2 {
                maxH2 = ht
            }
        }

        diameter = max(diameter, maxH1 + maxH2)
        return 1 + maxH1
    }
}
