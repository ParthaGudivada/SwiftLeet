//
//  TreeNode.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/2/25.
//

import Foundation

//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.val == rhs.val
    }
}

extension TreeNode: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
}
