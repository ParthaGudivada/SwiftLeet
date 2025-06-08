//
//  528_RandomPickVariantSolution.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/30/25.
//

final class RandomPickSolution {
    private var prefixSum: [Int]
    private let totSum: Int

    init(_ w: [Int]) {
        let len = w.count

        prefixSum = w
        for i in 1 ..< len {
            prefixSum[i] += prefixSum[i - 1]
        }

        totSum = prefixSum[len - 1]
    }

    func pickIndex() -> Int {
        let targetWeight = Int.random(in: 1 ... totSum)
        return lowerBoundSearchIdx(targetWeight)
    }

    private func lowerBoundSearchIdx(_ targetWeight: Int) -> Int {
        var l = 0
        var r = prefixSum.count - 1

        while l <= r {
            let m = ( ( r - l ) / 2 ) + l

            if prefixSum[m] < targetWeight {
                l = m + 1
            } else {
                r = m - 1
            }
        }

        return l
    }
}

final class RandomPickVariantSolution {
    struct CityPop {
        let city: String
        private(set) var pop: Int

        init(_ city: String, _ pop: Int) {
            self.city = city
            self.pop = pop
        }

        init(_ cityInfo: [String]) {
            city = cityInfo[0]
            pop = Int(cityInfo[1])!
        }

        mutating func addPop(_ inc: Int) {
            pop += inc
        }
    }

    private var cumCityPop: [CityPop]
    private var totPop: Int

    init(_ cityInfos: [[String]]) {
        let len = cityInfos.count

        cumCityPop = [CityPop]()
        cumCityPop.append(CityPop(cityInfos[0]))

        for i in 1 ..< len {
            let prevCityPop = cumCityPop[i - 1]
            var curCityPop = CityPop(cityInfos[i])
            curCityPop.addPop(prevCityPop.pop)
            cumCityPop.append(curCityPop)
        }

        totPop = cumCityPop[len - 1].pop
    }

    func pickIndex() -> String {
        let targetWeight = Int.random(in: 0 ... totPop)
        return lowerBoundSearch(targetWeight).city
    }

    private func lowerBoundSearch(_ targetWeight: Int) -> CityPop {
        var l = 0
        var r = cumCityPop.count - 1

        while l <= r {
            let m = ( r + l ) / 2

            if cumCityPop[m].pop >= targetWeight {
                r = m - 1
            } else {
                l = m + 1
            }
        }

        return cumCityPop[l]
    }
}

//var cityPopulation = [["New York", "900"], ["Seattle", "500"], ["Los Angeles", "400"]]
//let rndPickupSolution = RandomPickVariantSolution(cityPopulation)
//print(rndPickupSolution.pickIndex())
