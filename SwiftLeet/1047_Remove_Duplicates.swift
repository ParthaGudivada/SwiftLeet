//
//  1047_Remove_Duplicates.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/25/25.
//

import Foundation

class RemoveDuplicatesSolution {
    func removeDuplicates(_ s: String) -> String {
        var stack = [Character]()

        for char in s {
            if stack.isEmpty || stack.last != char{
                stack.append(char)
                continue
            }

            stack.removeLast()
        }

        return String(stack)
    }
}

class RemoveDuplicatesVariantSolution {
    func removeAllDuplicates(_ s: String) -> String {
        var stack = [Character]()
        let sArr = Array(s)
        let len = sArr.count
        var l = 0

        while l < len {
            let char = sArr[l]

            if stack.isEmpty || stack.last != char {
                stack.append(char)
                l += 1
                continue
            }

            stack.removeLast()
            while l < len && sArr[l] == char {
                l += 1
            }
        }

        return String(stack)
    }
}

