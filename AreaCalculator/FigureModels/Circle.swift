//
//  Circle.swift
//  AreaCalculator
//
//  Created by Rafis on 12.02.2024.
//

import Foundation

struct Circle: Figure {
    let name = "Круг"
    
    var radius: Float
    
    init?(radius: Float) {
        guard radius > 0 else { print("Для фигуры \"\(name)\" ведите значения выше 0"); return nil }
        self.radius = radius
    }
    
    func calculateArea() -> Float {
        let area = .pi * pow(radius, 2)
        return area
    }
}
