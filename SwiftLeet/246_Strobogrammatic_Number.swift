//
//  246_Strobogrammatic_Number.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/5/25.
//

import Foundation

final class StrobogrammaticSolution {
    func isStrobogrammatic(_ num: String) -> Bool {
        let pair: [Character: Character] = [
            "0": "0", "1": "1", "6": "9", "8": "8", "9": "6"
        ]

        let nArr = Array(num)
        var l = 0
        var r = nArr.count - 1

        while l <= r {
            let c1 = nArr[l]
            let c2 = nArr[r]

            guard let mc = pair[c1] else {
                return false
            }

            guard mc == c2 else {
                return false
            }

            l += 1
            r -= 1
        }

        return true
    }
}
