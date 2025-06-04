//
//  415_Add_Strings.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/23/25.
//

import Foundation

final class AddStringsSolution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        let n1Arr = Array(num1.reversed())
        let l1 = n1Arr.count
        var i1 = 0

        let n2Arr = Array(num2.reversed())
        let l2 = n2Arr.count
        var i2 = 0

        var carry = 0
        var rslt = ""

        while i1 < l1 || i2 < l2 || carry != 0 {
            var digit = carry

            if i1 < l1 {
                digit += Int(String(n1Arr[i1]))!
                i1 += 1
            }

            if i2 < l2 {
                digit += Int(String(n2Arr[i2]))!
                i2  += 1
            }

            let cur = digit % 10
            carry = digit / 10

            rslt = String(cur) + rslt
        }

        return rslt
    }
}

final class AddStringsVariantSolution {
    func addDecimalStrings(_ num1: String, _ num2: String) -> String {
        let n1Comp = num1.components(separatedBy: ".")
        let n1HasDecimal = n1Comp.count > 1

        let n2Comp = num2.components(separatedBy: ".")
        let n2HasDecimal = n2Comp.count > 1

        let hasDecimal = n1HasDecimal || n2HasDecimal

        var carry = 0
        var decPortion = ""
        if hasDecimal {
            var dec1 = n1HasDecimal ? n1Comp[1] : ""
            var dec2 = n2HasDecimal ? n2Comp[1] : ""

            while dec1.count != dec2.count {
                if dec1.count < dec2.count {
                    dec1.append("0")
                } else {
                    dec2.append("0")
                }
            }

            decPortion = addNumStrings(dec1, dec2, &carry)
        }

        let numPortion = addNumStrings(n1Comp[0], n2Comp[0], &carry)

        var rslt = numPortion

        if carry > 0 {
            rslt = "\(carry)\(rslt)"
        }

        if hasDecimal {
            rslt.append(".")
            rslt.append(String(decPortion))
        }

        return rslt
    }

    private func addNumStrings(_ str1: String, _ str2: String, _ carry: inout Int) -> String {
        let n1 = Array(str1.reversed())
        let l1 = n1.count

        let n2 = Array(str2.reversed())
        let l2 = n2.count

        var i = 0
        var rslt = ""

        while i < l1 || i < l2  {
            var digit = carry

            if i < l1 {
                digit += Int(String(n1[i]))!
            }

            if i < l2 {
                digit += Int(String(n2[i]))!
            }

            let cur = digit % 10
            carry = digit / 10
            rslt = "\(cur)\(rslt)"

            i += 1
        }

        return rslt
    }
}

//let addStrings = AddStringsVariantSolution()
//print(addStrings.addDecimalStrings("10", "20"))
//print(addStrings.addDecimalStrings("10.", "20"))
//print(addStrings.addDecimalStrings("11.11", "123.5"))
//print(addStrings.addDecimalStrings("91.465", "72.800"))
//print(addStrings.addDecimalStrings("91.465", "72.8"))
//print(addStrings.addDecimalStrings("9.", "9.4"))
//print(addStrings.addDecimalStrings(".15", "612"))
//print(addStrings.addDecimalStrings(".40", "10"))
//print(addStrings.addDecimalStrings("10.4", "10.42"))
