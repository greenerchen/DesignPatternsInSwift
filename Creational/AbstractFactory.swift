//
//  AbstractFactory.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

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

protocol Glove {
    func catchBall()
}

class LeatherGlove: Glove {
    func catchBall() {
        print("Catch ball with a leather glove")
    }
}

class RubberGlove: Glove {
    func catchBall() {
        print("Catch ball with a rubber glove :(")
    }
}

protocol BaseballKitsFactory {
    func deliverTheBall() -> Baseball
    func deliverTheGlove() -> Glove
}

class BaseballGameKitsFactory: BaseballKitsFactory {
    func deliverTheBall() -> Baseball {
        print("Release the leather ball")
        return LeatherBall()
    }
    
    func deliverTheGlove() -> Glove {
        print("Release the leather glove")
        return LeatherGlove()
    }
}

class BaseballTestKitsFactory: BaseballKitsFactory {
    func deliverTheBall() -> Baseball {
        print("Release the wood ball")
        return WoodBall()
    }
    
    func deliverTheGlove() -> Glove {
        print("Release the rubber glove")
        return RubberGlove()
    }
}

class BaseballKitsStation {
    private var baseball: Baseball
    private var glove: Glove
    
    init(kitsFactory: BaseballKitsFactory) {
        baseball = kitsFactory.deliverTheBall()
        glove = kitsFactory.deliverTheGlove()
    }
    
    func tryKits() {
        baseball.hit()
        glove.catchBall()
    }
}


let gameKitsFactory = BaseballGameKitsFactory()
let testKitsFactory = BaseballTestKitsFactory()
var station = BaseballKitsStation(kitsFactory: gameKitsFactory)
station.tryKits()
station = BaseballKitsStation(kitsFactory: testKitsFactory)
station.tryKits()
