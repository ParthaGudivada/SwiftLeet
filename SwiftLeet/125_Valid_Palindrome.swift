//
//  125_Valid_Palindrome.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/31/25.
//

import Foundation

final class ValidPalindromeSolution {
    func isPalindrome(_ s: String) -> Bool {
        let sArr = Array(s)
        var l = 0
        var r = sArr.count - 1

        while l <= r {
            if !sArr[l].isAlphaNumeric {
                l += 1
            } else if !sArr[r].isAlphaNumeric {
                r -= 1
            } else {
                if sArr[l].lowercased() != sArr[r].lowercased() {
                    return false
                }

                l += 1
                r -= 1
            }
        }

        return true
    }
}



final class ValidPalindromeVariantSolution {
    func isPalindrome(_ s: String, _ include: [Character]) -> Bool {
        let includeSet = Set(include)

        let sArr = Array(s)
        let len = sArr.count

        var l = 0
        var r = len - 1

        while l <= r {
            if !includeSet.contains(sArr[l]) {
                l += 1
            } else if !includeSet.contains(sArr[r]) {
                r -= 1
            } else {
                if sArr[l] != sArr[r] {
                    return false
                }

                l += 1
                r -= 1
            }
        }

        return true
    }
}
