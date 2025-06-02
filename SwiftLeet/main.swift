//
//  main.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 6/1/25.
//

import Foundation

print("Welcome to Swift world of DSA")

let btFlightTickets = BestTimeToBuyFlightTicketsSolution()
var departures = [4, 3, 5, 11, 2]
var returns = [1, 6, 10, 2, 9]
print(btFlightTickets.minRoundTripCost(departures, returns))
departures = [1, 2, 3, 4]
returns = [4, 3, 2, 1]
print(btFlightTickets.minRoundTripCost(departures, returns))

