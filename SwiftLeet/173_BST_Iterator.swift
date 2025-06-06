//
//  BSTIterator.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/26/25.
//

import Foundation

class BSTInOrderIteratorSolution {
    private var stack = [TreeNode]()

    init(_ root: TreeNode?) {
        pushLeft(root)
    }
    
    func next() -> Int {
        guard !stack.isEmpty else {
            return Int.min
        }

        let cur = stack.removeLast()
        pushLeft(cur.right)
        return cur.val
    }
    
    func hasNext() -> Bool {
        !stack.isEmpty
    }

    private func pushLeft(_ node: TreeNode?) {
        var node = node

        while node != nil {
            stack.append(node!)
            node = node!.left
        }
    }
}

final class BSTPreOrderIteratorSolution {
    private var stack = [TreeNode]()

    init(_ root: TreeNode?) {
        guard let root else {
            return
        }

        stack.append(root)
    }

    func next() -> Int {
        guard hasNext() else {
            return Int.min
        }

        let cur = stack.removeLast()

        if let right = cur.right {
            stack.append(right)
        }

        if let left = cur.left {
            stack.append(left)
        }

        return cur.val
    }

    func hasNext() -> Bool {
        !stack.isEmpty
    }
}

final class BSTPostOrderIteratorSolution {
    private var stack = [TreeNode]()

    init(_ root: TreeNode?) {
        guard let root else {
            return
        }

        var tempStack = [TreeNode]()
        tempStack.append(root)

        while !tempStack.isEmpty {
            let cur = tempStack.removeLast()
            stack.append(cur)

            if let left = cur.left {
                tempStack.append(left)
            }

            if let right = cur.right {
                tempStack.append(right)
            }

        }

        stack.reverse()
    }

    func next() -> Int {
        guard hasNext() else {
            return Int.min
        }

        return stack.removeLast().val
    }

    func hasNext() -> Bool {
        !stack.isEmpty
    }
}

