import Foundation

struct Dog: Equatable {
    
}

struct Person: Equatable {
    let id: String
    let name: String

}

let foo1 = Person(
    id: "1",
    name: "foo"
)

let foo2 = Person(
    id: "1",
    name: "Bar"
)

if foo1 == foo2 {
    "They are equal"
}
else {
    "They are not equal"
}

//extension Person {
//    static func == (
//        lhs: Self,
//        rhs: Self
//    ) -> Bool {
//        lhs.id == rhs.id
//    }
//}

enum AnimalType: Equatable {
    case dog(breed: String)
    case cat(breed: String)
}

let dog1 = AnimalType.dog(breed: "Labradoodle")
let dog2 = AnimalType.dog(breed: "Labradoodle")

if dog1 == dog2 {
    "They are equal"
}
else {
    "They are not equal"
}

extension AnimalType {
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        switch (lhs, rhs) {
        case let((.dog(lhsBreed), .dog(rhsBreed))),
            let((.cat(lhsBreed), .cat(breed: rhsBreed))):
            return lhsBreed == rhsBreed
        default:
            return false
        }
    }
}

struct Animal : Equatable{
    let name: String
    let type: AnimalType
    
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.type == rhs.type
    }
}

let cat1 = Animal(name: "Whiskers", type: .cat(breed: "Street cat"))
let cat2 = Animal(name: "Whoosh", type: .cat(breed: "Street cat"))
if cat1 == cat2 {
    "equal"
}
else {
    "not equal"
}


// Hashing

struct House: Hashable {
    let number: Int
    let numberOfBedrooms: Int
}

let house1 = House(number: 123, numberOfBedrooms: 2)
house1.hashValue  //7,245,392,933,005,427,046

let house2 = House(number: 123, numberOfBedrooms: 2)
house2.hashValue  //7,245,392,933,005,427,046

let housese = Set([house1, house2])
housese.count

struct NumberedHouse: Hashable {
    let number: Int
    let numberOfBedrooms: Int
    
    // 식별자
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
    // 같은지 비교
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.number == rhs.number
    }
}

let house3 = NumberedHouse(number: 123, numberOfBedrooms: 2)
let house4 = NumberedHouse(number: 1234, numberOfBedrooms: 2)

let houses3And4 = Set([house3, house4])
houses3And4.count
houses3And4.first!.numberOfBedrooms
house3.hashValue
house4.hashValue


enum CarPart {
    case roof
    case tire
    case trunk
}
let uniqueParts: Set<CarPart> = [
    .roof,
    .tire,
    .trunk,
    .roof
]

enum HouseType: Hashable {
    case bigHouse(NumberedHouse)
    case smallHouse(NumberedHouse)
}

let bigHouse1 = HouseType.bigHouse(NumberedHouse(number: 1, numberOfBedrooms: 1))
let bigHouse2 = HouseType.bigHouse(NumberedHouse(number: 1, numberOfBedrooms: 1))
let smallHouse1 = HouseType.smallHouse(NumberedHouse(number: 1, numberOfBedrooms: 1))
let smallHouse2 = HouseType.smallHouse(NumberedHouse(number: 1, numberOfBedrooms: 1))

let allHouse : Set<HouseType>  = [bigHouse1, bigHouse2, smallHouse1, smallHouse2]
allHouse.count
allHouse.first
allHouse.first!.hashValue

for value in allHouse {
    print(value)
}
