//
//  11_Container_With_Most_Water.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/6/25.
//

import Foundation

class ContainerWithMostWaterSolution {
    func maxArea(_ height: [Int]) -> Int {
        let len = height.count
        var l = 0
        var r = len - 1
        var maxArea = 0

        while l < r {
            let leftH = height[l]
            let rightH = height[r]

            let curArea = min(leftH, rightH) * (r - l)
            maxArea = max(maxArea, curArea)

            if leftH > rightH {
                r -= 1
            } else {
                l += 1
            }
        }

        return maxArea
    }
}
