import Foundation

//func add(
//    _ lhs: Int,
//    _ rhs: Int
//) -> Int {
//    return lhs + rhs
//}

let add: (Int, Int) -> Int
= {
    (lhs:Int, rhs:Int) -> Int in
    lhs + rhs
}

add(10, 20)

func customAdd(
    _ lhs: Int,
    _ rhs: Int,
    using function: (Int, Int) -> Int
) -> Int {
    function(lhs, rhs)
}

customAdd(20, 30, using: { (lhs: Int, rhs: Int) -> Int in
    lhs + rhs
})
// 이 방식을 써야겠구만... 간단하면서 알기쉽다.
customAdd(20,30)
{
    (lhs: Int, rhs: Int) -> Int in
    lhs + rhs
}

customAdd(20,30)
{
    (lhs, rhs) in
    lhs + rhs
}

customAdd(20, 30) { $0 + $1 }

let ages = [30, 20, 19, 40]
ages.sorted(by: {(lhs: Int, rhs: Int) -> Bool in
    lhs > rhs
})

ages.sorted(by: >)
ages.sorted(by: <)
// 이 함수를 사용했을 때 왜 오류가 나는지 모르겠음....
//func > (lhs: Int, rhs: Int) -> Bool {
//    return lhs < rhs
//}
ages.sorted() { $0 > $1 }

func customAdd2(
    _ lhs: Int,
    _ rhs: Int,
    using function: (Int, Int) -> Int)
{
    function(lhs, rhs)
}

func add10To(value: Int) -> Int {
    value + 10
}

func add20To(value: Int) -> Int {
    value + 20
}

func doAddition(
    on value: Int,
    using function: (Int) -> Int
) -> Int {
    function(value)
}

doAddition(on: 20)
{
    function in
    add10To(value: 10)
}

doAddition(on: 20)
{
    (value: Int) -> Int in
    add20To(value: value)
    return add20To(value: value)
}
    
