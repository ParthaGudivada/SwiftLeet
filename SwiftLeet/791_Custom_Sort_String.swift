//
//  791_Custom_Sort_String.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/4/25.
//

import Foundation

final class CustomSortStringSolution {
    func customSortString(_ order: String, _ s: String) -> String {
        let aChar: Character = "a"
        let aBaseValue = aChar.asciiValue!

        var sFre = Array(repeating: 0, count: 26)

        for char in s {
            let diff = Int(char.asciiValue! - aBaseValue)
            sFre[diff] += 1
        }

        var rslt = ""
        for char in order {
            let diff = Int(char.asciiValue! - aBaseValue)
            let existingCount = sFre[diff]

            if existingCount != 0 {
                rslt += String(repeating: char, count: existingCount)
                sFre[diff] = 0
            }
        }

        for (idx, count) in sFre.enumerated() where count != 0 {
            let char = UnicodeScalar(idx + Int(aBaseValue))!
            rslt += String(repeating: String(char), count: count)
        }

        return rslt
    }
}
