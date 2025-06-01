//
//  528_RandomPickVariantSolution.swift
//  DSALearning
//
//  Created by Parthasarathy Gudivada on 5/30/25.
//

final class RandomPickSolution {
    private var prefixSum: [Int]
    private let totSum: Int

    init(_ w: [Int]) {
        prefixSum = w

        for i in 1 ..< w.count {
            prefixSum[i] += prefixSum[i - 1]
        }

        totSum = prefixSum.last!
    }

    func pickIndex() -> Int {
        let target = Int.random(in: 1 ... totSum)
        return lowerBoundSearch(target)
    }

    private func lowerBoundSearch(_ target: Int) -> Int {
        var l = 0
        var r = prefixSum.count - 1

        while l <= r {
            let m = ( l + r ) / 2

            if prefixSum[m] >= target {
                r = m - 1
            } else {
                l = m + 1
            }
        }

        return l
    }
}

final class RandomPickVariantSolution {
    struct CityPop {
        let city: String
        let pop: Int

        init(_ city: String, _ pop: Int) {
            self.city = city
            self.pop = pop
        }
    }

    private var cumCityPop: [CityPop]
    private var totPop: Int

    init(_ cityInfo: [[Any]]) {
        cumCityPop = [CityPop]()

        cumCityPop.append(CityPop(cityInfo[0][0] as! String, cityInfo[0][1] as! Int))

        for i in 1 ..< cityInfo.count {
            cumCityPop.append(
                CityPop(
                    cityInfo[i][0] as! String,
                    cityInfo[0][1] as! Int + cumCityPop[i - 1].pop
                )
            )
        }
        totPop = cumCityPop.last!.pop
    }

    func pickIndex() -> String {
        let target = Int.random(in: 0 ... totPop)
        return lowerBoundSearch(target).city
    }

    private func lowerBoundSearch(_ target: Int) -> CityPop {
        var l = 0
        var r = cumCityPop.count - 1

        while l <= r {
            let m = ( r + l ) / 2

            if cumCityPop[m].pop >= target {
                r = m - 1
            } else {
                l = m + 1
            }
        }
        print(target, cumCityPop[l])
        return cumCityPop[l]
    }
}
