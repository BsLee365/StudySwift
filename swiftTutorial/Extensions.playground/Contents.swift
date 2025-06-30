import Foundation

extension Int {
    func plusTwo() -> Int {
        return self + 2
    }
}

let two = 2
two.plusTwo( )
two

struct Person {
    let firstName: String
    let lastName: String
}

extension Person {
    init(fullName: String) {
        let components = fullName.components(separatedBy: " ")
        // extension에서는 init을 못함. 그래서 self.init을 통해서 초기화 해줘야 함.
        self.init(firstName: components.first ?? fullName, lastName: components.last ?? fullName)
    }
}

let person = Person(fullName: "Foo Bar")
person.firstName
person.lastName

protocol GoesVroom {
    var vroomValue: String { get }
    func goVroom() -> String
}

extension GoesVroom {
    func goVroom() -> String {
        "\(self.vroomValue) goes vroom"
    }
}

struct Car {
    let manufactorer: String
    let model: String
}

let modelX = Car(manufactorer: "Tesla", model: "X")

extension Car: GoesVroom {
    var vroomValue: String {
        "\(self.manufactorer) model \(self.model)"
    }
}

// vroomValue는 인식을 못함
modelX.goVroom()

// 하지만 class는 다르다
class MyDouble {
    let value: Double
    init(value: Double) {
        self.value = value
    }
}

extension MyDouble {
    convenience init() {
        self.init(value: 0)
    }
}
let myDouble = MyDouble()
myDouble.value

extension GoesVroom {
    func goVroomVrromEvenMore() -> String {
        "\(self.goVroom()) even more!"
    }
}
modelX.goVroomVrromEvenMore()
