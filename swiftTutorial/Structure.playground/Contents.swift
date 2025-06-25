import Foundation

struct Person {
    // 생성자가 암묵적으로 생성이 됨.
    let name: String
    let age: Int
}

let foo = Person(
    name: "Foo",
    age: 20
)

foo.name
foo.age

struct CommodoreComputer {
    let name: String
    let manufacturer: String
    init(name: String) {
        self.name = name
        self.manufacturer = "Commodore"
    }
}

let c64 = CommodoreComputer(
    name: "My commdore",
)
c64.name
c64.manufacturer


struct CommodoreComputer2 {
    let name: String
    let manufacturer = "Commodore"
}

let c642 = CommodoreComputer2(
    name: "My commdore"
)

c642.name
c642.manufacturer

struct Person2 {
    let firstName: String
    let lastName: String
    let fullName: String
    
    // 이렇게 초기화를 해서 fullName을 지정해 줄 수 있음.
    init(firstName: String, lastName: String)
    {
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = "\(firstName) \(lastName)"
        
    }
}

//init말고 더 좋은 방법이 있음
struct Person22 {
    let firstName: String
    let lastName: String
    // 이런식으로 초기화 해주는 것도 좋음.
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let fooBar = Person22(firstName: "Lee", lastName: "BS")
fooBar.fullName

// struct 속성을 변경 시켜보기
struct Car {
    var currentSpeed: Int
    // 스웨덴 형님이 구조체를 변경하는 일은 많이 없다고 한다...
    mutating func drive(speed: Int) {
        "Driving ..."
        currentSpeed = speed
    }
}

// let으로 받았을 때 이미 speed가 10인채로 받음.
let immutableCar = Car(currentSpeed: 10)
// 하지만... currentSpeed가 var인데도 불구하고, 100으로 sturct를 바꾸려고 하다보니 에러가 생김.
// 객체를 받은 타입이 상수이기 때문이다.
// immutableCar.drive(speed: 100)

var immutableCar2 = Car(currentSpeed: 100)
immutableCar2.drive(speed: 300)
immutableCar2.currentSpeed

let copy = immutableCar2
immutableCar2.currentSpeed
immutableCar2.drive(speed: 500)
copy.currentSpeed   //300이 할당됨

struct LivingThing {
    init() {
        "I'm living thing"
    }
}
// sturct는 상속이 불가능함.
//struct Animal: LivingThing {
//    
//}


// sturct 내부에 있는 속성을 let으로 바꾼채, 속성을 변경하여 할당하는 방법
struct Bike {
    let manufacturer: String
    let currentSpeed: Int
    
    func copy (currentSpeed: Int) ->  Bike {
        Bike(manufacturer: self.manufacturer, currentSpeed: currentSpeed)
    }
}

let bike1 = Bike(manufacturer: "HD", currentSpeed: 20)
// 변경이 되었다.
var bike2 = bike1.copy(currentSpeed: 30)
bike2.currentSpeed

