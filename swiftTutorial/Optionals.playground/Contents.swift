import Foundation


func multiplyByTwo( _ value: Int? = nil) -> Int {
    if let value {
        return value * 2
    }
    else {
        return 0
    }
}
multiplyByTwo()
multiplyByTwo(nil)
multiplyByTwo(4)
multiplyByTwo(8)

let age: Int? = nil
if age != nil {
    "Age is there! How odd!"
}
else {
    "Age is nil. Correct."
}

if let age {
    "Age is there. How odd! It value is \(age)"
}
else {
    "No age is present. As expected"
}

func checkAge() {
    
    guard age != nil
    else {
        "Age is nill as expected"
        return
    }
    "Age is not nil here. Strange!"
}

checkAge()

let age2: Int? = 0
func checkAge2() {
    guard let age2 else {
        "Age is nil. How strange"
        return
    }
    "Age2 is not nil as expected. Value = \(age2)"
}

checkAge2()

switch age {
    case .none:
        "Age is nil"
        break
    case let .some(value):
        "Age is \(value)"
        break
}

if age2 == 0 {
    "Age2 is 0 as expected, and is not nil"
}
else {
    "Age2 is not 0. How strange!"
}

if age2 == .some(0) {
    "Age2 is 0 as expected, and is not nil"
}
else {
    "Age2 is not 0. How strange!"
}

struct Person {
    let name: String
    let address: Address?
    struct Address {
        let firstLine: String?
    }
}
let foo: Person = Person(name: "Foo", address: nil)

if let fooFirstAddressLine = foo.address?.firstLine {
    // 값이 있으면 그대로 전달.
    fooFirstAddressLine
} else {
    "Foo doesn't have an address with first line. as expected."
}

// foo.address와 fooAddress.firstLine 두개 다 nill이 아닐 경우에만 블럭이 실행됨
if let fooAddress = foo.address,
   let firstLine = fooAddress.firstLine {
    fooAddress
    firstLine
}

let bar: Person? = Person(name: "Bar", address: Person.Address(firstLine: nil))

if bar?.name == "Bar",
   bar?.address?.firstLine == nil {
    "Bar has no address with first line. as expected."
} else {
    "Seems like something isn't working right!"
}

let baz: Person? = Person(name: "Baz", address: Person.Address(firstLine: "Baz first line"))

switch baz?.address?.firstLine {
case let .some(firstLine) where firstLine.starts(with: "Baz"):
    "Baz first address Line = \(firstLine)"
    break
case let .some(firstLine):
    "Baz first address line that didn't match the previouse case"
    firstLine
case .none:
    "Baz doesn't have an address with first line"
}

func getFullName(
    firstName: String,
    lastName: String?
) -> String? {
    if let lastName {
        return "\(firstName) \(lastName)"
    }
    else {
        return nil
    }
}

getFullName(firstName: "Foo", lastName: nil)
getFullName(firstName: "Foo", lastName: "bar")


// gurad로 바꿔보기
func getFullName2(
    firstName: String,
    lastName: String?
) -> String? {
    
    guard let lastName
    else {
        return nil
    }
    // lastName이 nil이 아니면 반환
    return "\(firstName) \(lastName)"
}

getFullName2(firstName: "Foo2", lastName: nil)
