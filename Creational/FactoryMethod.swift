//
//  FactoryMethod.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

import Foundation

protocol Baseball {
    func hit()
}

class LeatherBall: Baseball {
    func hit() {
        print("This ball is good to score runs")
    }
}

class WoodBall: Baseball {
    func hit() {
        print("This ball is good to test")
    }
}

protocol BaseballFactory {
    func deliverTheBall(speed: Int) -> Baseball
}

class LeatherBallFactory: BaseballFactory {
    func deliverTheBall(speed: Int) -> Baseball {
        print("Release the leather ball at speed \(speed)")
        return LeatherBall()
    }
}

class WoodBallFactory: BaseballFactory {
    func deliverTheBall(speed: Int) -> Baseball {
        print("Release the wood ball at speed \(speed)")
        return WoodBall()
    }
}

class Pitcher {
    enum AvailableBall: String {
        case leather = "Leather Ball"
        case wood = "Wood Ball"
        
        static let all = [leather, wood]
    }
    
    var factories = [AvailableBall:BaseballFactory]()
    var namedFactories = [(String, BaseballFactory)]()
    
    init() {
        factories[.leather] = LeatherBallFactory()
        factories[.wood] = WoodBallFactory()
        namedFactories.append((AvailableBall.leather.rawValue, factories[.leather]!))
        namedFactories.append((AvailableBall.wood.rawValue, factories[.wood]!))
    }
    
    func setBall() -> Baseball {
        let input = Int.random(in: 0..<2)
        return namedFactories[input].1.deliverTheBall(speed: 120)
    }
}


let pitcher = Pitcher()
let ball = pitcher.setBall()
ball.hit()
