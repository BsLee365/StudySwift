import Foundation

let myName = "Vandad"
let myAge = 25
let yourName = "Foo"
let yourAge = 19

if myName == "vandad" {
    "Your name is \(yourName) and your age is \(yourAge)"
}
else {
    "Oops, I guessed it wrong"
}

if myName == "Vandad"
    && myAge == 25
    && yourName == "Foo"
    || yourAge == 19 {
    
    "my name is Vandad and my age is 25 and your name is Foo and your age is 19"
}

