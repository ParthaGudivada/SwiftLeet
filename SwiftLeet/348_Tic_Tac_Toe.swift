//
//  348_Tic_Tac_Toe.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/25/25.
//

import Foundation

final class TicTacToe {
    private var rows: [Int]
    private var cols: [Int]
    private var diagonal = 0
    private var antiDiagonal = 0
    private let n: Int

    init(_ n: Int) {
        self.n = n
        rows = Array(repeating: 0, count: n)
        cols = Array(repeating: 0, count: n)
    }

    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        let score = player == 1 ? 1 : -1

        rows[row] += score
        cols[col] += score

        if row == col {
            diagonal += score
        }

        if row == n - 1 - col {
            antiDiagonal += score
        }

        if  abs(rows[row]) == n ||
            abs(cols[col]) == n ||
            abs(diagonal) == n ||
            abs(antiDiagonal) == n {
            return player
        }

        return 0
    }
}

final class TicTacToeVariant {
    func isWin(_ board: inout [[Int]], _ player: Int, _ row: Int, _ col: Int) -> Bool {
        board[row][col] = player
        var rows = 0
        var cols = 0
        var diagonal = 0
        var antiDiagonal = 0
        let len = board.count

        for i in 0 ..< len {
            if board[row][i] == player {
                rows += 1
            }

            if board[i][col] == player {
               cols += 1
            }

            if board[i][i] == player {
                diagonal += 1
            }

            if board[i][len - i - 1] == player {
                antiDiagonal += 1
            }
        }

        return rows == len || cols == len || diagonal == len || antiDiagonal == len
    }
}


