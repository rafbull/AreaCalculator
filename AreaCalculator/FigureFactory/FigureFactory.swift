//
//  FigureFactory.swift
//  AreaCalculator
//
//  Created by Rafis on 12.02.2024.
//

import Foundation

enum FigureType {
    case circle(radius: Float)
    case triangle(a: Float, b: Float, c: Float)
}

final class FigureFactory {
    static func createFigure(_ type: FigureType) -> Figure? {
        switch type {
        case let .circle(radius):
            return Circle(radius: radius)
        case let .triangle(a, b, c):
            return Triangle(sideA: a, sideB: b, sideC: c)
        }
    }
}
