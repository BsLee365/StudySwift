import Foundation

struct Person {
    let firstName: String?
    let lastName: String?
    
    enum Errors: Error {
        case firstNameIsNil
        case lastNameIsNil
        case bothNamesAreNil
    }
    
    func getFullName() throws -> String? {
        switch (firstName, lastName) {
        case (.none, .none):
            throw Errors.bothNamesAreNil
        case(.none, .some):
            throw Errors.firstNameIsNil
        case(.some, .none):
            throw Errors.lastNameIsNil
        case let(.some(firstName), .some(lastName)):
            return "\(firstName) \(lastName)"
        }
    }
}


let foo :Person = Person(firstName: "foo", lastName: nil)

do { let fullName = try foo.getFullName()  }
catch { "Got an error = \(error)"          }


do {
    let fullName = try foo.getFullName()
    fullName
}
catch is Person.Errors {
    "Got an error"
}

let bar = Person(firstName: nil, lastName: nil)
do {
    let fullName = try bar.getFullName()
    fullName
}
catch Person.Errors.firstNameIsNil {
    "FirstName is nil"
}
catch Person.Errors.lastNameIsNil {
    "LastName is nil"
}
catch Person.Errors.bothNamesAreNil{
    "Got an error"
}
catch {
    "Got an error"
}


struct Car {
    let manufacturer: String
    
    enum Errors: Error {
        case invalidManufacturer
    }
    
    init(manufacturer: String) throws {
        if manufacturer.isEmpty {
            throw Errors.invalidManufacturer
        }
        self.manufacturer = manufacturer
    }
}

do {
    var myCar = try Car(manufacturer: "")
    myCar
    myCar.manufacturer
}
catch Car.Errors.invalidManufacturer {
    "Manufacturer is empty"
}
catch {
    "Somting went wrong"
}

// 에러가 발생하면 nil로 반환, 아닐시 정산 값으로 옵셔널로 래핑해서 반환.
if let yourCar = try? Car(manufacturer: "Tesla") {
    "Success, your car = \(yourCar)"
}
else {
    "failed to construct and error is not accessible now"
}


let theirCar = try! Car(manufacturer: "Ford") // 절대 쓰지 말란다.
theirCar.manufacturer



struct Dog {
    let isinjured: Bool
    let isSleeping : Bool
    
    enum BarkingErrors: Error {
        case cannotBarkIsSleeping
    }
    
    enum runningErrors: Error {
        case cannotRunisInjured
    }
    
    func bark() throws {
        if isSleeping {
            throw BarkingErrors.cannotBarkIsSleeping
        }
        "bark.."
    }
    
    func run() throws  {
        if isinjured {
            throw runningErrors.cannotRunisInjured
        }
        "run"
    }
    
    func barkAndRun() throws {
        try bark()
        try run()
    }
}

let dog = Dog(isinjured: true, isSleeping: true)

do {
    try dog.barkAndRun()
    dog
}
catch Dog.BarkingErrors.cannotBarkIsSleeping,
      Dog.runningErrors.cannotRunisInjured{
    "Cannot run or bark"
}
catch {
    "something went wrong"
}



do {
    try dog.barkAndRun()
}
catch Dog.BarkingErrors.cannotBarkIsSleeping {
    "Cannot run or bark"
}
catch Dog.runningErrors.cannotRunisInjured {
    "Cannoit run is injured"
}
catch {
    "something went wrong"
}


func fullName(firstName: String?, lastName: String?, caculator: (String?, String?) throws -> String?) rethrows -> String? {
    
    try caculator(firstName, lastName)
}

enum NameErrors: Error {
    case firstNameIsInvalid
    case lastNameIsInvalid
}

func + (
    firstName: String?,
    lastName: String?
) throws -> String? {
    
    guard let firstName, !firstName.isEmpty else {
        throw NameErrors.firstNameIsInvalid
    }
    guard let lastName, !lastName.isEmpty else {
        throw NameErrors.lastNameIsInvalid
    }
    return "\(firstName) \(lastName)"
}

do {
    let fooBar = try fullName(firstName: "foo", lastName: nil, caculator: +)
}
catch NameErrors.firstNameIsInvalid {
    "FirstName is invalid"
}
catch NameErrors.lastNameIsInvalid {
    "LastName is invalid"
}
catch  {
    "Something went worng."
}


enum IntegerErrors: Error {
    case noPositiveIntegerBefore(thisValue: Int)
}

// 양의 정수 가져오기
func getPreviousPositiveInteger(from int: Int) -> Result<Int, IntegerErrors> {
    guard int > 1 else {
        return Result.failure(IntegerErrors.noPositiveIntegerBefore(thisValue: int))
    }
    return Result.success(int - 1)
}

func performGet(forValue value: Int) {
    switch getPreviousPositiveInteger(from: value) {
    case let .success(previousValue):
        "Previous value is \(previousValue)"
    case let .failure(error):
        switch error {
        case let .noPositiveIntegerBefore(thisValue):
            "No positive integer before \(thisValue)"
        }
    }
}

performGet(forValue: 0)
performGet(forValue: 2)
