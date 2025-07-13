import Foundation

// enum

enum Color: String {
    case red = "#EE0000"
    case blue = "0067A3"
    case green = "00FF00"
}

enum Shape {
    case width(Int)
    case height(Int)
    case background(Color)
    case borderWidth(Int)
}

print(Shape.width(10))
