//
//  1650_LCA_III.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/30/25.
//

import Foundation

final class NodeP {
    let val: Int
    var left: NodeP?
    var right: NodeP?
    var parent: NodeP?

    init(_ val: Int, _ left: NodeP? = nil, _ right: NodeP? = nil, _ parent: NodeP? = nil) {
        self.val = val
        self.left = left
        self.right = right
        self.parent = parent
    }
}

final class LowestCommonAncestorIIISolution {
    func lowestCommonAncestor(_ p: NodeP?,_ q: NodeP?) -> NodeP? {
        var pStart = p
        var qStart = q

        while pStart !== qStart {
            if pStart == nil {
                pStart = q
            } else {
                pStart = pStart!.parent
            }

            if qStart == nil {
                qStart = p
            } else {
                qStart = qStart!.parent
            }

        }

        return pStart
    }
}

final class LowestCommonAncestorVariantcSolution {
    func findLCA(
        _ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?,
        _ allNodes: [TreeNode]
    ) -> TreeNode? {
        var childToParentNode = [TreeNode: TreeNode]()

        for node in allNodes {
            if let left = node.left {
                childToParentNode[left] = node
            }

            if let right = node.right {
                childToParentNode[right] = node
            }
        }

        var pStart = p
        var qStart = q

        while pStart != qStart {
            if pStart == nil {
                pStart = q
            } else {
                if let parent = childToParentNode[pStart!] {
                    pStart = parent
                } else {
                    pStart = q
                }
            }

            if qStart == nil {
                qStart = p
            } else {
                if let parent = childToParentNode[qStart!] {
                    qStart = parent
                } else {
                    qStart = p
                }
            }
        }

        return pStart
    }
}
