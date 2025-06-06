//
//  973_K_Closest_Points_To_Origin.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/23/25.
//

import Foundation
import HeapModule

final class KClosePointsSolution {
    struct Pos: Comparable {
        let x: Int
        let y: Int

        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }

        var distSquared: Int {
            x * x + y * y
        }

        static func < (lhs: Pos, rhs: Pos) -> Bool {
            lhs.distSquared < rhs.distSquared
        }
    }


    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var heap = Heap<Pos>()
        let len = points.count

        for i in 0 ..< k {
            let pt = points[i]
            heap.insert(Pos(pt[0], pt[1]))
        }

        for i in k ..< len {
            let cur = points[i]
            let pos = Pos(cur[0], cur[1])

            if let curMax = heap.max {
                if pos < curMax {
                    _ = heap.popMax()
                    heap.insert(pos)
                }
            }
        }

        return heap.unordered.map {
            [$0.x, $0.y]
        }
    }
}
