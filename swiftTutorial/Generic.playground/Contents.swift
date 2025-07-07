import Foundation

func perform (
    _ op: (Int, Int) -> Int,
    on lhs: Int,
    and rhs: Int
) -> Int {
    op(lhs, rhs)
}
// 연산자도 swift에서는 함수로 취급함
perform(+, on: 10, and: 20)
perform(-, on: 10, and: 20)
perform(*, on: 10, and: 20)
perform(/, on: 10, and: 20)

func performDouble (
    _ op: (Double, Double) -> Double,
    on lhs: Double,
    and rhs: Double
) -> Double {
    op(lhs, rhs)
}

perform(+, on: 10, and: 20)
perform(-, on: 10, and: 20)
perform(*, on: 10, and: 20)


func performNumeric<N: Numeric>(
    _ op: (N, N) -> N,
    on lhs: N,
    and rhs: N
) -> N {
    op(lhs, rhs)
}

let x = performNumeric(+, on: 10.1, and: 20.2)
perform(-, on: 10, and: 20)
perform(*, on: 10, and: 20)


// 이렇게도 사용이 가능함.
func performNumeric2<N>(
    _ op: (N, N) -> N,
    on lhs: N,
    and rhs: N
) -> N where N: Numeric {
    op(lhs, rhs)
}

protocol CanJump {
    func jump()
}

protocol CanRun {
    func run()
}

struct Person: CanJump, CanRun {
    func jump() {
        "Jumping..."
    }
    func run() {
        "Running..."
    }
}

// generic 여러개
func jumpAndRun<T: CanJump & CanRun>(value: T) {
    value.jump()
    value.run()
}

let person = Person()
jumpAndRun(value: person)

// let names: Array<String> = ["Foo", "Bar"]

// let names: [String] = []

extension [String] {
    func longestString() -> String? {
        self.sorted { (lhs: String, rhs: String) -> Bool in
            lhs.count > rhs.count
        }.first
    }
}

[
    "Foo",
    "Bar Baz",
    "Qux"
].longestString()

protocol View {
    func addSubView(_ view: View)
}

extension View {
    func addSubView(_ view: View) {
    }
}

struct Button: View {}

protocol PresentableAsView {
    associatedtype ViewType: View // generic 역할
    func produceView() -> ViewType // ViewType을 지정해줄 애
    func configure(superView: View, thisView: ViewType) // 예시코드에서는 의미 없음
    func present(view: ViewType, on superView: View)    // 예시 코드에서는 의미없음
}

extension PresentableAsView {
    func present(view: ViewType, on superView: View) {
        superView.addSubView(view) // 이건 잘 모르겠음
    }
}

struct MyButton: PresentableAsView { // MyButton 구조체를 만들어 줌
    func produceView() -> Button { Button() }   // 구현체로부터 받은 produceView를 Button()으로 초기화 여기서 ViewType 자동추론이 이루어진다.
    func configure(superView: View, thisView: Button) {} // 의미 없음
}

extension PresentableAsView where ViewType == Button { // Veiw타입이 Button하고 같으면 아래 함수를 실행
    func doSomethingWithButton() {
        "This is a button"
    }
}

let button = MyButton()
button.doSomethingWithButton()



extension [Int] {
    func average() -> Double {
        Double(self.reduce(0, +)) / Double(self.count)
    }
}

[1, 2, 3 ,4, 5].average()
