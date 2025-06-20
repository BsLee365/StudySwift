import Foundation


let myAge = 22
let yourAge = 20

if myAge > yourAge {
    "I   am   older than   you"
}
else if myAge < yourAge {
    "older than me"
}
else {
    "oh,   it   is   a   tie"
}

let myMotherAge = myAge + 30
let doubleMyAge = myAge * 2

// 1. unary prefix
let foo = !true

// 2. unary postfix
let name = Optional("Vandad")
type(of: name)
let unaryPostFix = name! // unwrapping
type(of: unaryPostFix)

// 3. binary infix
let result = 1 + 2
let names = "Foo" + " " + "Bar"

//
let age = 30
//if age >= 18 {
//    message = "your adult"
//}
//else {
//    message = "you are not yet an adult"
//}


let message = age >= 18 ? "your adult" : "your not adult"

