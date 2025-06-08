//
//  1004_Max_Consecutive_Ones_III.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/8/25.
//

import Foundation

final class MaxConsecutiveOnesIIISolution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var l = 0
        var target = k
        var maxLen = 0

        for (r, num) in nums.enumerated() {
            if num == 0 {
                target -= 1
            }

            while target < 0 {
                if nums[l] == 0 {
                    target += 1
                }

                l += 1
            }

            maxLen = max(maxLen, r - l + 1)
        }

        return maxLen
    }
}

final class MaxConsecutiveOnesIIIVariant1Solution {
    func findMaxVacation(_ days: [Character], _ pto: Int) -> Int {
        var l = 0
        var maxVacation = 0
        var maxPto = pto

        for (r, day) in days.enumerated() {
            if day == "W" {
                maxPto -= 1
            }

            while maxPto < 0 {
                if days[l] == "W" {
                    maxPto += 1
                }

                l += 1
            }

            maxVacation = max(maxVacation, r - l + 1)
        }

        return maxVacation
    }
}

//let soln = MaxConsecutiveOnesIIIVariant1Solution()
//print(soln.findMaxVacation(["H", "H", "W", "W"], 1))
//print(soln.findMaxVacation(["W", "H", "H", "W", "W"], 1))
//print(soln.findMaxVacation(["H", "H", "H", "H", "H"], 1))
//print(soln.findMaxVacation(["W", "H", "H", "W", "W", "H", "W"], 2))
//print(soln.findMaxVacation(["W", "W", "W", "H", "H", "W"], 0))

final class MaxConsecutiveOnesIIIVariant2Solution {
    func findMaxVacation(_ years: [Bool], _ pto: Int) -> Int {
        var l = 0
        var maxVacation = 0
        var maxPto = pto

        for (r, year) in years.enumerated() {
            if !year {
                maxPto -= 1
            }

            while maxPto < 0 {
                if !years[l] {
                    maxPto += 1
                }

                l += 1
            }

            maxVacation = max(maxVacation, r - l + 1)
        }

        return maxVacation
    }
}

//let soln = MaxConsecutiveOnesIIIVariant2Solution()
//print(soln.findMaxVacation([false, true, true, false, false, true, false], 2)) // 5
//print(soln.findMaxVacation([false, false, false, true, true, false], 0)) // 2

final class MaxConsecutiveOnesIIIVariant4Solution {
    func findMaxVacation(_ days: [Character], _ pto: Double) -> Double {
        var maxVac = 0.0
        let ptoComps = String(pto).components(separatedBy: ".")
        var wholePTO = Int(ptoComps[0]) ?? 0
        let decimalPTO = pto - Double(wholePTO)
        let len = days.count
        var l = 0

        for (r, day) in days.enumerated() {
            if day == "W" {
                wholePTO -= 1
            }

            while wholePTO < 0 {
                if days[l] == "W" {
                    wholePTO += 1
                }

                l += 1
            }

            let ext = if r > 0 && days[r - 1] == "W" || r < len - 1 && days[r + 1] == "W" {
                decimalPTO
            } else {
                0.0
            }

            maxVac = max(maxVac, Double(r - l + 1) + ext)
        }

        return maxVac
    }
}

//let soln = MaxConsecutiveOnesIIIVariant4Solution()
//print(soln.findMaxVacation(["W", "H", "W", "W", "W"], 2.5)) // 3.5
//print(soln.findMaxVacation(["W", "W", "W","W", "W", "W", "W"], 3.2))  // 3.2
//print(soln.findMaxVacation(["H", "H", "W", "W"], 1.5))
//print(soln.findMaxVacation(["W", "H", "H", "W", "W"], 1.5))
//print(soln.findMaxVacation(["H", "H", "H", "H", "H"], 1.5))
