import Foundation

let firstName: String? = "Foo"
let lastName: String? = " Bar"
let fullName = firstName + lastName

// binary infix
func + (
    lhs: String?,
    rhs: String?
) -> String? {
    switch(lhs, rhs) {
    case(.none, .none):
        return nil
    case let (.some(value), .none),
         let (.none, .some(value)):
        return value
    case let (.some(lhs), .some(rhs)):
        return lhs + rhs
    }
}

// uary prefix
prefix operator ^
prefix func ^ (value: String) -> String {
    value.uppercased()
}
let lowercaseName = "Foo Bar"
let uppercaseName = ^lowercaseName

postfix operator *
postfix func * (value: String) -> String {
    "*** \(value) ***"
}
let widthStars = lowercaseName*




func + (
    lhs: Person,
    rhs:Person
) -> Family {
    Family(members: [lhs, rhs])
}

func + (
    lhs: Family,
    rhs: Person
) -> Family {
    var members = family.members
    members.append(rhs)
    return Family(members: members)
}
func + (
    lhs: Family,
    rhs: [Person]
) -> Family {
    var members = lhs.members
    members.append(contentsOf: rhs)
    return Family(members: members)
}
struct Person {
    let name: String
}
struct Family {
    let members: [Person]
}
let mom = Person(name: "Mom")
let dad = Person(name: "Dad")
let son = Person(name: "Son")
let daughter1 = Person(name: "Daughter1")
let daughter2 = Person(name: "Daughter2")

let family = mom + dad
family.members.count
let familyWithChildren = family + son
familyWithChildren.members.count
let familyWithDaughters = familyWithChildren + [daughter1, daughter2]
familyWithDaughters.members.count
