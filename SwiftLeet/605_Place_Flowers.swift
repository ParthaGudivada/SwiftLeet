//
//  605_Place_Flowers.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/6/25.
//

import Foundation

final class PlaceFlowersSolution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var placedFlowers = 0
        let len = flowerbed.count
        var i = 0

        while i < len {
            if flowerbed[i] == 1 {
                i += 1
                continue
            }

            let isLeftEmpty = i == 0 || flowerbed[i - 1] == 0
            let isRightEmpty  = (i == len - 1) || flowerbed[i + 1] == 0

            if isLeftEmpty  && isRightEmpty {
                placedFlowers += 1

                if placedFlowers >= n {
                    return true
                }

                i += 1
            }

            i += 1
        }

        return placedFlowers >= n
    }
}

final class PlaceFlowersVariantSolution {
    func countOfPlacedFlowers(_ flowerbed: [Int]) -> Int {
        let len = flowerbed.count
        var placed = 0
        var i = 0

        while i < len {
            if flowerbed[i] == 1 {
                i += 1
                continue
            }

            let isLeftEmpty = i == 0 || flowerbed[i - 1] == 0
            let isRightEmpty  = (i == len - 1) || flowerbed[i + 1] == 0

            if isLeftEmpty  && isRightEmpty {
                placed += 1
                i += 1
            }

            i += 1
        }

        return placed
    }
}

//let soln = PlaceFlowersVariantSolution()
//var flowerbed = [1, 0, 0, 0, 1]
//print(soln.countOfPlacedFlowers(flowerbed))
//flowerbed = [0, 0, 0, 0, 0]
//print(soln.countOfPlacedFlowers(flowerbed))
