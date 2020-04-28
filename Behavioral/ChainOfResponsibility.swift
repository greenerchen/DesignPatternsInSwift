//
//  ChainOfResponsibility.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

protocol HandlerRequest {
    func handleRequest(_ equotion: String) -> Int
}

class AddHandler: HandlerRequest {
    private var next: HandlerRequest?
    
    init(next: HandlerRequest?) {
        self.next = next
    }
    
    func handleRequest(_ equotion: String) -> Int {
        if !equotion.contains("+") {
            return next?.handleRequest(equotion) ?? Int(equotion)!
        }
        let elements = equotion.filter { !$0.isNewline && !$0.isWhitespace }.split(separator: "+")
        let (lhs, rhs) = (elements[0], elements[1])
        return Int(lhs)! + Int(rhs)!
    }
}

class SubtractHandler: HandlerRequest {
    private var next: HandlerRequest?
    
    init(next: HandlerRequest?) {
        self.next = next
    }
    
    func handleRequest(_ equotion: String) -> Int {
        if !equotion.contains("-") {
            return next?.handleRequest(equotion) ?? Int(equotion)!
        }
        let elements = equotion.filter { !$0.isNewline && !$0.isWhitespace }.split(separator: "-")
        let (lhs, rhs) = (elements[0], elements[1])
        return Int(lhs)! - Int(rhs)!
    }
}

class MultiplyHandler: HandlerRequest {
    private var next: HandlerRequest?
    
    init(next: HandlerRequest?) {
        self.next = next
    }
    
    func handleRequest(_ equotion: String) -> Int {
        if !equotion.contains("*") {
            return next?.handleRequest(equotion) ?? Int(equotion)!
        }
        let elements = equotion.filter { !$0.isNewline && !$0.isWhitespace }.split(separator: "*")
        let (lhs, rhs) = (elements[0], elements[1])
        return Int(lhs)! * Int(rhs)!
    }
}

class DivideHandler: HandlerRequest {
    private var next: HandlerRequest?
    
    init(next: HandlerRequest?) {
        self.next = next
    }
    
    func handleRequest(_ equotion: String) -> Int {
        if !equotion.contains("/") {
            return next?.handleRequest(equotion) ?? Int(equotion)!
        }
        let elements = equotion.filter { !$0.isNewline && !$0.isWhitespace }.split(separator: "/")
        let (lhs, rhs) = (elements[0], elements[1])
        
        return Int(lhs)! / Int(rhs)!
    }
}

class SimpleCalculator {
    let addHandler: AddHandler
    let subtractHandler: SubtractHandler
    let multiplyHandler: MultiplyHandler
    let divideHandler: DivideHandler
    
    init() {
        subtractHandler = SubtractHandler(next: nil)
        addHandler = AddHandler(next: subtractHandler)
        divideHandler = DivideHandler(next: addHandler)
        multiplyHandler = MultiplyHandler(next: divideHandler)
    }
    
    func calc(_ equotion: String) -> Int {
        return multiplyHandler.handleRequest(equotion)
    }
}

let sCal = SimpleCalculator()
print("1 + 2 =", sCal.calc("1+2"))
print("1 - 2 =", sCal.calc("1-2"))
print("2 * 2 =", sCal.calc("2*2"))
print("2 / 2 =", sCal.calc("2/2"))
