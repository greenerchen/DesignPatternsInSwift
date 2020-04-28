//
//  Visitor.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

import Foundation

protocol BaseballAccessory {
    func accept(counter: CheckoutCounter) -> Int
}

class BaseballBat: BaseballAccessory {
    private var price: Double
    private var brand: String
    
    init(price: Double, brand: String) {
        self.price = price
        self.brand = brand
    }
    
    func getPrice() -> Double {
        return price
    }
    
    func getBrand() -> String {
        return brand
    }
    
    func accept(counter: CheckoutCounter) -> Int {
        counter.moveToCounter(bat: self)
    }
}

class BaseballBall: BaseballAccessory {
    private var price: Double
    private var brand: String
    
    init(price: Double, brand: String) {
        self.price = price
        self.brand = brand
    }
    
    func getPrice() -> Double {
        return price
    }
    
    func getBrand() -> String {
        return brand
    }
    
    func accept(counter: CheckoutCounter) -> Int {
        counter.moveToCounter(ball: self)
    }
}

class BaseballGlove: BaseballAccessory {
    private var price: Double
    private var brand: String
    
    init(price: Double, brand: String) {
        self.price = price
        self.brand = brand
    }
    
    func getPrice() -> Double {
        return price
    }
    
    func getBrand() -> String {
        return brand
    }
    
    func accept(counter: CheckoutCounter) -> Int {
        counter.moveToCounter(glove: self)
    }
}

protocol CheckoutCounter {
    func moveToCounter(bat: BaseballBat) -> Int
    func moveToCounter(ball: BaseballBall) -> Int
    func moveToCounter(glove: BaseballGlove) -> Int
}

class CashCounter: CheckoutCounter {
    
    func moveToCounter(bat: BaseballBat) -> Int {
        var cost: Int = 0
        if bat.getBrand() == "MLB" {
            cost = Int(1.2 * bat.getPrice())
        } else {
            cost = Int(bat.getPrice())
        }
        print("Bat brand : \(bat.getBrand()) and price is : \(cost) ")
        return cost
    }
    
    func moveToCounter(ball: BaseballBall) -> Int {
        let cost = Int(ball.getPrice())
        print("Ball brand : \(ball.getBrand()) and price is : \(cost) ")
        return cost
    }
    
    func moveToCounter(glove: BaseballGlove) -> Int {
        var cost = Int(glove.getPrice())
        if glove.getBrand() == "MLB" {
            cost = Int(1.1 * glove.getPrice())
        } else {
            cost = Int(glove.getPrice())
        }
        print("Ball brand : \(glove.getBrand()) and price is : \(cost) ")
        return cost
    }
}

func finalPriceCalculation(accessories: [BaseballAccessory]) -> Int {
    let counter = CashCounter()
    var cost: Int = 0
    for accessory in accessories {
        cost += accessory.accept(counter: counter)
    }
    print("Total cart price: \(cost)")
    return cost
}

var cartItems: [BaseballAccessory]
let mlbBat = BaseballBat(price: 30, brand: "MLB")
let otherBat = BaseballBat(price: 25, brand: "Oth")
let leatherBall = BaseballBall(price: 20, brand: "MLB")
let woodBall = BaseballBall(price: 10, brand: "Oth")
let brownGlove = BaseballGlove(price: 15, brand: "MLB")
let redGlove = BaseballGlove(price: 12, brand: "Oth")
cartItems = [mlbBat, otherBat, leatherBall, woodBall, brownGlove, redGlove]
let cost = finalPriceCalculation(accessories: cartItems)
print("Checked out with Bill amount: \(cost)")
