//
//  529_Mine_Sweeper.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/6/25.
//

import Foundation

final class MineSweeperSolution {
    private let directions = [
        [-1, -1], [-1, 0], [-1, 1],
        [ 0, -1],          [ 0, 1],
        [ 1, -1], [ 1, 0], [ 1, 1]
    ]

    private func neighborsOf(_ cell: [Int], _ board: [[Character]], _ rows: Int, _ cols: Int) -> [[Int]] {
        var rslt = [[Int]]()

        let r = cell[0]
        let c = cell[1]

        for dir in directions {
            let x = r + dir[0]
            let y = c + dir[1]

            if x >= 0 && x < rows && y >= 0 && y < cols {
                rslt.append([x, y])
            }
        }

        return rslt
    }

    private func adjMines(_ board: [[Character]], _ neighbors: [[Int]]) -> Int {
        var rslt = 0

        for cell in neighbors {
            if board[ cell[0] ][ cell[1] ] == "M" {
                rslt += 1
            }
        }

        return rslt
    }

    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        var board = board
        dfs(&board, click)
        return board
    }

    private func dfs(_ board: inout [[Character]], _ cell: [Int]) {
        let row = cell[0]
        let col = cell[1]

        if board[row][col] == "M" {
            board[row][col] = "X"
            return
        }

        let neighbors = neighborsOf(cell, board, board.count, board[0].count)
        let adjMines = adjMines(board, neighbors)

        if adjMines > 0 {
            board[row][col] = Character(String(adjMines))
        } else {
            board[row][col] = "B"

            for cell in neighbors {
                if board[ cell[0] ][ cell[1] ] == "E" {
                    dfs(&board, cell)
                }
            }
        }
    }
}
