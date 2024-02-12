//
//  Triangle.swift
//  AreaCalculator
//
//  Created by Rafis on 12.02.2024.
//

import Foundation

struct Triangle: Figure {
    let name = "Треугольник"
    
    var sideA: Float
    var sideB: Float
    var sideC: Float
    
    init?(sideA: Float, sideB: Float, sideC: Float) {
        guard sideA > 0 && sideB > 0 && sideC > 0 else { print("Для фигуры \"\(name)\" ведите значения выше 0"); return nil }
        self.sideA = sideA
        self.sideB = sideB
        self.sideC = sideC
    }
    
    func calculateArea() -> Float {
        let p = (sideA + sideB + sideC) / 2
        let s = sqrt(p * (p - sideA) * (p - sideB) * (p - sideC))
        return s
    }
    
    var isRectangularTriangle: Bool {
        return pow(sideA, 2) + pow(sideB, 2) == pow(sideC, 2) ||
        pow(sideA, 2) + pow(sideC, 2) == pow(sideB, 2) ||
        pow(sideB, 2) + pow(sideC, 2) == pow(sideA, 2)
    }
}
