//
//  973_K_Closest_Points_To_Origin.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/23/25.
//

import Foundation
import HeapModule

final class KClosePointsSolution {
    struct Point: Comparable {
        let x: Int
        let y: Int

        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }

        init(_ arr: [Int]) {
            self.x = arr[0]
            self.y = arr[1]
        }

        var dist: Int {
            x * x + y * y
        }

        static func < (lhs: Point, rhs: Point) -> Bool {
            lhs.dist < rhs.dist
        }
    }

    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var ptsHeap = Heap<Point>()

        for pt in points {
            let cur = Point(pt)
            if ptsHeap.count >= k {
                if cur < ptsHeap.max! {
                    _ = ptsHeap.popMax()
                    ptsHeap.insert(cur)
                }

            } else {
                ptsHeap.insert(cur)
            }
        }

        return ptsHeap.unordered.map { [$0.x, $0.y]}
    }
}
