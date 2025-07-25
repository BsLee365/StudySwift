import Foundation
import PlaygroundSupport


func calculatefullName(firstName: String, lastName: String) async -> String {
    try? await Task.sleep(for: .seconds(2))
    return "\(firstName) \(lastName)"
}


Task {
    let result1 = await calculatefullName(firstName: "Foo", lastName: "Bar")
    async let result2 = await calculatefullName(firstName: "Foo", lastName: "Bar2")
    await result2
}

enum Clothe {
    case socks, shirt, trousers
}
func buySocks() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.socks
}
func buyShirt() async throws -> Clothe {
    try await Task.sleep(for: .seconds(2))
    return Clothe.shirt
}
func buyTrousers() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.trousers
}

struct Ensemble: CustomDebugStringConvertible {
    let clothes: [Clothe]
    let totalPrice: Double
    
    var debugDescription: String {
        "Clothes ensemble: \(clothes), total price: \(totalPrice)"
    }
}
func buyWholeEnsemble() async throws -> Ensemble {
    async let socks = buySocks()
    async let shirt = buyShirt()
    async let trousers = buyTrousers()
    return Ensemble(clothes: await [try socks, try shirt, try trousers], totalPrice: 200.0)
}

Task {
    if let ensemble = try? await buyWholeEnsemble() {
        print(ensemble)
    }
    else {
        print("Something went wrong")
    }
}

func getFullName(delay: Duration, calculator: @Sendable () async -> String) async -> String {
    try? await Task.sleep(for: delay)
    return await calculator()
}
func fullName() async -> String { "Foo Bar" }

Task {
    await getFullName(delay: .seconds(1)) {
        async let name = fullName()
        return await name
    }
}
