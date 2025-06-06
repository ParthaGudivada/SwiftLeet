//
//  1762_Building_Ocean_View.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/31/25.
//

import Foundation

final class BuildingOceanRightViewSolution {
    func findBuildings(_ heights: [Int]) -> [Int] {
        let len = heights.count
        var rslt = [Int]()
        rslt.append(len - 1)
        var maxHt = heights[len - 1]

        for i in stride(from: len - 2, through: 0, by: -1) {
            let ht = heights[i]
            if ht > maxHt {
                rslt.append(i)
                maxHt = ht
            }
        }

        return rslt.reversed()
    }
}

final class BuildingOceanRightViewVariantSolution {
    func findBuildings(_ heights: [Int]) -> Int {
        let len = heights.count
        var rslt = 0

        var maxHt = heights[len - 1]
        rslt += 1

        for i in stride(from: len - 2, through: 0, by: -1) {
            let ht = heights[i]

            if ht > maxHt {
                rslt += 1
                maxHt = ht
            }
        }

        return rslt
    }
}

final class BuildingsOnEitherSideSolution {
    func findBuildings(_ heights: [Int]) -> [Int] {
        let len = heights.count

        guard len > 2 else {
            return heights
        }

        var lView = [Int]()
        var lMax = heights[0]
        lView.append(0)
        var l = 1

        var rView = [Int]()
        var rMax = heights[len - 1]
        rView.append(len - 1)
        var r = len - 2

        while l <= r {
            if lMax < rMax {
                if heights[l] > lMax {
                    lView.append(l)
                    lMax = heights[l]
                }
                l += 1
            } else {
                if heights[r] > rMax {
                    rView.append(r)
                    rMax = heights[r]
                }
                r -= 1
            }
        }

        return lView + rView.reversed()
    }
}
