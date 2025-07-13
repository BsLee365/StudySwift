import Foundation


var mutatingNumbers = [4, 5, 6]
mutatingNumbers.append(7)
mutatingNumbers.insert(3, at: 0)
mutatingNumbers.insert(contentsOf: [1, 2], at: 0)

for value in mutatingNumbers {
    value
}
for value in mutatingNumbers where value%2 == 0 {
    value
}

mutatingNumbers.map{ (value: Int) -> Int in value*2}
mutatingNumbers.map{ $0*2 } // 이건 가독성이 안좋음

mutatingNumbers.filter { (value: Int) -> Bool in value >= 3 }

mutatingNumbers.compactMap { (value: Int) -> String? in
    value % 2 == 0
    ? String(value)
    : nil
}

let numbers2: [Int?] = [1, 2, nil, 4, nil]
numbers2.count
let notNil = numbers2.filter { (value: Int?) -> Bool in
    value != nil
}
let notNil2 = numbers2.compactMap { (value: Int?) -> Int? in value }

let numbers3 = [1, 2, 1, 2]
numbers3.count

let stuff1 = [1, "Hello", 2, "World"] as [Any]
stuff1.count

let stuff2: [Any] = [1, "Hello", 2, "World"]
stuff1.count


let uniqueNumbers = Set([1, 2, 1, 2, 3])
uniqueNumbers.count
uniqueNumbers.map(-)

let stuff3: Set<AnyHashable> = [1, 2, 3, "Vandad"]
stuff3.count
let intsInStuff1 = stuff1.compactMap { (value: Any) -> Int? in value as? Int }
let stringInStuff1 = stuff1.compactMap { (value: Any) -> String? in value as? String }

let ontsInStuff3 = stuff3.compactMap { (value: AnyHashable) -> Int? in value as? Int }
type(of: ontsInStuff3)

struct Person: Hashable {
    let id: UUID
    let name: String
    let age: Int
}
let fooId = UUID()
// 모든 프로퍼티를 보기 때문에 같지 않다고 생각 함.
let foo = Person(id: fooId, name: "Foo", age: 20)
let bar = Person(id: fooId, name: "Bar", age: 30)

let people: Set<Person> = [foo, bar]
people.count

// id로만 다르게 판단하겠다.
struct Person2: Hashable {
    let id: UUID
    let name: String
    let age: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)// 무슨일이 일어나지?
    }
    
    static func == (lhs: Person2, rhs: Person2) -> Bool {
        lhs.id == rhs.id
    }
}

let bazId = UUID()
let baz = Person2(id: bazId, name: "Baz", age: 40)
let qux = Person2(id: bazId, name: "Qux", age: 50)
let people2: Set<Person2> = [baz, qux]
people2.count
people2.first?.name

let userInfo = [
    "name": "Foo",
    "age": 20,
    "address": [
        "line": "Dongjak",
        "postCode": "123"
    ]
] as [String: Any]

userInfo["name"]
userInfo["age"]
userInfo["address"] as? [String: Any]
(userInfo["address"] as! [String: String])["line"]

userInfo.keys
userInfo.values

for (key, value) in userInfo {
    print(key)
    print(value)
}

for (key, value) in userInfo where value is Int {
    print(key)
    print(value)
}
