//
//  347_Top_K_Frequent_Elements.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/31/25.
//

import Foundation

class TopKFrequentElementsSolution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        let len = nums.count
        var numToFre = [Int: Int]()

        for num in nums {
            numToFre[num, default: 0] += 1
        }

        var buckets = Array(repeating: [Int](), count: len + 1)

        for (num, fre) in numToFre {
            buckets[fre].append(num)
        }

        var rslt = [Int]()

        for i in stride(from: buckets.count - 1, through: 0, by: -1) {
            for num in buckets[i] {
                rslt.append(num)

                if rslt.count == k {
                    return rslt
                }
            }
        }

        return rslt
    }
}
