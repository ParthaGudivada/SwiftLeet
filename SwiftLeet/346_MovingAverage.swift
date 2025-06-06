//
//  346_MovingAverage.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/23/25.
//

import Foundation
import Collections

final class MovingAverage {
    private var deque = Deque<Int>()
    private var winSum = 0
    private var size: Int

    init(_ size: Int) {
        self.size = size
    }

    func next(_ val: Int) -> Double {
        deque.append(val)
        winSum += val

        if deque.count > size {
            winSum -= deque.removeFirst()
        }

        return Double(winSum) / Double(deque.count)
    }
}

final class MovingAverageVariantSolution {
    func average(_ nums: [Int], _ size: Int) -> [Int] {
        var rslt = [Int]()
        var winSum = 0
        let len = nums.count

        for r in 0 ..< len {
            winSum += nums[r]

            let l = r - size
            if l >= 0 {
                winSum -= nums[l]
            }

            if r - size + 1 >= 0 {
                rslt.append(winSum / size)
            }
        }

        return rslt
    }
}

//let soln =  MovingAverageVariantSolution()
//print(soln.average([5, 2, 8, 14, 3], 3))
