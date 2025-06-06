//
//  207_Course_Schedule.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/24/25.
//

import Foundation

final class CourseScheduleSolution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adj = Array(repeating: [Int](), count: numCourses)
        var inDegree = Array(repeating: 0, count: numCourses)

        for pre in prerequisites {
            inDegree[ pre[0] ] += 1
            adj[ pre[1] ].append( pre[0])
        }

        var queue = [Int]()
        for (i, val) in inDegree.enumerated() where val == 0 {
            queue.append(i)
        }

        var rslt = 0
        while !queue.isEmpty {
            let cur = queue.removeFirst()

            rslt += 1

            for course in adj[cur] {
                inDegree[course] -= 1

                if inDegree[course] == 0 {
                    queue.append(course)
                }
            }
        }

        return rslt == numCourses
    }
}
