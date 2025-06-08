import UIKit


print("안녕하세요")
print("안녕하세요")
print("안녕하세요")
print("안녕하세요")
print("안녕하세요")

print("-------------")
for i in 1...5 {
    print("안녕하세요")
}

print("-------------")
for i in 1..<5 {
    print("안녕하세요")
}

print("------i는 무엇일까?-------")
print(1)
print(2)
print(3)

print("-------------")

for i in 1...3 {
    print(i)
}
print("-------------")
print(10)
print(11)
print(12)
print("-------------")

for i in 10..<13 {
    print(i)
}
print("-----i 대신 다른 이름--------")

for number in 10..<13 {
    print(number)
}

print("-------------")
print(10)
print(20)
print(30)
print("-------------")

for i in 1...3 {
    print(i * 10)
}



//구구단 2단
print("------구구단 2단-------")
for i in 1...9 {
    print(i * 2)
}

print("------구구단 2단 (1)-------")
for i in 1...9 {
    // 2 * 1 = 2
    // 2 * 2 = 4
    // 2 * 3 = 6
    //...
    print("2 *", i, "=", 2 * i)
}
print("------구구단 2단 (2)-------")
for i in 1...9 {
    print("2 * \(i) = \(2 * i)") //string interpolation
}

print("------배열에서의 반복문1 (for)-------")

let 게임들 = ["GTA6", "롤", "마인크래프트"]

for 게임 in 게임들 {
    print(게임)
}

print("------배열에서의 반복문2 (forEach)-------")
게임들.forEach { 게임 in
    print(게임)
}

print("------배열에서의 반복문3 (forEach, $0)-------")
게임들.forEach {
    print($0)
}
