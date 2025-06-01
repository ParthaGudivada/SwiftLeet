//
//  721_Accounts_Merge.swift
//  DSALearning
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
        var visited = Set<String>()
        var idToOtherIds = [String: [String]]()        // id: to related ids

        for (_, account) in accounts {
            let firstEmail = account[0]

            for i in 1 ..< account.count {
                adj[firstEmail, default: []].append(account[i])
                adj[account[i], default: []].append(firstEmail)
            }
        }

        var emailToId = [String: String]()
        for (id, account) in accounts {
            let firstEmail = account[0]

            if visited.contains(firstEmail) {
                let foundId = emailToId[firstEmail]!
                idToOtherIds[foundId]!.append(id)
            } else {
                idToOtherIds[id] = []
                helper(adj, firstEmail, id, &visited, &emailToId)
            }
        }

        var rslt = [[String]]()
        for (key, values) in idToOtherIds {
            var local = [String]()
            local.append(key)
            local.append(contentsOf: values)
            rslt.append(local)
        }

        return rslt
    }

    private func helper(
        _ adj: [String: [String]], _ email: String, _ id: String,
        _ visited: inout Set<String>, _ emailToId: inout [String: String]
    ) {
        visited.insert(email)
        emailToId[email] = id

        if let neighbors = adj[email] {
            for neighbor in neighbors where !visited.contains(neighbor) {
                helper(adj, neighbor, id, &visited, &emailToId)
            }
        }
    }
}
