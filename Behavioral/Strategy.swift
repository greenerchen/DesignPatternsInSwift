//
//  Strategy.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

enum BaseballSpeed: Int {
    case fast = 90
    case medium = 80
    case slow = 70
}

enum Baseball: String {
    case fastball = "fastball"
    case slider = "slider"
    case changeup = "change-up"
    case curveball = "curveball"
}

protocol BaseballPitchStrategy {
    var speed: BaseballSpeed { get set }
    var baseball: Baseball { get set }
    func pitch() -> String
}

class Fastball: BaseballPitchStrategy {
    var speed: BaseballSpeed = .fast
    var baseball: Baseball = .fastball
    func pitch() -> String {
        return "The pitcher threw a \(baseball.rawValue) pitch at \(speed.rawValue)+ mph"
    }
}

class Slider: BaseballPitchStrategy {
    var speed: BaseballSpeed = .medium
    var baseball: Baseball = .slider
    func pitch() -> String {
        return "The pitcher threw a \(baseball.rawValue) pitch at \(speed.rawValue)s mph"
    }
}

class Changeup: BaseballPitchStrategy {
    var speed: BaseballSpeed = .medium
    var baseball: Baseball = .changeup
    func pitch() -> String {
        return "The pitcher threw a \(baseball.rawValue) pitch at \(speed.rawValue)s mph"
    }
}

class Curveball: BaseballPitchStrategy {
    var speed: BaseballSpeed = .slow
    var baseball: Baseball = .curveball
    func pitch() -> String {
        return "The pitcher threw a \(baseball.rawValue) pitch at \(speed.rawValue)s mph"
    }
}

class Pitcher {
    private var pitchStrategy: BaseballPitchStrategy
    
    init(withStrategy strategy: BaseballPitchStrategy) {
        pitchStrategy = strategy
    }
    
    func pitch() -> String {
        return pitchStrategy.pitch()
    }
}

var pitcher = Pitcher(withStrategy:Fastball())
var result = pitcher.pitch()
print (result)
pitcher = Pitcher(withStrategy:Curveball())
result = pitcher.pitch()
print (result)
pitcher = Pitcher(withStrategy:Changeup())
result = pitcher.pitch()
print (result)
pitcher = Pitcher(withStrategy:Slider())
result = pitcher.pitch()
print (result)
