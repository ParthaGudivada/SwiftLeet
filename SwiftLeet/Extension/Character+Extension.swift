//
//  Character+Extension.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/2/25.
//

import Foundation

extension Character {
    var isAlphaNumeric: Bool {
        isLetter || isNumber
    }
}
