//
//  249_Group_Shifted_Strings.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/24/25.
//

import Foundation

final class GroupShiftedStringsSolution {
    func groupStrings(_ strings: [String]) -> [[String]] {
        var charAdjDiffToString = [String:[String]]()

        for str in strings {
            if str.count == 1 {
                charAdjDiffToString["oneCharacter", default: []].append(str)
            } else {
                var key = ""
                let sArr = Array(str)

                for i in 1 ..< sArr.count {
                    let diff = Int(sArr[i].asciiValue!) - Int(sArr[i - 1].asciiValue!)
                    let posDiff = diff < 0 ? diff + 26 : diff
                    key += "\(posDiff)#"
                }

                charAdjDiffToString[key, default: []].append(str)
            }
        }

        return Array(charAdjDiffToString.values)
    }
}

final class GroupShiftedStringsVariantSolution {
    func rotationalCipher(_ str: String, _ factor: Int) -> String {
        let sArr = Array(str)
        var rslt = ""

        for char in sArr {
            if char.isLowercase {
                rslt += shiftBy(char, "a", 26, factor)
            } else if char.isUppercase {
                rslt += shiftBy(char, "A", 26, factor)
            } else if char.isNumber {
                rslt += shiftBy(char, "0", 10, factor)
            } else {
                rslt.append(String(char))
            }
        }

        return rslt
    }

    private func shiftBy(_ char: Character, _ baseChar: Character, _ modBy: Int, _ factor: Int) -> String {
        let diff = Int(char.asciiValue!) - Int(baseChar.asciiValue!)
        let updated = (diff + factor) % modBy
        let intValue = UInt8(updated) + baseChar.asciiValue!
        let uni = UnicodeScalar(intValue)
        return String(uni)
    }
}
