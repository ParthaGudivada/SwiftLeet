//
//  134_Clone_Graph.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/23/25.
//

import Foundation

public class Node1 {
    public var val: Int
    public var neighbors: [Node1?]

    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

extension Node1: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
}

extension Node1: Equatable {
    public static func == (lhs: Node1, rhs: Node1) -> Bool {
        lhs.val == rhs.val
    }
}

class CloneGraphSolution {
    func cloneGraph(_ node: Node1?) -> Node1? {
        var oldToNew = [Node1: Node1]()
        return dfs(node, &oldToNew)
    }

    private func dfs(
        _ node: Node1?, _ oldToNew: inout [Node1: Node1]
    ) -> Node1? {
        guard let node else {
            return nil
        }

        if let existingNode = oldToNew[node] {
            return existingNode
        }

        let clone = Node1(node.val)
        oldToNew[node] = clone

        for neighbor in node.neighbors {
            clone.neighbors.append(dfs(neighbor, &oldToNew))
        }

        return clone
    }
}

class CloneGraphVariantSolution {
    func cloneGraph(_ lists: [Node1?]) -> [Node1?] {
        var clonedList = [Node1?]()

        for node in lists where node != nil {
            var oldToNew = [Node1: Node1]()
            clonedList.append(helper(node, &oldToNew))
        }

        return clonedList
    }

    private func helper(_ node: Node1?, _ oldToNew: inout [Node1: Node1]) -> Node1? {
        guard let node else {
            return nil
        }

        if let exist = oldToNew[node] {
            return exist
        }

        let newOne = Node1(node.val)
        oldToNew[node] = newOne

        for neighbor in node.neighbors {
            newOne.neighbors.append(helper(neighbor, &oldToNew))
        }

        return newOne
    }
}
