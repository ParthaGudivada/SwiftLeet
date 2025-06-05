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
        var curCount = 0
        var curStr = ""

        for char in s {
            switch char {
            case "0"..."9":
                curCount = curCount * 10 + Int(String(char))!

            case "[":
                stack.append(StrCount(curStr, curCount))
                curStr = ""
                curCount = 0

            case "]":
                let prev = stack.removeLast()
                curStr = prev.str + String(repeating: curStr, count: prev.count)

            default:
                curStr.append(char)
            }
        }

        return curStr
    }
}
