//
//  5_Longest_Palindromic_Substring.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/5/25.
//

import Foundation

final class LongestPalindromicSubstringSolution {
    func longestPalindrome(_ s: String) -> String {
        let sArr = Array(s)
        let len = sArr.count

        var maxLen = 0
        var str = ""

        for i in 0 ..< len {
            palinString(sArr, i, i,     len, &maxLen, &str)
            palinString(sArr, i, i + 1, len, &maxLen, &str)
        }

        return str
    }

    private func palinString(
        _ sArr: [Character], _ l: Int, _ r: Int, _ len: Int,
        _ maxLen: inout Int, _ str: inout String
    ) {
        var l = l
        var r = r

        while l >= 0 && r < len && sArr[l] == sArr[r] {
            if r - l + 1 > maxLen {
                maxLen = r - l + 1
                str = String(sArr[l ... r])
            }

            l -= 1
            r += 1
        }
    }
}
