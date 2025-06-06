//
//  721_Accounts_Merge.swift
//  SwiftLeet
//
//  Created by Parthasarathy Gudivada on 5/23/25.
//

import Foundation

final class AccountsMergeSolution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var adj = [String: [String]]()
        var visited = Set<String>()
        var rslt = [[String]]()

        for account in accounts {
            let firstEmail = account[1]

            for i in stride(from: 2, to: account.count, by: 1) {
                adj[firstEmail, default: []].append(account[i])
                adj[account[i], default: []].append(firstEmail)
            }
        }

        for account in accounts {
            let firstEmail = account[1]
            var sameEmails = [String]()
            sameEmails.append(account[0])

            if !visited.contains(firstEmail) {
                helper(adj, firstEmail, &visited, &sameEmails)
                sameEmails[1...].sort()
                rslt.append(sameEmails)
            }
        }

        return rslt
    }

    private func helper(
        _ adj: [String: [String]], _ email: String,
        _ visited: inout Set<String>, _ sameEmails: inout [String]
    ) {
        visited.insert(email)
        sameEmails.append(email)

        if let neighbors = adj[email] {
            for neighbor in neighbors where !visited.contains(neighbor) {
                helper(adj, neighbor, &visited, &sameEmails)
            }
        }
    }
}

final class AccountsMergeVariantSolution {
    func mergeAccountIDs(_ accounts: [String: [String]]) -> [[String]] {
        var adj = [String: [String]]()

        for (id, emails) in accounts {
            let firstEmail = emails[0]

            for i in 1 ..< emails.count {
                adj[firstEmail, default: []].append(emails[i])
                adj[emails[i], default: []].append(firstEmail)
            }
        }

        var emailToId = [String: String]()
        var idToOtherIds = [String: [String]]()
        var visited = Set<String>()

        for (id, emails) in accounts {
            let firstEmail = emails[0]

            if visited.contains(firstEmail) {
                if let foundID = emailToId[firstEmail] {
                    idToOtherIds[foundID]!.append(id)
                }
            } else {
                idToOtherIds[id] = []
                helper(adj, id, firstEmail, &visited, &emailToId)
            }
        }

        let rslt = idToOtherIds.map { (id, otherIds) in
            [id] + otherIds
        }

        return rslt
    }

    private func helper(
        _ adj: [String: [String]], _ id: String, _ email: String,
        _ visited: inout Set<String>, _ emailToId: inout [String: String]
    ) {
        visited.insert(email)
        emailToId[email] = id

        if let neighbors = adj[email] {
            for neighbor in neighbors where !visited.contains(neighbor) {
                helper(adj, id, neighbor, &visited, &emailToId)
            }
        }
    }
}

//let accountVariant = AccountsMergeVariantSolution()
//let accounts = [
//    "C1": ["a", "b"],
//    "C2": ["c"],
//    "C3": ["b", "d"],
//    "C4": ["d"],
//    "C5": ["e"],
//    "C6": ["c"],
//    "C7": ["a"]
//]
//print(accountVariant.mergeAccountIDs(accounts))
