//
//  NestedInteger.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/29/25.
//


/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */
enum NestedType {
    case value(intValue: Int)
    case list(nestedListTypes: [NestedType])
}

protocol NestedInteger {
    func isInteger() -> Bool

    func getInteger() -> Int

    func setInteger(value: Int)

    func add(elem: NestedInteger)

    func getList() -> [NestedInteger]
}


final class NestedIntegerSolution {
    func depthSum(_ nestedList: [NestedInteger]) -> Int {
        dfs(nestedList, 1)
    }

    private func dfs(_ nestedList: [NestedInteger], _ lvl: Int) -> Int {
        var sum = 0

        for ni in nestedList {
            if ni.isInteger() {
                sum += ni.getInteger() * lvl
            } else {
                sum += dfs(ni.getList(), lvl + 1)
            }
        }

        return sum
    }
}

final class NestedIntegerVariantSolution {
    func depthSum(_ nestedList: [NestedType]) -> Int {
        dfs(nestedList, 1)
    }

    private func dfs(_ nestedListTypes: [NestedType], _ lvl: Int) -> Int {
        var sum = 0

        for nestedType in nestedListTypes {
            switch nestedType {
            case .value(let intValue):
                sum += intValue
            case .list(let types):
                sum += dfs(types, lvl + 1)
            }
        }

        return sum
    }
}
