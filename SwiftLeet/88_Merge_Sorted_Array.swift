//
//  88_Merge_Sorted_Array.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/4/25.
//

import Foundation

class MergeSortedArraySolution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var l1 = m - 1
        var l2 = n - 1
        var tot = m + n - 1

        while l1 >= 0 && l2 >= 0 {
            if nums1[l1] > nums2[l2] {
                nums1[tot] = nums1[l1]
                l1 -= 1
            } else {
                nums1[tot] = nums2[l2]
                l2 -= 1
            }

            tot -= 1
        }

        while l1 >= 0 {
            nums1[tot] = nums1[l1]
            l1 -= 1
            tot -= 1
        }

        while l2 >= 0 {
            nums1[tot] = nums2[l2]
            l2 -= 1
            tot -= 1
        }
    }
}
