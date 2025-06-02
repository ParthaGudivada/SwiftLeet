//
//  14_Longest_Common_Prefix.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/2/25.
//

import Foundation

final class LongestCommonPrefixSolution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let baseStr = strs.first else {
            return ""
        }

        var prefix = baseStr

        for str in strs.dropFirst() {
            while !str.hasPrefix(prefix) {
                prefix = String(prefix.dropLast())

                if prefix.isEmpty {
                    return ""
                }
            }
        }

        return prefix
    }
}
