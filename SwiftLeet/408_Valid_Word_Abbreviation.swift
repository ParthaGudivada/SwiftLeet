//
//  408_Valid_Word_Abbreviation.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/30/25.
//

import Foundation

final class ValidWordAbbreviationSolution {
    func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
        let wArr = Array(word)
        let wl = wArr.count
        var wi = 0

        let aArr = Array(abbr)
        let al = aArr.count
        var ai = 0

        while wi < wl && ai < al {
            if wArr[wi] == aArr[ai] {
                ai += 1
                wi += 1
                continue
            }

            var strNum = ""

            guard aArr[ai].isNumber else {
                return false
            }

            while ai < al && aArr[ai].isNumber {
                strNum += String(aArr[ai])
                ai += 1
            }

            if strNum.hasPrefix("0") {
                return false
            }

            guard let intNum = Int(strNum) else {
                return false
            }

            wi += intNum
        }

        return wi == wl && ai == al
    }
}

final class ValidWordAbbreviationVariantSolution {
    func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
        let wArr = Array(word)
        let wl = wArr.count

        let aArr = Array(abbr)
        let al = aArr.count

        return helper(wArr, 0, wl, aArr, 0, al)
    }

    private func helper(
        _ wArr: [Character], _ wi: Int, _ wl: Int,
        _ aArr: [Character], _ ai: Int, _ al: Int
    ) -> Bool {
        if wi == wl && ai == al {
            return true
        }

        if ai == al && wi < wl {
            return false
        }

        if wi == wl  {
            var ai = ai
            while ai < al {
                if aArr[ai] != "*" {
                    return false
                }
                ai += 1
            }
            return true
        }

        if aArr[ai] == "*" {
            return helper(wArr, wi,     wl, aArr, ai + 1, al) ||
                   helper(wArr, wi + 1, wl, aArr, ai,     al)
        }

        if wArr[wi] == aArr[ai] {
            return helper(wArr, wi + 1, wl, aArr, ai + 1, al)
        }

        if aArr[ai].isNumber {
            var strNum = ""

            var ai = ai
            while ai < al && aArr[ai].isNumber {
                strNum += String(aArr[ai])
                ai += 1
            }

            guard let intNum = Int(strNum) else {
                return false
            }

            if wi + intNum >= wl {
                return false
            }

            return  helper(wArr, wi + intNum, wl, aArr, ai, al)
        }

        return false
    }
}
