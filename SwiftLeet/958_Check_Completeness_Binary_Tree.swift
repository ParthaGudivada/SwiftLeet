//
//  958_Check_Completeness_Binary_Tree.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/5/25.
//

import Foundation

final class CheckCompletenessBinaryTreeSolution {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        var queue = [TreeNode?]()
        queue.append(root)

        var didSeeNil = false

        while !queue.isEmpty {
            let cur = queue.removeFirst()

            if let node = cur {
                if didSeeNil {
                    return false
                }

                queue.append(node.left)
                queue.append(node.right)
            } else {
                didSeeNil = true
            }
        }

        return true 
    }
}
