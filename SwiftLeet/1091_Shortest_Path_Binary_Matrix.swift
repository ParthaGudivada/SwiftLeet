//
//  1091_Shortest_Path_Binary_Matrix.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/31/25.
//

import Foundation

final class ShortestPathBinaryMatrixSolution {
    private let directions = [
        [-1, -1], [-1, 0], [-1, 1],
        [ 0, -1],          [ 0, 1],
        [ 1, -1], [ 1, 0], [ 1, 1]
    ]

    struct PosStep {
        let row: Int
        let col: Int
        let step: Int

        init(_ row: Int, _ col: Int, _ step: Int) {
            self.row = row
            self.col = col
            self.step = step
        }
    }

    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        let len = grid.count

        if grid[0][0] == 1 || grid[len - 1][len - 1] == 1 {
            return -1
        }

        var visited = Array(repeating: Array(repeating: false, count: len), count: len)
        var queue = [PosStep]()

        queue.append(PosStep(0, 0, 1))
        visited[0][0] = true

        while !queue.isEmpty {
            let cur = queue.removeFirst()

            if cur.row == len - 1 && cur.col == len - 1 {
                return cur.step
            }

            for dir in directions {
                let x = cur.row + dir[0]
                let y = cur.col + dir[1]

                if x >= 0 && x < len && y >= 0 && y < len && grid[x][y] == 0 && !visited[x][y] {
                    queue.append(PosStep(x, y, cur.step  + 1))
                    visited[x][y] = true
                }
            }
        }

        return -1
    }
}

final class ShortestPathBinaryMatrixVariant1Solution {
    struct PosPath {
        let row: Int
        let col: Int
        let path: [[Int]]

        init(_ row: Int, _ col: Int, _ path: [[Int]]) {
            self.row = row
            self.col = col
            self.path = path
        }
    }

    func shortestPath(_ grid: [[Int]]) -> [[Int]] {
        let directions = [
            [-1, -1], [-1, 0], [-1, 1],
            [ 0, -1],          [ 0, 1],
            [ 1, -1], [ 1, 0], [ 1, 1]
        ]

        let len = grid.count

        if grid[0][0] == 1 || grid[len - 1][len - 1] == 1 {
            return []
        }

        var visited = Array(repeating: Array(repeating: false, count: len), count: len)
        var queue = [PosPath]()
        queue.append(PosPath(0, 0, [[0, 0]]))
        visited[0][0] = true

        while !queue.isEmpty {
            let cur = queue.removeFirst()

            if cur.row == len - 1 && cur.col == len - 1 {
                return cur.path
            }

            for dir in directions {
                let x = dir[0] + cur.row
                let y = dir[1] + cur.col

                if x >= 0 && x < len && y >= 0 && y < len && grid[x][y] == 0 && !visited[x][y] {
                    visited[x][y] = true
                    var newPath = cur.path
                    newPath.append([x, y])
                    queue.append(PosPath(x, y, newPath))
                }
            }
        }

        return []
    }
}

final class ShortestPathBinaryMatrixVariant1OptimizedSolution {
    struct PosPath {
        let row: Int
        let col: Int

        init(_ row: Int, _ col: Int) {
            self.row = row
            self.col = col
        }
    }

    func shortestPath(_ grid: [[Int]]) -> [[Int]] {
        let directions = [
            [-1, -1], [-1, 0], [-1, 1],
            [ 0, -1],          [ 0, 1],
            [ 1, -1], [ 1, 0], [ 1, 1]
        ]

        let len = grid.count

        if grid[0][0] == 1 || grid[len - 1][len - 1] == 1 {
            return []
        }

        var visited = Array(repeating: Array(repeating: false, count: len), count: len)
        var parent = Array(repeating: Array(repeating: [-1, -1], count: len), count: len)
        var queue = [PosPath]()
        queue.append(PosPath(0, 0))
        visited[0][0] = true

        var found = false

        while !queue.isEmpty {
            let cur = queue.removeFirst()

            if cur.row == len - 1 && cur.col == len - 1 {
                found = true
                break
            }

            for dir in directions {
                let x = dir[0] + cur.row
                let y = dir[1] + cur.col

                if x >= 0 && x < len && y >= 0 && y < len && grid[x][y] == 0 && !visited[x][y] {
                    visited[x][y] = true
                    parent[x][y] = [cur.row, cur.col]
                    queue.append(PosPath(x, y))
                }
            }
        }

        if !found {
            return []
        }

        var path = [[Int]]()
        var cur = [len - 1, len - 1]

        while cur != [-1, -1] {
            path.append(cur)
            cur = parent[cur[0]][cur[1]]
        }

        return path.reversed()
    }
}

final class ShortestPathBinaryMatrixVariant2Solution {
    private let directions = [
        [-1, -1], [-1, 0], [-1, 1],
        [ 0, -1],          [ 0, 1],
        [ 1, -1], [ 1, 0], [ 1, 1]
    ]

    func shortestPath(_ grid: [[Int]]) -> [[Int]] {
        let len = grid.count

        if grid[0][0] == 1 || grid[len - 1][len - 1] == 1 {
            return []
        }

        var visited = Array(repeating: Array(repeating: false, count: len), count: len)
        var path: [[Int]] = [[0, 0]]
        visited[0][0] = true
        _ = dfs(grid, &path, 0, 0, len, &visited)
        return path
    }

    private func dfs(
        _ grid: [[Int]], _ curPath: inout [[Int]], _ row: Int, _ col: Int,
        _ len: Int, _ visited: inout [[Bool]]
    ) -> Bool {
        if row == len - 1 && col == len - 1 {
            return true
        }

        for dir in directions {
            let x = row + dir[0]
            let y = col + dir[1]

            if x >= 0 && x < len && y >= 0 && y < len && grid[x][y] == 0 && !visited[x][y] {
                visited[x][y] = true
                curPath.append([x, y])

                if dfs(grid, &curPath, x, y, len, &visited) {
                    return true
                }

                curPath.removeLast()
            }
        }

        return false
    }
}
