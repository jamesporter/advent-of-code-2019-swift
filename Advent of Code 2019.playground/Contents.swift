import Cocoa

func readFile(name: String) -> String {
    let fileURL = Bundle.main.url(forResource: name, withExtension: "txt")
    return try! String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
}

func readNumbersFromLines(filename: String) -> [Int] {
    let content = readFile(name: filename)
    return content.split(separator: "\n").compactMap { Int(String($0)) }
}

func readNumberList(filename: String) -> [Int] {
    let content = readFile(name: filename)
    return content.split(separator: ",").compactMap { Int(String($0)) }
}

extension Double {
    var ri: Int {
        Int(self.rounded())
    }
}

extension Int {
    var d: Double {
        Double(self)
    }
}


//let oneData = readNumbersFromLines(filename: "1")

//1a Fuel required to launch a given module is based on its mass. Specifically, to find the fuel required for a module, take its mass, divide by three, round down, and subtract 2. What is all fuel?

//let oneAAns = oneData.map { n in
//    floor(n.d / 3.0) - 2
//}.reduce(0.0, +)
//
//print("1a: \(oneAAns.ri)")
//
//func fuel1b(n: Int) -> Int {
//    let baseFuel = (floor(n.d / 3.0) - 2).ri
//    if baseFuel > 0 {
//        return baseFuel + fuel1b(n: baseFuel)
//    } else {
//        return 0
//    }
//}
//
//let oneBAns = oneData.map(fuel1b).reduce(0, +)
//print("1b: \(oneBAns)")

// https://adventofcode.com/2019/day/2
//var twoData = readNumberList(filename: "2")
//
//func evaluate(program: inout [Int]) {
//    var i = 0
//    mainLoop: while true {
//        switch program[i] {
//        case 1:
//            let a = program[program[i + 1]]
//            let b = program[program[i + 2]]
//            let j = program[i + 3]
//            program[j] = a + b
//            i += 4
//        case 2:
//            let a = program[program[i + 1]]
//            let b = program[program[i + 2]]
//            let j = program[i + 3]
//            program[j] = a * b
//            i += 4
//        case 99:
//            //print("Done! at \(i)")
//            break mainLoop
//        default:
//            //print("Error")
//            break mainLoop
//        }
//    }
//}


//var example = [ 2,4,4,5,99,0]
//evaluate(program: &example)
//print(example)
//
//var example2 = [1,1,1,4,99,5,6,0,99]
//evaluate(program: &example2)
//print(example2)

// 2a
//twoData[1] = 12
//twoData[2] = 2
//evaluate(program: &twoData)
//print("2a \(twoData[0])")

// 2b (is a bit slow [76,21]; ans: 7621)

//let twoDataValues = readNumberList(filename: "2")
//outer: for i in 0...99 {
//    for j in 0...99 {
//        var twoData = twoDataValues
//        twoData[1] = i
//        twoData[2] = j
//        evaluate(program: &twoData)
//        if twoData[0] == 19690720 {
//            print("2b [\(i),\(j)]; ans: \(100 * i + j)")
//            break outer
//        }
//
//    }
//}

// 3 seemed tedious, skipping

// 4a

//let lower = 246540
//let higher = 787419
//
//func isValid(_ n: Int) -> Bool {
//    func isWeaklyIncreasing(_ items: [Int]) -> Bool {
//        for i in 0..<(items.count - 1) {
//            if items[i] > items[i+1] {
//                return false
//            }
//        }
//        return true
//    }
//
//    func existsDouble(_ items: [Int]) -> Bool {
//        for i in 0..<(items.count - 1) {
//            if items[i] == items[i+1] {
//                return true
//            }
//        }
//        return false
//    }
//
//    let seq: [Int] = Array(String(n)).map { Int(String($0))! }
//    return seq.count == 6 && isWeaklyIncreasing(seq) && existsDouble(seq)
//}
//
//var count = 0
//for i in (lower + 1)..<higher {
//    if isValid(i) {
//        count += 1
//    }
//}
//print("4a \(count)")

// 4b

