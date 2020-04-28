//
//  Iterator.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

struct BaseballPlayer {
    let name: String
    let team: String
}

struct BaseballPlayers {
    let players: [BaseballPlayer]
}

struct PlayersIterator: IteratorProtocol {
    private var current = 0
    private let players: [BaseballPlayer]
    
    init(_ players: [BaseballPlayer]) {
        self.players = players
    }
    
    mutating func next() -> BaseballPlayer? {
        defer {
            current += 1
        }
        if current < players.count {
            return players[current]
        } else {
            return nil
        }
    }
}

extension BaseballPlayers: Sequence {
    func makeIterator() -> PlayersIterator {
        return PlayersIterator(players)
    }
}

let players = BaseballPlayers(players: [BaseballPlayer(name: "David", team: "Yankees"),
                                        BaseballPlayer(name: "Moore", team: "Red Sox"),
                                        BaseballPlayer(name: "Crus", team: "Orioles")])
for player in players {
    print(player)
}
