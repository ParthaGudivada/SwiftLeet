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
        var rslt = ""

        for char in str {
            switch char {
            case "a"..."z":
                rslt.append(rotate(char, "a", factor, 26))
            case "A"..."Z":
                rslt.append(rotate(char, "A", factor, 26))
            case "0"..."9":
                rslt.append(rotate(char, "0", factor, 10))
            default:
                rslt.append(char)
            }
        }

        return rslt
    }

    private func rotate(_ char: Character, _ baseChar: Character, _ rFactor: Int, _ modBy: Int) -> String {
        let diff = Int(char.asciiValue!) - Int(baseChar.asciiValue!)
        let actual = (diff + rFactor) % modBy
        let rotatedChar = UnicodeScalar(actual + Int(baseChar.asciiValue!))
        return String(rotatedChar!)
    }
}

//let cipher = GroupShiftedStringsVariantSolution()
//print(cipher.rotationalCipher("89_yfZZ@", 3))
//print(cipher.rotationalCipher("89_yfZZ@", 3))
//print(cipher.rotationalCipher("minMerz-984", 5))
//print(cipher.rotationalCipher("minMerz-894", 5))
//print(cipher.rotationalCipher("XYZ_abo_112288", 39))
