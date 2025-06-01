//
//  215_Kth_Largest_Element.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/26/25.
//

import Foundation
import HeapModule

class KthLargestElementSolution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let len = nums.count
        var heap = Heap<Int>()

        for i in 0 ..< k {
            heap.insert(nums[i])
        }

        for i in k ..< len {
            let cur = nums[i]

            if cur >= heap.min! {
                _ = heap.popMin()
                heap.insert(cur)
            }
        }

        return heap.min!
    }
}

class KthLargestElementVariant1Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let len = nums.count
        let newK = k + 1

        if newK > len {
            return 0
        }

        var numsHeap = Heap<Int>()

        for i in 0 ..< newK {
            numsHeap.insert(nums[i])
        }

        for i in newK ..< len {
            let cur = nums[i]

            if let minVal = numsHeap.min, cur >= minVal {
                _ = numsHeap.popMin()
                numsHeap.insert(cur)
            }
        }

        return numsHeap.min!
    }
}

// this is the kth smallest
class KthLargestElementVariant2Solution {
    func findKthSmallest(_ nums: [Int], _ k: Int) -> Int {
        var numsHeap = Heap<Int>()

        for num in nums {
            numsHeap.insert(-num)

            if numsHeap.count > k {
                _ = numsHeap.popMin()
            }
        }

        return -numsHeap.min!
    }
}
