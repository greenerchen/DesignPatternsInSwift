//
//  Composite.swift
//  DesignPatternsInSwift
//
//  Created by Greener Chen on 2020/4/27.
//

protocol Shape {
    func draw(fillColor: String)
}

class Square: Shape {
    func draw(fillColor: String) {
        print("Draw a square with fill color \(fillColor)")
    }
}

class Circle: Shape {
    func draw(fillColor: String) {
        print("Draw a circle with fill color \(fillColor)")
    }
}

// Composite
class Whiteboard: Shape {
    private lazy var shapes = [Shape]()
    
    init(_ shapes: Shape...) {
        self.shapes = shapes
    }
    
    func draw(fillColor: String) {
        for shape in shapes {
            shape.draw(fillColor: fillColor)
        }
    }
}

let whiteboard = Whiteboard(Circle(), Square())
whiteboard.draw(fillColor: "Blue")
