//
//  19_Remove_Nth_Node.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/24/25.
//

import Foundation

final class RemoveNthNodeSolution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy: ListNode? = ListNode(-1, head)
        var r = dummy
        var l = dummy

        for _ in 0 ... n {
            r = r?.next
        }

        while r != nil {
            r = r?.next
            l = l?.next
        }

        l?.next = l?.next?.next
        return dummy?.next
    }
}

final class RemoveNthNodeVariantSolution {
    func removeNodeFromBeginning(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy: ListNode? = ListNode(-1, head)
        var l = dummy

        for _ in 0 ... n {
            l = l?.next

            if l == nil {
                return head
            }
        }

        l?.next = l?.next?.next
        return dummy?.next
    }
}
