//
//  ViewController.swift
//  AreaCalculator
//
//  Created by Rafis on 12.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        createFigure(.circle(radius: 10))
        createFigure(.triangle(a: 3, b: 4, c: 5))
        calculateFiguresArea()
    }
    
    // MARK: - Private Properties
    // Array of some figures
    private var figures = [Figure]()
    
    // MARK: - Private Methods
    private func createFigure(_ figureType: FigureType) {
        guard let figure = FigureFactory.createFigure(figureType) else { return }
        figures.append(figure)
    }
    
    // Calculate all figures areas
    private func calculateFiguresArea() {
        figures.forEach {
            print("Площадь фигуры \($0.name) = \($0.calculateArea())")
        }
    }
}

