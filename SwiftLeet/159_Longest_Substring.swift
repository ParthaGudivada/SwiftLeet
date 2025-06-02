//
//  159_Longest_Substring.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/2/25.
//

import Foundation

final class LongestSubStringSolution {
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        let sArr = Array(s)
        let len = sArr.count

        var l = 0
        var maxLen = 0
        var charToIndex = [Character: Int]()

        for r in 0 ..< len {
            let cur = sArr[r]
            charToIndex[cur] = r

            // check for count
            if charToIndex.count > 2 {
                let earliest = charToIndex.values.min()!
                charToIndex[sArr[earliest]] = nil
                l = earliest + 1
            }

            maxLen = max(maxLen, r - l + 1)
        }

        return maxLen
    }
}
