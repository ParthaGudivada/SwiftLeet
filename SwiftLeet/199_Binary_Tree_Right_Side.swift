//
//  199_Binary_Tree_Right_Side.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/31/25.
//

import Foundation

class BinaryTreeRightSideSolution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root else {
            return []
        }

        var rslt = [Int]()
        var queue = [TreeNode]()
        queue.append(root)

        while !queue.isEmpty {
            let size = queue.count

            for i in 0 ..< size {
                let cur = queue.removeFirst()

                if i == size - 1 {
                    rslt.append(cur.val)
                }

                if let left = cur.left {
                    queue.append(left)
                }

                if let right = cur.right {
                    queue.append(right)
                }
            }
        }

        return rslt
    }
}

class BinaryTreeBothSideSolution {
    func bothSideViews(_ root: TreeNode?) -> [Int] {
        guard let root else {
            return []
        }

        var lSide = [Int]()
        var rSide = [Int]()

        var queue = [TreeNode]()
        queue.append(root)

        while !queue.isEmpty {
            let size = queue.count

            for i in 0 ..< size {
                let cur = queue.removeFirst()

                if i == 0 {
                    lSide.append(cur.val)
                }

                if i + 1 == size  {
                    rSide.append(cur.val)
                }

                if let left = cur.left {
                    queue.append(left)
                }

                if let right = cur.right {
                    queue.append(right)
                }
            }
        }

        return lSide + rSide[1...]
    }
}
