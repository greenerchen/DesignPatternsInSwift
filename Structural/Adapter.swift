//
//  Adapter.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

protocol Batter {
    func makeRuns()
    func fieldWell()
}

class BatterA : Batter {
    func makeRuns() {
        print("I can bat well but only at strike rate of 0.21")
    }
    
    func fieldWell() {
        print("I can field well")
    }
}

protocol L2000Batter {
    func batAggressively()
}

class BatterB : L2000Batter {
    func batAggressively() {
        print("I need to bat well at a strike rate of more than 0.43")
    }
}

class BatterAdapter: L2000Batter {
    let batter: Batter
    
    init(batter: Batter) {
        self.batter = batter
    }
    
    func batAggressively() {
        batter.makeRuns()
    }
}

let a = BatterA()
let b = BatterB()
b.batAggressively()
let adapter = BatterAdapter(batter: a)
adapter.batAggressively()
