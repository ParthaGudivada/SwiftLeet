//
//  1047_Remove_All_Adjacent_Duplicates.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/6/25.
//

import Foundation

final class RemoveAllAdjacentDuplicatesSolution {
    func removeDuplicates(_ s: String) -> String {
        var stack = [Character]()

        for char in s {
            if let last = stack.last, last == char {
                stack.removeLast()
            } else {
                stack.append(char)
            }
        }

        return stack.map { String($0) }.joined()
    }
}

final class RemoveAllAdjacentDuplicatesVariantSolution {
    func removeAllDuplicates(_ s: String) -> String {
        var stack = [Character]()
        let sArr = Array(s)
        let len = sArr.count
        var i = 0

        while i < len {
            let char = sArr[i]

            if let last = stack.last, last == char {
                let removed = stack.removeLast()
                i += 1

                while i < len && sArr[i] == char {
                    i += 1
                }

            } else {
                stack.append(char)
                i += 1
            }
        }

        return stack.map { String($0) }.joined()
    }
}
