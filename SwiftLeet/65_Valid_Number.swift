//
//  65_Valid_Number.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/2/25.
//

import Foundation

final class ValidNumberSolution {
    // using Deterministic Finite Automation (DFA)
    enum Grouping {
        case digit
        case sign
        case dot
        case exp
    }

    func isNumber(_ s: String) -> Bool {
        let states: [[Grouping: Int]] = [
            [.digit: 1, .sign: 2, .dot: 3],
            [.digit: 1, .dot: 4, .exp: 5],
            [.digit: 1, .dot: 3],
            [.digit: 4],
            [.digit: 4, .exp: 5],
            [.sign: 6, .digit: 7],
            [.digit: 7],
            [.digit: 7]
        ]

        var curState = 0
        var curGrouping: Grouping
        let validFinalStates: Set<Int> = [1, 4, 7]

        for char in s {
            switch char {
            case "0"..."9" :
                curGrouping = .digit

            case "+", "-":
                curGrouping = .sign

            case ".":
                curGrouping = .dot

            case "e", "E":
                curGrouping = .exp

            default:
                return false
            }

            guard let newState = states[curState][curGrouping] else {
                return false
            }

            curState = newState
        }

        return validFinalStates.contains(curState)
    }
}
