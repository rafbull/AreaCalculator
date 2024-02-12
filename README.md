

## Вычисление площади круга по радиусу и треугольника по трем сторонам

#### Ссылка на текст тестового задания [в google docs](https://docs.google.com/document/d/1rPHrw8JMLefuI3Ps-tpwFvfCPfq3xOekPQraOH6nAMg/edit?usp=sharing)

---

### Здесь фигуры создаются с помощью паттерна "Фабричный метод". Он позволит легко добавлять фигуры в проект, если это потребуется в дальнейшем.

---

### Для удобства ниже приведены ключевые сущности из проекта

#### Фабричный метод для фигур
```swift
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
```

#### Протокол для работы с фигурами
```swift
// MARK: - Figure Protocol
// Протокол для фигуры, чтобы работать не с конкретным типом фигуры, а с абстракцией
protocol Figure {
    var name: String { get }
    func calculateArea() -> Float
}
```

#### Структура для треугольника
```swift
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
    
    // Проверка на то, является ли треугольник прямоугольным
    var isRectangularTriangle: Bool {
        return pow(sideA, 2) + pow(sideB, 2) == pow(sideC, 2) ||
        pow(sideA, 2) + pow(sideC, 2) == pow(sideB, 2) ||
        pow(sideB, 2) + pow(sideC, 2) == pow(sideA, 2)
    }
}
```

#### Один из вариантов кода клиента
```swift
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
```
#### Результат выполнения
```
Площадь фигуры Круг = 314.15924
Площадь фигуры Треугольник = 6.0
```

