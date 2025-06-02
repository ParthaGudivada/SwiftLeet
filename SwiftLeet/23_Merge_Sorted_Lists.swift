//
//  23_Merge_Sorted_Lists.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/2/25.
//

import Foundation
import HeapModule

final class MergeLinkedListsSolution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var heap = Heap<ListNode>()

        for listNode in lists where listNode != nil {
            heap.insert(listNode!)
        }

        let dummy: ListNode? = ListNode(-1)
        var head = dummy

        while !heap.isEmpty {
            let cur = heap.popMin()!

            head?.next = cur
            head = head?.next

            if let next = cur.next {
                heap.insert(next)
            }
        }

        return dummy?.next
    }
}

final class MergeSortedNumArraysSolution {
    struct NumList: Comparable {
        let listIndex: Int
        let index: Int
        let val : Int

        init(_ listIndex: Int, _ index: Int, _ val: Int) {
            self.listIndex = listIndex
            self.index = index
            self.val = val
        }

        static func < (lhs: NumList, rhs: NumList) -> Bool {
            lhs.val < rhs.val
        }
    }

    func mergeArrays(_ nums: [[Int]]) -> [Int] {
        var rslt = [Int]()
        var heap = Heap<NumList>()
        let len = nums.count

        for i in 0 ..< len {
            let cur = nums[i]
            guard !cur.isEmpty else {
                continue
            }
            heap.insert(NumList(i, 0, nums[i][0]))
        }

        while !heap.isEmpty {
            let cur = heap.popMin()!

            rslt.append(cur.val)

            let curList = nums[cur.listIndex]
            let nextIdx = cur.index + 1
            if nextIdx < curList.count {
                heap.insert(NumList(cur.listIndex, nextIdx, curList[nextIdx]))
            }
        }

        return rslt
    }
}

//let soln = MergeSortedNumArraysSolution()
//print(soln.mergeArrays([[1, 3, 5, 7], [0, 2, 4, 6, 8], [20, 22, 24], [21, 23, 25]]))
//print(soln.mergeArrays([[1, 3, 5, 7, 25, 35], [0, 2, 4, 6, 8], [20, 22, 24], [21, 23, 25]]))

final class MergeKSortedListIteratorSolution {
    struct NumList: Comparable {
        let listIndex: Int
        let index: Int
        let val : Int

        init(_ listIndex: Int, _ index: Int, _ val: Int) {
            self.listIndex = listIndex
            self.index = index
            self.val = val
        }

        static func < (lhs: NumList, rhs: NumList) -> Bool {
            lhs.val < rhs.val
        }
    }

    private var heap = Heap<NumList>()
    private var lists: [[Int]]

    init(_ lists: [[Int]]) {
        let len = lists.count
        self.lists = lists
        for i in 0 ..< len {
            heap.insert(NumList(i, 0, lists[i][0]))
        }
    }

    func hasNext() -> Bool {
        !heap.isEmpty
    }

    func next() -> Int {
        guard hasNext() else {
            return Int.min
        }

        let cur = heap.popMin()!

        let nextIdx = cur.index + 1
        let curList = lists[cur.listIndex]

        if nextIdx < curList.count {
            heap.insert(NumList(cur.listIndex, nextIdx, curList[nextIdx]))
        }

        return cur.val
    }
}
