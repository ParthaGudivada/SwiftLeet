//
//  394_Decode_String.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/22/25.
//

import Foundation

final class DecodeStringSolution {
    struct StrCount {
        let str: String
        let count: Int

        init(_ str: String, _ count: Int) {
            self.str = str
            self.count = count
        }
    }

    func decodeString(_ s: String) -> String {
        var stack = [StrCount]()

        var str = ""
        var count = 0

        for char in s {
            if char.isNumber {
                count = count * 10 + Int(String(char))!
            } else if char == "[" {
                stack.append(StrCount(str, count))
                str = ""
                count = 0
            } else if char == "]" {
                let prev = stack.removeLast()
                str = prev.str + String(repeating: str, count: prev.count)
            } else {
                str += String(char)
            }
        }

        return str
    }
}
