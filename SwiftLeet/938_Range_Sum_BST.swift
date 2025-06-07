//
//  938_Range_Sum_BST.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/1/25.
//

import Foundation

final class RangeSumBSTSolution {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root else {
            return 0
        }

        var stack = [TreeNode]()
        stack.append(root)
        var rslt = 0

        while !stack.isEmpty {
            let cur = stack.removeLast()

            if cur.val >= low && cur.val <= high {
                rslt += cur.val
            }

            if let left = cur.left, cur.val >= low {
                stack.append(left)
            }

            if let right = cur.right, cur.val <= high {
                stack.append(right)
            }
        }

        return rslt
    }
}

final class RangeSumBSTVariant2Solution {
    private var vals = [Int]()
    private var preSum = [Int]()

    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root else {
            return 0
        }

        inOrder(root)
        let lIdx = findLBoundIdx(vals, low)
        let rIdx = findRBoundIdx(vals, high)

        return preSum[rIdx] - ( lIdx > 0 ? preSum[lIdx - 1] : 0 )
    }

    private func inOrder(_ node: TreeNode?) {
        guard let node else {
            return
        }

        inOrder(node.left)

        vals.append(node.val)

        if preSum.isEmpty {
            preSum.append(node.val)
        } else {
            preSum.append(preSum.last! + node.val)
        }

        inOrder(node.right)
    }

    private func findLBoundIdx(_ vals: [Int], _ lower: Int) -> Int {
        var l = 0
        var r = vals.count - 1

        while l <= r {
            let m = ( l + r ) / 2

            if vals[m] >= lower {
                r = m - 1
            } else {
                l = m + 1
            }
        }

        return l
    }

    private func findRBoundIdx(_ vals: [Int], _ upper: Int) -> Int {
        var l = 0
        var r = vals.count - 1

        while l <= r {
            let m = ( l + r ) / 2

            if vals[m] <= upper {
                l = m + 1
            } else {
                r = m - 1
            }
        }

        return r
    }
}
