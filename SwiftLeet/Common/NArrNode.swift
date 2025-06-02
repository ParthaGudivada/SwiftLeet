//
//  NArrNode.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/2/25.
//

import Foundation

class NArrNode {
    let val: Int
    let children: [NArrNode]

    init(_ val: Int, _ children: [NArrNode]) {
        self.val = val
        self.children = children
    }
}
