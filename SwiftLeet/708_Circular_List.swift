//
//  CircularListSolution.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/4/25.
//

final class CircularListSolution {
    class Node: Equatable, Comparable {
        let val: Int
        var next: Node?

        init(_ val: Int, _ next: Node? = nil) {
            self.val = val
            self.next = next
        }

        static func == (lhs: Node, rhs: Node) -> Bool {
            lhs === rhs
        }

        static func < (lhs: Node, rhs: Node) -> Bool {
            lhs.val < rhs.val
        }
    }

    func insert(_ head: Node?, _ insertVal: Int) -> Node? {
        let newNode = Node(insertVal)

        guard let head else {
            newNode.next = newNode
            return newNode
        }

        var before = head
        var after = head.next!

        while true {
            // 1. when the element value is in between the two nodes
            if before.val <= insertVal && insertVal <= after.val {
                break
            }

            // 2. roation point :  max -> min
            if before.val > after.val &&
                (before.val <= insertVal || insertVal <= after.val) {
                break
            }

            before = after
            after = after.next!
            // 3. when all nodes have same value and we reached head again
            if before == head {
                break
            }
        }

        before.next = newNode
        newNode.next! = after

        return head
    }
}
