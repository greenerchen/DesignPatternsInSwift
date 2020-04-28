//
//  Flyweight.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

// Flyweight
struct Coffee {
    let origin: String
}

protocol CoffeeSearching {
    func search(origin: String) -> Coffee?
}

// Menu acts as a factory and caches for Coffee objects
final class Menu: CoffeeSearching {
    private var coffeeAvailable: [String:Coffee] = [:]
    
    func search(origin: String) -> Coffee? {
        if coffeeAvailable[origin] == nil {
           coffeeAvailable[origin] = Coffee(origin: origin)
        }
        return Coffee(origin: origin)
    }
}

final class CoffeeShop {
    private var orders: [Int: Coffee] = [:]
    private let menu: CoffeeSearching
    
    init(menu: CoffeeSearching) {
        self.menu = menu
    }
    
    func takeOrder(origin: String, clientNo: Int) {
        orders[clientNo] = menu.search(origin: origin)
    }
    
    func serve() {
        for (clientNo, coffee) in orders {
            print("Serve \(coffee) to client \(clientNo)")
        }
    }
}

let coffeeShop = CoffeeShop(menu: Menu())
coffeeShop.takeOrder(origin: "Yirgacheffe, Ethiopia", clientNo: 1)
coffeeShop.takeOrder(origin: "Sidmo, Italy", clientNo: 2)
coffeeShop.serve()
