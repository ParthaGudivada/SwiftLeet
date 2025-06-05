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

final class WordBreakUsingMemoizationDFSSolution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let sArr = Array(s)
        let len = sArr.count
        let wordSet = Set(wordDict)
        var memo = [Int: Bool]()

        return dfs(sArr, 0, len, wordSet, &memo)
    }

    private func dfs(
        _ sArr: [Character], _ startIdx: Int, _ len: Int,
        _ wordSet: Set<String>, _ memo: inout [Int: Bool]
    ) -> Bool {
        if startIdx == len {
            return true
        }

        if let exist = memo[startIdx] {
            return exist
        }

        for endIdx in (startIdx + 1)...len {
            let curWord = String(sArr[startIdx ..< endIdx])

            if wordSet.contains(curWord) &&
                dfs(sArr, endIdx, len, wordSet, &memo) {
                memo[startIdx] = true
                return true
            }
        }

        memo[startIdx] = false
        return false
    }
}
