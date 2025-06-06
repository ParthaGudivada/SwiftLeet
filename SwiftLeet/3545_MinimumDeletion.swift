//
//  3545_MinimumDeletions.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/28/25.
//

import Foundation

final class MinimumDeletionSolution {
    func minDeletion(_ s: String, _ k: Int) -> Int {
        var sFre = [Character: Int]()

        for char in s {
            sFre[char, default: 0] += 1
        }
        var freCount = sFre.count

        let sorted = sFre.sorted { $0.value < $1.value }
        var rslt = 0

        for element in sorted {
            if freCount > k {
                rslt += element.value
                freCount -= 1
            } else {
                break
            }
        }

        return rslt
    }
}
