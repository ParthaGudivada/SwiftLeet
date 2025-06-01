//
//  415_Add_Strings.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/23/25.
//

import Foundation

class AddStringsSolution {
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

class AddStringsVariantSolution {
    func addTwoNumbers(_ str1: String, _ str2: String) -> String {
        let arr1 = str1.components(separatedBy: ".")
        let isDecimal1 = arr1.count == 2
        let w1 = arr1[0]
        var d1 = isDecimal1 ? arr1[1] : ""

        let arr2 = str2.components(separatedBy: ".")
        let isDecimal2 = arr2.count == 2
        let w2 = arr2[0]
        var d2 = isDecimal2 ? arr2[1] : ""

        let hasDecimal = isDecimal1 || isDecimal2

        var carry = 0
        var decimalPortion = ""

        if hasDecimal {
            if d1.count < d2.count {
                while d1.count < d2.count {
                    d1 += "0"
                }
            } else {
                while d2.count < d1.count {
                    d2 += "0"
                }
            }

            decimalPortion = addStrings(d1, d2, &carry)
        }

        let numPortion = addStrings(w1, w2, &carry)

        var rslt = ""
        if carry != 0 {
            rslt += String(carry)
        }

        rslt += numPortion

        if hasDecimal {
            rslt += "."
            rslt += decimalPortion
        }

        return rslt
    }


    private func addStrings(_ num1: String, _ num2: String, _ carry: inout Int) -> String {
        let n1Arr = Array(num1.reversed())
        let l1 = n1Arr.count
        var i1 = 0

        let n2Arr = Array(num2.reversed())
        let l2 = n2Arr.count
        var i2 = 0

        var rslt = ""

        while i1 < l1 || i2 < l2  {
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

            rslt += String(cur)
        }

        return String(rslt.reversed())
    }
}
