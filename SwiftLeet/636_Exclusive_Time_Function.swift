//
//  ExclusiveTimeFunctionSolution.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/25/25.
//

import Foundation

final class ExclusiveTimeFunctionSolution {
    struct Log {
        let id: Int
        let isStart: Bool
        let time: Int

        init(_ strLog: String) {
            let comps = strLog.components(separatedBy: ":")
            id = Int(comps[0])!
            isStart = comps[1] == "start"
            time = Int(comps[2])!
        }
    }

    func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
        var stack = [Log]()
        var rslt = Array(repeating: 0, count: n)
        var prevTime = 0

        for strLog in logs {
            let log = Log(strLog)

            if log.isStart {
                if !stack.isEmpty {
                    let last = stack.last!
                    rslt[last.id] += log.time - prevTime
                }

                stack.append(log)
                prevTime = log.time
            } else {
                rslt[log.id] += log.time + 1 - prevTime
                stack.removeLast()
                prevTime = log.time + 1
            }
        }

        return rslt
    }
}

final class ExclusiveTimeFunctionVariantSolution {
    struct Log {
        let name: String
        let time: Int
        let isBegin: Bool

        init(_ strLog: String) {
            let comps = strLog.components(separatedBy: ",")
            name = comps[0]
            time = Int(comps[1])!
            isBegin = comps[2] == "b"
        }
    }

    func exclusiveTime(_ logs: [String]) -> [String: Int] {
        var rslt = [String: Int]()
        var prevTime = 0
        var stack = [Log]()

        for strLog in logs {
            let log = Log(strLog)

            if log.isBegin {
                if let last = stack.last {
                    rslt[last.name, default: 0] += log.time - prevTime
                }

                stack.append(log)
                prevTime = log.time
            } else {
                rslt[log.name, default: 0] += log.time - prevTime
                stack.removeLast()
                prevTime = log.time
            }
        }

        return rslt
    }

}
