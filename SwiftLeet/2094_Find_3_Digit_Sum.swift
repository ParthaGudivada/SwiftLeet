//
//  2094_Find_3_Digit_Sum.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/4/25.
//

import Foundation
class Find3DigitSumSolution {
    func findEvenNumbers(_ digits: [Int]) -> [Int] {
        var digitFre = Array(repeating: 0, count: 10)
        for digit in digits {
            digitFre[digit] += 1
        }

        var rslt = [Int]()
        for num in stride(from: 100, through: 998, by: 2) {
            if isValidNum(num, digitFre) {
                rslt.append(num)
            }
        }

        return rslt
    }

    private func isValidNum(_ num: Int, _ digitFre: [Int]) -> Bool {
        var num = num
        var numFre = Array(repeating: 0, count: 10)

        while num > 0 {
            numFre[num % 10] += 1
            num /= 10
        }

        for (idx, count) in numFre.enumerated() {
            if digitFre[idx] < count {
                return false
            }
        }

        return true
    }
}
