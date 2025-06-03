//
//  133_Clone_Graph.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/3/25.
//

import Foundation

final class CloneGraphSolution {
    class Node: Equatable, Hashable {
        let val: Int
        var neighbors: [Node?]

        init(_ val: Int, _ neighbors: [Node?] = [] ) {
            self.val = val
            self.neighbors = neighbors
        }

        static func == (lhs: Node, rhs: Node) -> Bool {
            lhs.val == rhs.val && lhs.neighbors == rhs.neighbors
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(val)

            for neighbor in neighbors where neighbor != nil {
                hasher.combine(neighbor!.val)
            }
        }
    }

    func cloneGraph(_ node: Node?) -> Node? {
        guard let node else {
            return nil
        }

        var oldToClone = [Node: Node]()
        return helper(node, &oldToClone)
    }

    private func helper(_ node: Node, _ oldToClone: inout [Node: Node]) -> Node {
        if let cloned = oldToClone[node] {
            return cloned
        }

        let clone = Node(node.val)
        oldToClone[node] = clone

        for neighbor in node.neighbors where neighbor != nil {
            clone.neighbors.append(helper(neighbor!, &oldToClone))
        }

        return clone
    }
}

final class CloneGraphVariantSolution {
    class Node: Equatable, Hashable {
        let val: Int
        var neighbors: [Node?]

        init(_ val: Int, _ neighbors: [Node?] = [] ) {
            self.val = val
            self.neighbors = neighbors
        }

        static func == (lhs: Node, rhs: Node) -> Bool {
            lhs.val == rhs.val && lhs.neighbors == rhs.neighbors
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(val)

            for neighbor in neighbors where neighbor != nil {
                hasher.combine(neighbor!.val)
            }
        }
    }

    func cloneGraph(_ lists: [Node]) -> [Node] {
        var clonedLists = [Node]()

        for node in lists {
            var oldToClone = [Node: Node]()
            let clone = helper(node, &oldToClone)
            clonedLists.append(clone)
        }

        return clonedLists
    }

    private func helper(_ node: Node, _ oldToClone: inout [Node: Node]) -> Node {
        if let cloneExist = oldToClone[node] {
            return cloneExist
        }

        let clone = Node(node.val)
        oldToClone[node] = clone

        for neighbor in node.neighbors where neighbor != nil {
            clone.neighbors.append(helper(neighbor!, &oldToClone))
        }

        return clone
    }
}

//class CloneGraphVariantSolution {
//    func cloneGraph(_ lists: [Node1?]) -> [Node1?] {
//        var clonedList = [Node1?]()
//
//        for node in lists where node != nil {
//            var oldToNew = [Node1: Node1]()
//            clonedList.append(helper(node, &oldToNew))
//        }
//
//        return clonedList
//    }
//
//    private func helper(_ node: Node1?, _ oldToNew: inout [Node1: Node1]) -> Node1? {
//        guard let node else {
//            return nil
//        }
//
//        if let exist = oldToNew[node] {
//            return exist
//        }
//
//        let newOne = Node1(node.val)
//        oldToNew[node] = newOne
//
//        for neighbor in node.neighbors {
//            newOne.neighbors.append(helper(neighbor, &oldToNew))
//        }
//
//        return newOne
//    }
//}
