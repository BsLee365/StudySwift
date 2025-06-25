import Foundation

func noArgumentsAndNoReturnValue() {
    print("print me")
}

func plusTow(value: Int) {
    value + 2
}

plusTow(value: 10)

// return
func newPlusTwo(value: Int) -> Int {
    value + 2
}
let result = newPlusTwo(value: 10)

func customAdd(
    value1: Int,
    value2: Int
) -> Int {
    value1 + value2
}

func customMinus(
    _ lhs: Int,
    _ rhs: Int
) -> Int {
    lhs - rhs
}

let customSubtracted = customMinus(10, 20)


customAdd(
    value1: 10,
    value2: 20
)

// @discardableResult
func myCustomAdd(
    _ lhs: Int,
    _ rhs: Int
) -> Int {
    lhs + rhs
}

myCustomAdd(10, 30)


func doSomethingComplicated(
    with value: Int
) -> Int {
    func mainLogi(value: Int) -> Int {
        value + 2
    }
    
    return mainLogi(value: value + 3)
}

doSomethingComplicated(with: 30)


// already init
func getFullName(
    firstName: String = "Foo",
    lastName: String = "Bar"
) -> String {
    "\(firstName) " + "\(lastName)"
}
getFullName()
getFullName(firstName: "John")
getFullName(lastName: "Foo")
getFullName(firstName: "Baz", lastName: "Qux")
