//
//  9_Palindrome_Number.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/6/25.
//

import Foundation

final class PalindromeNumberSolution {
    func isPalindrome(_ x: Int) -> Bool {
        if ( x < 0 ) || ( ( x % 10 == 0 ) && x != 0 ) {
            return false
        }

        var x = x
        var reversed = 0

        while x > reversed {
            reversed = reversed * 10 + ( x % 10 )
            x /= 10
        }

        return ( x == reversed ) || ( x == ( reversed / 10 ) )
    }
}
