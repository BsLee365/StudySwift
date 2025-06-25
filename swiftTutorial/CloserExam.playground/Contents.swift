import Foundation


// value는 makeAddr의 매개변수
// -> () 의 타입은 클로저의 타입
func makeAddr(_ value: Int) -> (Int) -> Int
{
    var total = 0
    return {
        // 외부 makeAddr이랑은 다른 매개변수임.
        // 외부 매개변수랑 이름이 일치해버리면 shadowing 현상이 나타남.
        input in
        // total += value
        // shadowing 현상을 없애려면 아래와 같이 작성하면 됨.
        total += value + input
        return total
    }
}

let adder = makeAddr(5)

adder(10)
adder(20)
adder(30)

// #
