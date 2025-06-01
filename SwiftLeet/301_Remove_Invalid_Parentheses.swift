//
//  301_Remove_Invalid_Parentheses.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/29/25.
//

import Foundation

class RemoveInvalidParanthesesSolution {
    func removeInvalidParentheses(_ s: String) -> [String] {
        var queue = [String]()
        var visited = Set<String>()
        var rslt = [String]()
        var found = false

        queue.append(s)

        while !queue.isEmpty {
            let cur = queue.removeFirst()

            if isValid(cur) {
                rslt.append(cur)
                found = true
            }

            if found {
                continue
            }

            for index in cur.indices {
                guard cur[index] == "(" || cur[index] == ")" else {
                    continue
                }

                var str = cur
                str.remove(at: index)

                if !visited.contains(str) {
                    queue.append(str)
                    visited.insert(str)
                }
            }
        }

        return rslt
    }

    private func isValid(_ str: String) -> Bool {
        var openParen = 0

        for char in str {
            if char == "(" {
                openParen += 1
            } else if char == ")" {
                if openParen > 0 {
                    openParen -= 1
                } else {
                    return false
                }
            }
        }

        return openParen == 0
    }
}