//let lower = 246540
//let higher = 787419
//
//func isValid(_ n: Int) -> Bool {
//    func isWeaklyIncreasing(_ items: [Int]) -> Bool {
//        for i in 0..<(items.count - 1) {
//            if items[i] > items[i+1] {
//                return false
//            }
//        }
//        return true
//    }
//
//    func existsDouble(_ items: [Int]) -> Bool {
//        for i in 0..<(items.count - 1) {
//            if items[i] == items[i+1] {
//                // Now must check *not* extra stuff
//                let lowNbr = i > 0 ? items[i - 1] : nil
//                let highNbr = i < items.count - 2 ? items[i + 2]: nil
//                if !(items[i] == lowNbr || items[i] == highNbr) {
//                    return true
//                }
//            }
//        }
//        return false
//    }
//
//    let seq: [Int] = Array(String(n)).map { Int(String($0))! }
//    return seq.count == 6 && isWeaklyIncreasing(seq) && existsDouble(seq)
//}
//
//var count = 0
//for i in (lower + 1)..<higher {
//    if isValid(i) {
//        count += 1
//    }
//}
//print("4b \(count)")

//let rawSix = readFile(name: "6")
//// from orbiter to parent
//var lookup: [String: String] = [:]
//var reverseLookup: [String: [String]] = [:]
//var keys = Set<String>()
//
//rawSix.split(separator: "\n").forEach {
//    let items = $0.split(separator: ")")
//    let a = String(items[0])
//    let b = String(items[1])
//    lookup[b] = a
//    if (reverseLookup[a] != nil) {
//        reverseLookup[a] = reverseLookup[a]! + [b]
//    } else {
//        reverseLookup[a] = [b]
//    }
//
//    keys.insert(a)
//    keys.insert(b)
//}

//var orbits = 0
//keys.forEach {
//    var current: String? = $0
//    while current != nil {
//        let nextOne = lookup[current!]
//        if nextOne != nil {
//            orbits += 1
//            current = nextOne
//        } else {
//            current = nil
//        }
//    }
//}
//
//print("6a \(orbits)")

// shortest path... start somewhere, bfs, stop?

//var visited = Set<String>()
//var frontier = Set<String>(["YOU"])
//
//func neighbours(_ places: Set<String>) -> Set<String> {
//    var nbrs = Set<String>()
//    places.forEach {
//        if let parent = lookup[$0] {
//            nbrs.insert(parent)
//        }
//        if let children = reverseLookup[$0] {
//            children.forEach { c in
//                nbrs.insert(c)
//            }
//        }
//    }
//    return nbrs
//}
//
//var foundSanta = false
//var count = 0
//
//while !foundSanta {
//    count += 1
//    let newNbrs = neighbours(frontier).subtracting(visited)
//    if newNbrs.contains("SAN") {
//        foundSanta = true
//    } else {
//        frontier = newNbrs
//        visited.formUnion(newNbrs)
//    }
//}
//
//// offset by 2 as per weird formulation
//print("6b \(count - 2)")

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

let rawEight = readFile(name: "8")
let digits = rawEight.compactMap { Int(String($0)) }
print(digits.count)

// layers of 25x6 = 150
let layers = digits.chunked(into: 150)

//let zeros = layers.map { layer in
//    layer.filter { $0 == 0}.count
//}
//
//let i = zeros.firstIndex(of: zeros.min()!)!
//let oneC = layers[i].filter { $0 == 1 }.count
//let twoC = layers[i].filter { $0 == 2 }.count
//
//print("8a \(oneC * twoC)")

var image: [Int] = []

for i in 0..<150 {
    var value = 2
    var j = 0
    repeat {
        value = layers[j][i]
        j += 1
    } while value == 2
    image.append(value)
}

let rows = image.chunked(into: 25)

rows.forEach { r in
    print( r.map { $0 == 0 ? "X" : " " }.joined() )
}

/*
    X XX X XX XX  XXXX  X
XXX X XX X X XX XX XXXX X
XX XX XX X  XXX XXXXXXX X
X XXX XX X X XX XXXXXXX X
 XXXX XX X X XX XX X XX X
    XX  XX XX XX  XXX  XX
 */










