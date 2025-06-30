import Foundation

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func increaseAge() {
        self.age += 1
    }
}

let foo = Person(name: "Foo", age: 20)

foo.age
foo.increaseAge()
foo.age


foo.age
let bar = foo
bar.increaseAge()
// 참조라서 값이 동일하게 나옴.
bar.age
foo.age


if foo === bar  {
    "Foo and Bar point to the same memory"
}
else {
    "They don't point to the same memory"
}



class Vehicle {
    func goVroom() {
        "Vroom vroom"
    }
}

class Car: Vehicle {
    
}

let car = Car()
car.goVroom()

class Person2 {
    private(set) var age: Int
    init(age: Int) {
        self.age = age
    }
    func increaseAge() {
        self.age += 1
    }
}

let baz = Person2(age: 20)
baz.age
// baz.age += 1
baz.increaseAge()
baz.age


class Car2 {
    var manufacturer: String = "Tesla"
    var model: String
    var year: Int
    
    init() {
        self.model = "x"
        self.year = 2025
    }
    
    init(model:String, year: Int) {
        self.model = model
        self.year = year
    }
    
    convenience init(model: String) {
        self.init(model: model, year: 2025)
    }
}

class TeslaModelY : Car2 {
    override init() {
        // super.init(model: "Y")
        super.init(model: "Y", year: 2025)
    }
}

let modelY = TeslaModelY()
modelY.model
modelY.year

let fooBar = Person2(age: 20)
fooBar.age
func doSomething(with person: Person2) {
    person.increaseAge()
}
doSomething(with: fooBar)
fooBar.age

class MyClass {
    init() {
        "Initialized"
    }
    func doSomething() {
        //empty
    }
    deinit {
        "Deinitialized"
    }
}

let myClass = MyClass()
myClass.doSomething()

let myClosure = {
    let myClass = MyClass()
    myClass.doSomething()
}
myClosure()

