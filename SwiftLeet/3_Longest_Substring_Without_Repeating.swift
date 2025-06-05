//
//  3_Longest_Substring_Without_Repeating.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/5/25.
//

import Foundation

final class LongestSubstringWithRepeatingSolution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let sArr = Array(s)
        let len = sArr.count
        var l = 0
        var maxLen = 0
        var charToIndex = [Character: Int]()

        for r in 0 ..< len {
            let char = sArr[r]

            if let existIndex = charToIndex[char] {
                l = max(existIndex + 1, l)
            }

            maxLen = max(maxLen, r - l + 1)
            charToIndex[char] = r
        }

        return maxLen
    }
}
