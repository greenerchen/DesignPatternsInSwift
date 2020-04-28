//
//  Decorator.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

protocol Cost {
    var cost: Double { get }
}

protocol Ingredient {
    var ingredients: [String] { get }
}

typealias BeverageData = Cost & Ingredient

struct BlackCoffee: BeverageData {
    let cost: Double = 1.0
    let ingredients: [String] = ["Water", "Coffee"]
}

protocol Beverage: BeverageData {
    var beverage: BeverageData { get }
}

struct Milk: Beverage {
    let beverage: BeverageData
    
    var cost: Double {
        return 2.5
    }
    
    var ingredients: [String] {
        return beverage.ingredients + ["Milk"]
    }
}

struct WhipCoffee: Beverage {
    let beverage: BeverageData
    
    var cost: Double {
        return 4.5
    }
    
    var ingredients: [String] {
        return beverage.ingredients + ["Whip"]
    }
}

let coffee: BeverageData = BlackCoffee()
print("Cost: \(coffee.cost); Ingredients: \(coffee.ingredients)")
let coffeeLatte = Milk(beverage: coffee)
print("Cost: \(coffeeLatte.cost); Ingredients: \(coffeeLatte.ingredients)")
let whipLatte = WhipCoffee(beverage: coffee)
print("Cost: \(whipLatte.cost); Ingredients: \(whipLatte.ingredients)")
