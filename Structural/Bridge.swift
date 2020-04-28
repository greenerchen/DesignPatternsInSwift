//
//  Bridge.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

protocol Batter {
    func makeRuns(numOfBalls: Int)
}

struct Kyle: Batter {
    func makeRuns(numOfBalls: Int) {
        print("I'm Kyle and I scored \(0.6 * Double(numOfBalls)) runs in \(numOfBalls) balls")
    }
}

struct Gary: Batter {
    func makeRuns(numOfBalls: Int) {
        print("I'm Gary and I scored \(1 * Double(numOfBalls)) runs in \(numOfBalls) balls")
    }
}

struct Joanathan: Batter {
    func makeRuns(numOfBalls: Int) {
        print("I'm Joanathan and I scored \(1.2 * Double(numOfBalls)) runs in \(numOfBalls) balls")
    }
}

protocol Player {
    func play()
}

struct Baseballer: Player {
    var numOfBalls: Int
    var batter: Batter
    
    init(batter: Batter, numOfBalls: Int) {
        self.batter = batter
        self.numOfBalls = numOfBalls
    }
    
    func play() {
        batter.makeRuns(numOfBalls: numOfBalls)
    }
}


let kyle = Kyle()
let gary = Gary()
let joanathan = Joanathan()
let baseballer1 = Baseballer(batter: kyle, numOfBalls: 10)
let baseballer2 = Baseballer(batter: gary, numOfBalls: 16)
let baseballer3 = Baseballer(batter: joanathan, numOfBalls: 20)
baseballer1.play()
baseballer2.play()
baseballer3.play()
