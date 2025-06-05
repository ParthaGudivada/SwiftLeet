//
//  489_Robot_Room_Cleaner.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/26/25.
//

import Foundation

protocol Robot {
    func move() -> Bool

    func turnLeft()

    func turnRight()

    func clean()
}

final class RobotRoomCleanerSolution {
    private var directions: [[Int]] = [
        [-1, 0], [0, 1], [1, 0], [0, -1]
    ]

    func cleanRoom(_ robot: Robot) {
        var visited = Set<[Int]>()
        backtrack(robot, 0, 0, &visited, 0)
    }

    private func backtrack(
        _ robot: Robot, _ r: Int, _ c: Int,
        _ visited: inout Set<[Int]>, _ direction: Int
    ) {
        visited.insert([r, c])
        robot.clean()

        for i in 0 ..< 4 {
            let newD = (i + direction) % 4
            let x = r + directions[newD][0]
            let y = c + directions[newD][1]

            if !visited.contains([x, y]) && robot.move() {
                backtrack(robot, x, y, &visited, newD)
                goBack(robot)
            }

            robot.turnRight()
        }
    }

    private func goBack(_ robot: Robot) {
        robot.turnRight()
        robot.turnRight()
        _ = robot.move()
        robot.turnRight()
        robot.turnRight()
    }
}

struct Direction {
    let row: Int
    let col: Int

    init(_ row: Int, _ col: Int) {
        self.row = row
        self.col = col
    }

    static var normal: [Direction] {
        [
            Direction(-1,  0),
            Direction( 0,  1),
            Direction( 1,  0),
            Direction( 0, -1)
        ]
    }

    static var opposite: [Direction] {
        [
            Direction( 1,  0),
            Direction( 0, -1),
            Direction(-1,  0),
            Direction( 0,  1)
        ]
    }
}

protocol Mouse {
    func move(_ direction: Direction) -> Bool

    func hasCheese() -> Bool
}

final class RobotRoomCleanerVariantSolution {
    func getCheese(_ mouse: Mouse) -> Bool {
        var visited = Set<[Int]>()
        return dfs(mouse, 0, 0, &visited)
    }

    private func dfs(
        _ mouse: Mouse, _ r: Int, _ c: Int, _ visited: inout Set<[Int]>
    ) -> Bool {
        if mouse.hasCheese() {
            return true
        }

        visited.insert([r, c])

        for i in 0 ..< 4 {
            let x = r + Direction.normal[i].row
            let y = c + Direction.normal[i].col

            if !visited.contains([x, y]) {
                continue
            }

            if !mouse.move(Direction.normal[i]) {
                _ = mouse.move(Direction.opposite[i])
                continue
            }

            if dfs(mouse, x, y, &visited) {
                return true
            }

            _ = mouse.move(Direction.opposite[i])
        }

        return false
    }
}

