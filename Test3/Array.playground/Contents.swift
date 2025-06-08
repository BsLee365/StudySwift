import UIKit


let 학생1 = "이스위프트"
let 학생2 = "김자바"
let 학생3 = "박자바스크립트"
let 학생4 = "최파이썬"

var 학생들: [String] = ["이스위프트", "김자바", "박자바스크립트", "최파이썬"]

let 성적들: [Int] = []


//조회
print("학생들 전체 출력: ", 학생들)

let 학생_0 = 학생들[0]
print("학생_0: ", 학생_0)

let 학생_1 = 학생들[1]
print("학생_1: ", 학생_1)

let 학생_3 = 학생들[3]
print("학생_3(마지막 원소): ", 학생_3)

//let 학생_4 = 학생들[4]
//print("학생_4(마지막 원소): ", 학생_4)



//수정
학생들[0] = "이Swift"
print("이스위프트만 수정:",학생들)

학생들 = ["이Swift", "김Java", "박JavaScript", "최Python"]
print("학생들 전체 수정:",학생들)

//생성
학생들.append("정C")
print("배열에 원소 추가(append):",학생들)

학생들.insert("임Objective-C", at: 0)
print("배열에 원소 추가(insert):",학생들)

//삭제
학생들.remove(at: 0)
print("배열에 원소 삭제(remove):",학생들)

학생들.removeAll()
print("배열에 원소 전체 삭제(removeAll):",학생들)

//기타기능들

print("학생들 갯수:", 학생들.count)

print("isEmpty:", 학생들.isEmpty)


var numbers: [Int] = []
numbers = [3, 2, 1, 5, 4]

print("역순 전:", numbers)
numbers.reverse()
print("역순 후:", numbers)

print("sort 전:", numbers)
numbers.sort()
print("sort 후:", numbers)
