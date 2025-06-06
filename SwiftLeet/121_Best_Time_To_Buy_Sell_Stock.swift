//
//  121_Best_Time_To_Buy_Sell_Stock.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/2/25.
//

import Foundation

final class BestTimeToBuySellStockSolution {
    func maxProfit(_ prices: [Int]) -> Int {
        let len = prices.count

        var minPrice = prices[0]
        var maxProfit = 0

        for i in 1 ..< len {
            let curPrice = prices[i]
            maxProfit = max(maxProfit, curPrice - minPrice)
            minPrice = min(minPrice, curPrice)
        }

        return maxProfit
    }
}

final class BestTimeToBuyFlightTicketsSolution {
    func minRoundTripCost(_ departures: [Int], _ returns: [Int]) -> Int {
        let len = departures.count

        var minDepCost = departures[0]
        var minRoundTicketPrice = Int.max

        for i in 1 ..< len {
            minRoundTicketPrice = min(minRoundTicketPrice, minDepCost + returns[i])
            minDepCost = min(minDepCost, departures[i])
        }

        return minRoundTicketPrice
    }
}

//let btFlightTickets = BestTimeToBuyFlightTicketsSolution()
//var departures = [4, 3, 5, 11, 2]
//var returns = [1, 6, 10, 2, 9]
//print(btFlightTickets.minRoundTripCost(departures, returns))
//departures = [1, 2, 3, 4]
//returns = [4, 3, 2, 1]
//print(btFlightTickets.minRoundTripCost(departures, returns))

