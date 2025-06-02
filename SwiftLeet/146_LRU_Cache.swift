//
//  146_LRU_Cache.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/2/25.
//

import Foundation

final class LRUCache {
    class Node {
        let key: Int
        let val: Int
        var left: Node?
        var right: Node?

        init(_ key: Int, _ val: Int, _ left: Node? = nil, _ right: Node? = nil) {
            self.key = key
            self.val = val
            self.left = left
            self.right = right
        }
    }

    private var keyToNode: [Int: Node]
    private var head: Node
    private var tail: Node
    private let capacity: Int

    init(_ capacity: Int) {
        keyToNode = [Int: Node]()
        head = Node(-1, -1)
        tail = Node(-1, -1)
        self.capacity = capacity

        head.right = tail
        tail.left = head
    }

    func get(_ key: Int) -> Int {
        guard let existing = keyToNode[key] else {
            return -1
        }

        remove(existing)
        moveToEnd(existing)
        return existing.val
    }

    func put(_ key: Int, _ value: Int) {
        // key exist
        if let existing = keyToNode[key] {
            remove(existing)
            keyToNode[key] = nil
        }

        // key does not exist
        let newNode = Node(key, value)
        keyToNode[key] = newNode
        moveToEnd(newNode)

        // dictioanry size exceeds
        if keyToNode.count > capacity {
            let leastUsed = head.right!
            remove(leastUsed)
            keyToNode[leastUsed.key] = nil
        }
    }

    func delete(_ key: Int) -> Bool {
        guard let existing = keyToNode[key] else {
            return false
        }

        remove(existing)
        keyToNode[key] = nil
        return true
    }

    func last() -> Int {
        if tail.left === head {
            return -1
        }

        return tail.left!.val
    }

    private func remove(_ cur: Node) {
        let before = cur.left
        let after = cur.right

        before?.right = after
        after?.left = before
    }

    private func moveToEnd(_ cur: Node) {
        let before = tail.left

        cur.left = before
        before?.right = cur

        cur.right = tail
        tail.left = cur
    }
}
