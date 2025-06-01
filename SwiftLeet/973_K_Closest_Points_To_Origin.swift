//
//  973_K_Closest_Points_To_Origin.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/23/25.
//

import Foundation
import HeapModule

final class KClosestPointsToOrigin {
    struct Position: Comparable {
        let x: Int
        let y: Int

        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }

        var dist: Int {
            x * x + y * y
        }

        static func < (lhs: Position, rhs: Position) -> Bool {
            lhs.dist < rhs.dist
        }

    }

    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var heap = Heap<Position>()

        for point in points {
            let cur = Position(point[0], point[1])

            if heap.count == k {
                if cur > heap.max! {
                    _ = heap.popMax()
                    heap.insert(cur)
                }
            } else {
                heap.insert(cur)
            }
        }

        return heap.unordered.map { [$0.x, $0.y] }
    }
}
