//
//  Interpreter.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

protocol IntegerExpression {
    func evaluate(_ context: IntegerContext) -> Int
    func replace(character: Character, integerExpression: IntegerExpression) -> IntegerExpression
    func copied() -> IntegerExpression
}

final class IntegerContext {
    private var data: [Character: Int] = [:]
    
    func lookup(name: Character) -> Int {
        return data[name]!
    }
    
    func assign(expression: IntegerVariableExpression, value: Int) {
        data[expression.name] = value
    }
}

final class IntegerVariableExpression: IntegerExpression {
    let name: Character
    
    init(name: Character) {
        self.name = name
    }
    
    func evaluate(_ context: IntegerContext) -> Int {
        return context.lookup(name: name)
    }
    
    func replace(character name: Character, integerExpression: IntegerExpression) -> IntegerExpression {
        if name == self.name {
            return integerExpression.copied()
        } else {
            return IntegerVariableExpression(name: name)
        }
    }
    
    func copied() -> IntegerExpression {
        return IntegerVariableExpression(name: name)
    }
}

final class AddExpression: IntegerExpression {
    private var operand1: IntegerExpression
    private var operand2: IntegerExpression
    
    init(op1: IntegerExpression, op2: IntegerExpression) {
        operand1 = op1
        operand2 = op2
    }
    
    func evaluate(_ context: IntegerContext) -> Int {
        return operand1.evaluate(context) + operand2.evaluate(context)
    }
    
    func replace(character: Character, integerExpression: IntegerExpression) -> IntegerExpression {
        return AddExpression(op1: operand1.replace(character: character, integerExpression: integerExpression),
                             op2: operand2.replace(character: character, integerExpression: integerExpression))
    }
    
    func copied() -> IntegerExpression {
        return AddExpression(op1: operand1, op2: operand2)
    }
}


var context = IntegerContext()
var a = IntegerVariableExpression(name: "A")
var b = IntegerVariableExpression(name: "B")
var c = IntegerVariableExpression(name: "C")

// a + (b + c)
var expression = AddExpression(op1: a, op2: AddExpression(op1: b, op2: c))
context.assign(expression: a, value: 11)
context.assign(expression: b, value: 23)
context.assign(expression: c, value: 8)

let result = expression.evaluate(context)
print(result)
