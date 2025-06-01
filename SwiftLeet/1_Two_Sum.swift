//
//  1_Two_Sum.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/31/25.
//

import Foundation

class TwoSumSolution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var compToIdx = [Int: Int]()

        for (idx, val) in nums.enumerated() {
            let comp = target - val

            if let compIdx = compToIdx[comp] {
                return [compIdx, idx]
            }

            compToIdx[val] = idx
        }

        return [-1, -1]
    }
}

class TwoSumVariant1Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> Bool {
        var compSet = Set<Int>()

        for num in nums {
            let comp = target - num

            if compSet.contains(comp) {
                return true
            }

            compSet.insert(num)
        }

        return false
    }
}

class TwoSumVariant2Solution {
    struct Dominoe: Hashable {
        let x: Int
        let y: Int

        init(_ nums: [Int]) {
            (x, y) = (nums[0], nums[1])
        }

        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }

        func compDomino(_ target: Int) -> Dominoe {
            Dominoe(target - x, target - y)
        }
    }

    func twoSumDominoes(_ dominoes: [[Int]], _ target: Int) -> Int {
        var dominoeToFre = [Dominoe: Int]()
        var rslt = 0

        for ele in dominoes {
            let dominoe = Dominoe(ele)
            let compDominoe = dominoe.compDomino(target)

            if let foundCount = dominoeToFre[compDominoe] {
                rslt += foundCount
            }

            dominoeToFre[dominoe, default: 0] += 1
        }

        return rslt
    }
}
