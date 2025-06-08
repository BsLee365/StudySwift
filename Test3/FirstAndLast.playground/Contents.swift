import UIKit

print("-------non empty array--------")
let array: [String] = ["Apple", "Elsa"]

let 원소0 = array[0]
let 원소_first = array.first

print("원소0:", 원소0)
print("원소_first:", 원소_first)

print("-------empty array--------")

let emptyArray: [String] = []

//let 원소0_empty = emptyArray[0]
let 원소_first_empty = emptyArray.first

//print("원소0_empty:", 원소0_empty)
print("원소_first_empty:", 원소_first_empty)

print("-------첫번째 단어의 마지막 글자--------")
let names: [String] = ["Apple", "Elsa"]

//names.first : Apple
//names.last : Elsa

print(names.first?.last)
print(names.last?.first)

print("------끝말이 이어지는지 체크-------")

if names.first?.last == names.last?.first {
    print("끝말이 이어집니다.")
} else {
    print("끝말이 이어지지 않습니다.")
}

print("-------모두 소문자로 만들기-------")
print("소문자로 변경전 E:", names.last?.first)
print("소문자로 변경후 E:", names.last?.first?.lowercased())

if names.first?.last?.lowercased() == names.last?.first?.lowercased() {
    print("끝말이 이어집니다.")
} else {
    print("끝말이 이어지지 않습니다.")
}
