//
//  1485_Clone_BinaryTree_Random_Pointer.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/8/25.
//

import Foundation

final class CloneBinaryTreeRandomPointerSolution {
    class Node: Equatable, Hashable {
        var val: Int
        var left: Node?
        var right: Node?
        var random: Node?
        init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
            self.random = nil
        }

        static func == (lhs: Node, rhs: Node) -> Bool {
            lhs === rhs
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(self))
        }
    }

    class NodeCopy: Equatable, Hashable {
        var val: Int
        var left: NodeCopy?
        var right: NodeCopy?
        var random: NodeCopy?
        init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
            self.random = nil
        }

        static func == (lhs: NodeCopy, rhs: NodeCopy) -> Bool {
            lhs === rhs
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(self))
        }
    }

    func copyRandomBinaryTree(_ root: Node?) -> NodeCopy? {
        var oldToCopy = [Node: NodeCopy]()
        return preOrderHelper(root, &oldToCopy)
    }

    private func preOrderHelper(_ node: Node?, _ oldToCopy: inout [Node: NodeCopy]) -> NodeCopy? {
        guard let node else {
            return nil
        }

        if let clonedNode = oldToCopy[node] {
            return clonedNode
        }

        let clone = NodeCopy(node.val)
        oldToCopy[node] = clone

        clone.left = preOrderHelper(node.left, &oldToCopy)
        clone.right = preOrderHelper(node.right, &oldToCopy)
        clone.random = preOrderHelper(node.random, &oldToCopy)

        return clone
    }
}
