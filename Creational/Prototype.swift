//
//  Prototype.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

struct TeamBaseballer {
    let team: String
    var name: String
    var strikeRate: Float
    
    init(team: String, name: String, strikeRate: Float) {
        self.team = team
        self.name = name
        self.strikeRate = strikeRate
    }
    
    func clone() -> TeamBaseballer {
        return TeamBaseballer(team: team, name: name, strikeRate: strikeRate)
    }
}

let baseballer1 = TeamBaseballer(team: "Yankees", name: "Kyle", strikeRate: 0.12)
var baseballer2 = baseballer1.clone()
baseballer2.name = "DJ"
baseballer2.strikeRate = 0.18
var baseballer3 = baseballer1.clone()
baseballer3.name = "Luis"
baseballer3.strikeRate = 0.28
