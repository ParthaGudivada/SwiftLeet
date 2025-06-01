//
//  19_Remove_Nth_Node.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/24/25.
//

import Foundation

class RemoveNthNodeSolution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummy: ListNode? = ListNode(-1, head)
        var r = dummy
        var l = dummy

        for i in 0 ... n {
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

class RemoveNthNodeVariantSolution {
    func removeNthFromBeginning(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummy: ListNode? = ListNode(-1, head)
        var l = dummy

        for i in 0 ... n {
            l = l?.next

            if l == nil {
                return head
            }
        }

        l?.next = l?.next?.next
        return dummy?.next
    }
}
