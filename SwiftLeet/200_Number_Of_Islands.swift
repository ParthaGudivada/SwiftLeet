//
//  200_Number_Of_Islands.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/26/25.
//

import Foundation

class NumberOfIslandsSolution {
    private var directions = [
        [-1, 0], [0, 1], [1, 0], [0, -1]
    ]
    func numIslands(_ grid: [[Character]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var rslt = 0
        var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)

        for r in 0 ..< rows {
            for c in 0 ..< cols where grid[r][c] == "1" {
                if !visited[r][c] {
                    rslt += 1
                    dfs(grid, r, c, rows, cols, &visited)
                }
            }
        }

        return rslt
    }

    private func dfs(
        _ grid: [[Character]], _ r: Int, _ c: Int,
        _ rows: Int, _ cols: Int, _ visited: inout [[Bool]]
    ) {
        visited[r][c] = true

        for dir in directions {
            let x = r + dir[0]
            let y = c + dir[1]

            if x >= 0 && x < rows &&
               y >= 0 && y < cols &&
               grid[x][y] == "1" && !visited[x][y] {
                dfs(grid, x, y, rows, cols, &visited)
            }
        }
    }
}
