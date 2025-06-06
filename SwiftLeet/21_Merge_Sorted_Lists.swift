//
//  21_Merge_Sorted_Lists.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/6/25.
//

import Foundation

final class MergeSortedListsSolution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var l1 = list1
        var l2 = list2

        var dummy: ListNode? = ListNode(-1)
        var head = dummy

        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                head?.next = l1
                l1 = l1!.next
            } else {
                head?.next = l2
                l2 = l2!.next
            }

            head = head?.next
        }

        head?.next = l1 ?? l2
        return dummy?.next
    }
}

final class MergeSortedListsVariant1Solution {
    func mergeThreeArrays(_ arr1: [Int], _ arr2: [Int], _ arr3: [Int]) -> [Int] {
        var i1 = 0
        let l1 = arr1.count

        var i2 = 0
        let l2 = arr2.count

        var i3 = 0
        let l3 = arr3.count

        var rslt = [Int]()

        while i1 < l1 || i2 < l2 || i3 < l3 {
            let a1 = i1 < l1 ? arr1[i1] : Int.max
            let a2 = i2 < l2 ? arr2[i2] : Int.max
            let a3 = i3 < l3 ? arr3[i3] : Int.max

            let minVal = min(a1, a2, a3)
            rslt.append(minVal)

            if minVal == a1 {
                i1 += 1
            } else if minVal == a2 {
                i2 += 1
            } else if minVal == a3 {
                i3 += 1
            }
        }

        return rslt
    }
}

final class MergeSortedListsVariant2Solution {
    func mergeThreeArrays(_ arr1: [Int], _ arr2: [Int], _ arr3: [Int]) -> [Int] {
        var i1 = 0
        let l1 = arr1.count

        var i2 = 0
        let l2 = arr2.count

        var i3 = 0
        let l3 = arr3.count

        var rslt = [Int]()

        while i1 < l1 || i2 < l2 || i3 < l3 {
            let a1 = i1 < l1 ? arr1[i1] : Int.max
            let a2 = i2 < l2 ? arr2[i2] : Int.max
            let a3 = i3 < l3 ? arr3[i3] : Int.max

            let minVal = min(a1, a2, a3)
            if let last = rslt.last, last != minVal {
                rslt.append(minVal)
            }

            if rslt.isEmpty {
                rslt.append(minVal)
            }

            if minVal == a1 {
                i1 += 1
            } else if minVal == a2 {
                i2 += 1
            } else if minVal == a3 {
                i3 += 1
            }
        }

        return rslt
    }
}

//let soln1 = MergeSortedListsVariant1Solution()
//let arr1 = [1, 1, 2, 2, 3, 4]
//let arr2 = [3, 3, 4, 5, 6]
//let arr3 = [2, 3, 7, 8, 9, 10]
//print(soln1.mergeThreeArrays(arr1, arr2, arr3))
//let soln2 = MergeSortedListsVariant2Solution()
//print(soln2.mergeThreeArrays(arr1, arr2, arr3))
