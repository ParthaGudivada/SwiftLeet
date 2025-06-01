//
//  987_Vertical_Order_Traversal_Binary_Tree.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/23/25.
//

import Foundation

class VerticalOrderTraversalBinaryTreeSolution {
    struct PosNode {
        let row: Int
        let col: Int
        let node: TreeNode

        init(_ row: Int, _ col: Int, _ node: TreeNode) {
            self.row = row
            self.col = col
            self.node = node
        }
    }

    struct RowVal {
        let row: Int
        let val: Int

        init(_ row: Int, _ val: Int) {
            self.row = row
            self.val = val
        }
    }


    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        guard let root else {
            return []
        }

        var colMin = 0
        var colMax = 0
        var colToRowVals = [Int: [RowVal]]()
        var queue = [PosNode]()
        queue.append(PosNode(0, 0, root))

        while !queue.isEmpty {
            let cur = queue.removeFirst()

            colMin = min(colMin, cur.col)
            colMax = max(colMax, cur.col)
            colToRowVals[cur.col, default: []].append(RowVal(cur.row, cur.node.val))

            if let left = cur.node.left {
                queue.append(PosNode(cur.row + 1, cur.col - 1, left))
            }

            if let right = cur.node.right {
                queue.append(PosNode(cur.row + 1, cur.col + 1, right))
            }
        }

        var rslt = [[Int]]()
        for i in stride(from: colMin, through: colMax, by: 1) {
            guard let rowVals = colToRowVals[i] else {
                continue
            }

            let sortedRowVals = rowVals.sorted { $0.row < $1.row || $0.row == $1.row && $0.val < $1.val}
            rslt.append(sortedRowVals.map { $0.val })
        }

        return rslt
    }
}
