//
//  921_Minimum_Add_Parentheses.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/26/25.
//

import Foundation
final class MinimumAddParenthesesSolution {
    func minAddToMakeValid(_ s: String) -> Int {
        var minAdd = 0
        var extraOpen = 0

        for char in s {
            if char == "(" {
                extraOpen += 1
            } else {
                if extraOpen > 0 {
                    extraOpen -= 1
                } else {
                    minAdd += 1
                }
            }
        }

        return extraOpen + minAdd
    }
}

final class MinimumAddParenthesesVariantSolution {
    func makeAValidString(_ s: String) -> String {
        var rslt = ""
        var extraOpen = 0

        for char in s {
            if char == "(" {
                rslt.append(char)
                extraOpen += 1
            } else if char == ")" {
                if extraOpen > 0 {
                    extraOpen -= 1
                    rslt.append(char)
                } else {
                    rslt.append("(")
                    rslt.append(char)
                }
            } else {
                rslt.append(char)
            }
        }

        rslt.append(String(repeating: ")", count: extraOpen))
        return rslt
    }
}

//let soln = MinimumAddParenthesesVariantSolution()
//print(soln.makeAValidString("()))"))
//print(soln.makeAValidString("())))"))
