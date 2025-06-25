import Foundation

enum Animals {
    case cat
    case dog
    case rabbit
    case hourse
}

let cat = Animals.cat
cat


if cat == Animals.cat {
    "This is a cat"
}
else if cat == Animals.dog {
    "This is a dog"
}
else {
    "This is something else"
}


func describeAnimal(_ animal: Animals) {
    switch cat {
    case .cat:
        "This is a cat"
        break
    case .dog:
        "This is a dog"
        break
    case .rabbit:
        "This is a rabbit"
        break
    case .hourse:
        "This is hourse"
        break
    }
}
describeAnimal(Animals.dog)


enum Shortcut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(path: URL(string: "https://apple.com")!)

// if wwwApple == Shortcut.wwwUrl(path: URL(string: "https://apple.com")!) { "it is same" }

switch wwwApple {
case .fileOrFolder(path: let path, name: let name):
    path
    name
    break
case .wwwUrl(path: let path):
    path
    break
case .song(artist: let artist, songName: let songName):
    artist
    songName
    break
}


switch wwwApple {
case .fileOrFolder(let path, let name):
    path
    name
    break
case .wwwUrl(let path):
    path
    break
case .song(let artist, let songName):
    artist
    songName
    break
}


switch wwwApple {
case let .fileOrFolder(path, name):
    path
    name
    break
case let .wwwUrl(path):
    path
    break
case let .song(artist, songName):
    artist
    songName
    break
}

// switch 대신 이렇게 사용할 수 있음
if case let .wwwUrl(path) =  wwwApple {
        path
}
if case let .fileOrFolder(path, name) =  wwwApple {
    path
    name
}

let withoutYou = Shortcut.song(
    artist: "Symphony X",
    songName: "Without You"
)

// if caset let enum속성 = enum {}

if case let .song(artist, songName) = withoutYou {
    artist
    songName
}

enum Vehicle {
    case car(_ manufacture: String, _ model: String)
    case bike(_ manufacture: String, _ yearMade: Int)
    
    var getManufacturer: String
    {
        switch self {
            case let .car(manufacturer, _):
                return manufacturer
            case let .bike(manufacturer, _):
                return manufacturer
        }
    }

}

let car = Vehicle.car("Tesla", "S")
car.getManufacturer
let bike = Vehicle.bike("Honda", 2020)
bike.getManufacturer


switch car {
case let .car(manufacturer, _):
    manufacturer
    break
case let .bike(manufacturer, _):
    manufacturer
    break
}

if case let .car(manufacturer, model) = car {
    "this is \(manufacturer)  model is \(model)"
}

switch bike {
case let .car(manufacturer, model):
    "this is \(manufacturer)  model is \(model)"
    break
case let .bike(manufacturer, yearMade):
    "this is \(manufacturer)  year is \(yearMade)"
    break
}

if case .bike(let manufacturer, let yearMade) = bike {
    "this is \(manufacturer)  year is \(yearMade)"
}


enum FamilyMember: String {
    case father = "Dad"
    case mother = "Mom"
    case brother = "Bro"
    case sister = "Sis"
}

FamilyMember.brother.rawValue
FamilyMember.father.rawValue


enum Height {
    case short
    case medium
    case long
    
    mutating func makeLong() -> Height {
        return Height.long
    }
}

var myHeight = Height.medium
myHeight.makeLong()
myHeight

// 이게 가장 어렵네.. 예제 중에서
indirect enum IntOperation {
    case add(Int, Int)
    case subtract(Int, Int)
    case freeHand(IntOperation)
    
    func calculateResult(
        of operation: IntOperation? = nil
    ) -> Int {
        switch operation ?? self {
        case let .add(lhs, rhs):
            return lhs + rhs
        case let .subtract(lhs, rhs):
            return lhs + rhs
        case let .freeHand(operation):
            return calculateResult(of: operation)
        }
    }
}

let freeHand = IntOperation.freeHand(.add(20, 30))
freeHand.calculateResult()
