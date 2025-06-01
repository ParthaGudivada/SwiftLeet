//
//  71_Simplify_Path.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/31/25.
//

import Foundation

final class SimplifyPathSolution {
    func simplifyPath(_ path: String) -> String {
        var stack = [String]()

        for word in path.split(separator: "/") {
            switch word {
            case ".":
                continue
            case "..":
                if !stack.isEmpty {
                    stack.removeLast()
                }
            default:
                stack.append(String(word))
            }
        }

        return "/" + stack.joined(separator: "/")
    }
}

final class SimplifyPathVariantSolution {
    func combine(_ cwd: String, _ cd: String) -> String {
        var stack = [String]()

        if !cd.hasPrefix("/") {
            stack.append(
                contentsOf: cwd.split(separator: "/").map { String($0) }
            )
        }

        for word in cd.split(separator: "/" ) {
            switch word {
            case ".":
                continue
            case "..":
                if !stack.isEmpty {
                    stack.removeLast()
                }
            default:
                stack.append(String(word))
            }
        }

        return "/" + stack.joined(separator: "/")
    }
}
