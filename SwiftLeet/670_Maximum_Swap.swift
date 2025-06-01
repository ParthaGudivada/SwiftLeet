//
//  Solution 3.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 6/1/25.
//

import Foundation

class MaximumSwapSolution {
    func maximumSwap(_ num: Int) -> Int {
        var numArr = [Int]()

        var num = num
        while (num > 0) {
            numArr.append(num % 10)
            num /= 10
        }

        numArr.reverse()

        let len = numArr.count
        var maxIdx = len - 1
        var swapIdx1 = -1
        var swapIdx2 = -1

        for idx in stride(from: len - 2, through: 0, by: -1) {
            if numArr[idx] > numArr[maxIdx] {
                maxIdx = idx
            } else if numArr[idx] < numArr[maxIdx] {
                swapIdx1 = maxIdx
                swapIdx2 = idx
            }
        }

        numArr.swapAt(swapIdx1, swapIdx2)

        return Int(numArr.map { String($0) }.joined())!
    }
}

//class MaximumSwapVariantSolution {
//    func maximumSwapFor2ndLargest(_ nums: [Int]) -> [Int] {
//        var freqs = Array(repeating: 0, count: 10)
//
//        for num in nums {
//            freqs[num] += 1
//        }
//
//        var rslt = [Int]()
//
//        for idx in stride(from: freqs.count - 1, through: 0, by: -1) {
//            var cur =  freqs[idx]
//            while cur > 0 {
//                rslt.append(idx)
//                cur -= 1
//            }
//        }
//
//        let len = rslt.count
//        var prevIdx = len - 1
//
//        for curIdx in stride(from: len - 2, through: 0, by: -1) {
//            if rslt[curIdx] > rslt[prevIdx] {
//                rslt.swapAt(curIdx, prevIdx)
//                break
//            }
//
//            prevIdx = curIdx
//        }
//
//        return rslt
//    }
//}

class MaximumSwapVariantSolution {
    func maximumSwapFor2ndLargest(_ nums: [Int]) -> [Int] {
        var freqs = Array(repeating: 0, count: 10)

        for num in nums {
            freqs[num] += 1
        }

        var rslt = [Int]()

        for i in stride(from: freqs.count - 1, through: 0, by: -1) {
            var freq = freqs[i]

            while freq > 0 {
                rslt.append(i)
                freq -= 1
            }
        }

        let len = rslt.count
        var prev = len - 1

        for cur in stride(from: len - 2, through: 0, by: -1) {
            if rslt[cur] > rslt[prev] {
                rslt.swapAt(cur, prev)
                break
            }
            prev = cur
        }

        return rslt
    }
}
