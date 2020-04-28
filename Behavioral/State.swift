//
//  State.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

protocol PitchedState {
    func result() -> String
    func strikes() -> Int
    func balls() -> Int
}

class StrikeState: PitchedState {
    func result() -> String { return "Strike!" }
    func strikes() -> Int { return 1 }
    func balls() -> Int { return 0 }
}

class BallState: PitchedState {
    func result() -> String { return "Ball!" }
    func strikes() -> Int { return 0 }
    func balls() -> Int { return 1 }
}

enum BatterResult: String {
    case none = ""
    case strikeout = "The batter is out!"
    case walk = "The batter gets to advance to first base."
}

class AtBat {
    var strikes: Int = 0 {
        didSet {
            if strikes == 3 {
                batterResult = .strikeout
            }
        }
    }
    var balls: Int = 0 {
        didSet {
            if balls == 4 {
                batterResult = .walk
            }
        }
    }
    private var batterResult: BatterResult = .none
    
    func pitched(withState state: PitchedState) {
        strikes += state.strikes()
        balls += state.balls()
        print(state.result() + " \(strikes) strike(s), \(balls) ball(s). \(batterResult.rawValue)")
    }
}

let bat = AtBat()
bat.pitched(withState: BallState())
bat.pitched(withState: StrikeState())
bat.pitched(withState: StrikeState())
bat.pitched(withState: BallState())
bat.pitched(withState: BallState())
bat.pitched(withState: StrikeState())
