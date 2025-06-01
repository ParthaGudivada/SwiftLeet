//
//  Solution 3.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/29/25.
//


class MazeSolution {
    private let directions = [
        (-1, 0), (0, 1), (1, 0), (0, -1)
    ]

    func hasPath(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Bool {
        let rows = maze.count
        let cols = maze[0].count

        var visited = Set<[Int]>()
        return bfs(maze, rows, cols, start[0], start[1], destination, &visited)
    }

    private func bfs(
        _ maze: [[Int]], _ rows: Int, _ cols: Int,
        _ r: Int, _ c: Int, _ dest: [Int], _ visited: inout Set<[Int]>
    ) -> Bool {
        var queue: [(Int, Int)] = []
        queue.append((r, c))
        visited.insert([r, c])

        while !queue.isEmpty {
            let (curX, curY) = queue.removeFirst()

            if curX == dest[0], curY == dest[1] {
                return true
            }

            for (dx, dy) in directions {
                var x = curX + dx
                var y = curY + dy

                while x >= 0, x < rows, y >= 0, y < cols, maze[x][y] == 0 {
                    x += dx
                    y += dy
                }

                x -= dx
                y -= dy

                if !visited.contains([x, y]) {
                    queue.append((x, y))
                    visited.insert([x, y])
                }
            }
        }

        return false
    }
}
