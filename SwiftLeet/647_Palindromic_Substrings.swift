//
//  647_Palindromic_Substrings.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/4/25.
//

import Foundation

final class PalindromicSubstringsSolution {
    func countSubstrings(_ s: String) -> Int {
        let sArr = Array(s)
        let len = sArr.count
        var rslt = 0

        for i in 0 ..< len {
            rslt += countOfPalindromes(sArr, len, i, i)

            rslt += countOfPalindromes(sArr, len, i, i + 1)
        }

        return rslt
    }

    private func countOfPalindromes(_ sArr: [Character], _ len: Int, _ l: Int, _ r: Int) -> Int {
        var l = l
        var r = r
        var rslt = 0

        while l >= 0 && r < len {
            if sArr[l] != sArr[r] {
                return rslt
            }

            rslt += 1
            l -= 1
            r += 1
        }

        return rslt
    }
}
