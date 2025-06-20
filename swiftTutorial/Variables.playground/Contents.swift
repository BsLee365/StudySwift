import Foundation

let myName: String = "John"
var yourName: String? = "Jane"

var names = [
    myName,
    yourName
]

names.append("Bar")
names.append("Baz")

let foo = "Foo"
var foo2 = foo
foo2 = "Foo 2"

foo
foo2

let oldArray = NSMutableArray(
    array:  [
        "Foo",
        "Bar"
    ]
)

oldArray.add("Baz")

var newArray = oldArray
newArray.add("Quux")

oldArray
newArray

let someNames = NSMutableArray(
    array:  [
        "Foo",
        "Bar"
    ]
)
// someNames = ["Bla"]
func changeTheArray(_ array: NSArray) {
    let copy = array as! NSMutableArray
    copy.add("Baz")
}

changeTheArray(someNames)
someNames

