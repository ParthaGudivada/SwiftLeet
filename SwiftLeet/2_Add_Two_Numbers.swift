//
//  2_Add_Two_Numbers.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/6/25.
//

import Foundation

final class AddTwoNumbersSolution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }

        if l2 == nil {
            return l1
        }

        var l1 = l1
        var l2 = l2
        var carry = 0

        var dummy: ListNode? = ListNode(-1)
        var head = dummy

        while l1 != nil || l2 != nil || carry > 0 {
            var sum = carry

            if let node = l1 {
                sum += node.val
                l1 = node.next
            }

            if let node = l2 {
                sum += node.val
                l2 = node.next
            }

            carry = sum / 10
            let newNode = ListNode(sum % 10)
            head?.next = newNode
            head = head?.next
        }

        return dummy?.next
    }
}
