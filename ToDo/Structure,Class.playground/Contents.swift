import UIKit


struct Poketmon {
    var 이름: String = ""
    var 번호: Int = 0
    var 속성: String = ""
}


var 포켓몬 = Poketmon()

포켓몬.이름 = "파이리"
포켓몬.번호 = 25
포켓몬.속성 = "불"

print("이름 : ", 포켓몬.이름)
print("번호 : ", 포켓몬.번호)
print("속성 : ", 포켓몬.속성)

class Student {
    var name: String
    var grade: Int
    
    init(이름: String, 학년: Int) {
        self.name = 이름
        self.grade = 학년
    }
}

let 학생1 = Student(이름: "김나영", 학년: 5)
print(학생1)
print(학생1.name)
print(학생1.grade)

class Pocketmonster {
    var name:String
    var number:Int
    var type:String
    
    init(name: String, number: Int, type: String) {
        self.name = name
        self.number = number
        self.type = type
    }
}

var pikachu:Pocketmonster = Pocketmonster(name: "피카츄", number: 25, type: "전기")
print(pikachu)
print(pikachu.name)
print(pikachu.number)
print(pikachu.type)

// 처음에 할당된 피카츄와 주소가 같음.
pikachu = Pocketmonster(name: "파이리", number: 25, type: "불")
print(pikachu)
print(pikachu.name)
print(pikachu.number)
print(pikachu.type)


var pokemon1 = Pocketmonster(name: "잉어킹", number: 20, type: "물")
var pokemon2 = Pocketmonster(name: "갸라도스", number: 21, type: "물")
var pokemon3 = Pocketmonster(name: "뮤츠", number:22, type:"사이퍼")

let pokemons: [Pocketmonster] = [pokemon1, pokemon2, pokemon3]

// stuct와 class의 차이점?

// 투두 타이틀, 완료여부, 상세정보
class Todo {
    var title: String
    var isCompleted: Bool
    var description: String
    
    init(title: String) {
        self.title = title
        self.isCompleted = false
        self.description = ""
    }
}
