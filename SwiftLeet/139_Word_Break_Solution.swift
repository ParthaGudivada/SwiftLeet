//
//  139_Word_Break_Solution.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/28/25.
//

import Foundation

final class WordBreakSolution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let sArr = Array(s)
        let len = sArr.count
        let wordSet = Set(wordDict)
        let maxWordLen = wordDict.map { $0.count }.max() ?? 0

        var dp = Array(repeating: false, count: len + 1)
        dp[0] = true

        for i in 1...len {
            for j in stride(from: i - 1, through: max(i - maxWordLen, 0), by: -1) {
                if dp[j], wordSet.contains(String(sArr[j..<i])) {
                    dp[i] = true
                    break
                }
            }
        }

        return dp[len]
    }
}
