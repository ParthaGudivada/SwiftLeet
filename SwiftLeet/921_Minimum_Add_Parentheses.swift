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
        var extraOpen = 0
        var rslt = ""

        for char in s {
            if char == "(" {
                extraOpen += 1
            } else {
                if extraOpen > 0 {
                    extraOpen -= 1
                } else {
                    rslt += "("
                }
            }

            rslt += String(char)
        }

        rslt += String(Array(repeating: ")", count: extraOpen))
        return rslt
    }
}
