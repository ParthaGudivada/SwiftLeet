//
//  138_Copy_Random_Pointer.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/8/25.
//

import Foundation

final class CopyRandomPointerSolution {
    class Node {
        var val: Int
        var next: Node?
        var random: Node?

        init(_ val: Int) {
            self.val = val
            next = nil
            random = nil
        }
    }

    func copyRandomList(_ head: Node?) -> Node? {
        // weave: insert cloned node
        var cur = head
        while cur != nil {
            let clone = Node(cur!.val)
            clone.next = cur!.next

            cur!.next = clone
            cur = clone.next
        }

        // assign: assing random pointer
        cur = head
        while cur != nil {
            cur!.next?.random = cur!.random?.next
            cur = cur!.next?.next
        }

        // unweave: extract cloned node
        var dummy: Node? = Node(-1)
        var clone = dummy

        cur = head
        while cur != nil {
            clone?.next = cur!.next
            clone = clone?.next

            cur!.next = clone?.next
            cur = cur!.next
        }

        return dummy?.next
    }
}
