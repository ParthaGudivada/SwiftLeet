//
//  NArrNode.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/2/25.
//

import Foundation

public class NArrNode {
    let val: Int
    let children: [NArrNode]

    public init(_ val: Int, _ children: [NArrNode]) {
        self.val = val
        self.children = children
    }
}
