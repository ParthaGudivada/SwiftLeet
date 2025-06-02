//
//  827_Make_Large_Island.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/2/25.
//

import Foundation

final class MakeLargeIslandSolution {
    func largestIsland(_ grid: [[Int]]) -> Int {
        let directions = [
            [-1, 0], [0, 1], [1, 0], [0, -1]
        ]
        let len = grid.count
        let dj = DJSet(len * len)

        for r in 0 ..< len {
            for c in 0 ..< len where grid[r][c] == 1 {
                for dir in directions {
                    let x = r + dir[0]
                    let y = c + dir[1]

                    if x >= 0 && x < len && y >= 0 && y < len && grid[x][y] == 1  {
                        dj.unionBySize(r * len + c, x * len + y)
                    }
                }
            }
        }

        var allOnes = true
        var rslt = 0

        for r in 0 ..< len {
            for c in 0 ..< len where grid[r][c] == 0 {
                allOnes = false
                var unionSet = Set<Int>()

                for dir in directions {
                    let x = r + dir[0]
                    let y = c + dir[1]

                    if x >= 0 && x < len && y >= 0 && y < len && grid[x][y] == 1  {
                        unionSet.insert(dj.findUP(x * len + y))
                    }
                }

                var localMax = 0
                for node in unionSet {
                    localMax += dj.size[node]
                }

                rslt = max(rslt, localMax + 1)
            }
        }

        if allOnes {
            return len * len
        }

        return rslt
    }
}

final class DJSet {
    private(set) var size: [Int]
    private(set) var parent: [Int]

    init(_ len: Int) {
        size = Array(repeating: 1, count: len)

        parent = [Int]()
        for i in 0 ..< len {
            parent.append(i)
        }
    }

    func findUP(_ node: Int) -> Int {
        if node == parent[node] {
            return node
        }

        parent[node] = findUP(parent[node])
        return parent[node]
    }

    func unionBySize(_ u: Int, _ v: Int) {
        let upU = findUP(u)
        let upV = findUP(v)

        if upU == upV {
            return
        }

        if upU < upV {
            size[upV] += size[upU]
            parent[upU] = upV
        } else {
            size[upU] += size[upV]
            parent[upV] = upU
        }
    }
}
