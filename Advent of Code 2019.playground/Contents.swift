import Cocoa

// MARK: Helpers: going to do these kinds of things a lot judging from previous years!
func readNumbersFromLines(filename: String) -> [Int] {
    let fileURL = Bundle.main.url(forResource: filename, withExtension: "txt")
    let content = try! String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
    
    return content.split(separator: "\n").compactMap { Int(String($0)) }
}

func readNumberList(filename: String) -> [Int] {
    let fileURL = Bundle.main.url(forResource: filename, withExtension: "txt")
    let content = try! String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
    
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
