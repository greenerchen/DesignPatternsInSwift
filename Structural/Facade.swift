//
//  Facade.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

struct Team {
    let _id: String
    var name: String
}

struct Player {
    let _id: String
    var primaryRole: String
    var price: Double
}

extension Team: Hashable, Equatable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(_id.hashValue)
    }
    
    static func ==(lhs: Team, rhs: Team) -> Bool {
        return lhs._id == rhs._id
    }
}

extension Player: Hashable, Equatable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(_id.hashValue)
    }
    
    static func ==(lhs: Player, rhs: Player) -> Bool {
        return lhs._id == rhs._id
    }
}

class AvailablePlayersList {
    var players: [Player:Int] = [:]
    
    init(_ players: [Player:Int]) {
        self.players = players
    }
}

class SoldPlayersList {
    var players: [Team:[Player]] = [:]
}

class AuctionFacade {
    let availablePlayersList: AvailablePlayersList
    let soldPlayersList: SoldPlayersList
    
    init(availablePlayersList: AvailablePlayersList, soldPlayersList: SoldPlayersList) {
        self.availablePlayersList = availablePlayersList
        self.soldPlayersList = soldPlayersList
    }
    
    func buyPlayer(for player: Player, by team: Team) {
        print("Ready to buy \(player.primaryRole) with id \(player._id) - '\(team.name)'")
        
        let count = availablePlayersList.players[player, default: 0]
        guard count > 0 else {
            print("\(player.primaryRole) is sold out")
            return
        }
        
        availablePlayersList.players[player] = count - 1
        
        var soldouts = soldPlayersList.players[team, default: []]
        soldouts.append(player)
        soldPlayersList.players[team] = soldouts
        
        print("\(player.primaryRole) with id \(player._id) bought by '\(team.name)'")
    }
}


let catcher1 = Player(_id: "1234", primaryRole: "Catcher", price: 134)
let pitcher1 = Player(_id: "3423", primaryRole: "Pitcher", price: 242)
let availablePlayersList = AvailablePlayersList([catcher1: 3, pitcher1: 14])
let auctionFacade = AuctionFacade(availablePlayersList: availablePlayersList, soldPlayersList: SoldPlayersList())
let team1 = Team(_id: "T4322", name: "Yankees")
auctionFacade.buyPlayer(for: catcher1, by: team1)
auctionFacade.buyPlayer(for: pitcher1, by: team1)
