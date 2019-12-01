import Cocoa


func readNumbers(filename: String) throws -> [Int] {
    let fileURL = Bundle.main.url(forResource: filename, withExtension: "txt")
    let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
    
    return content.split(separator: "\n").compactMap { Int(String($0)) }
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


let oneData = try readNumbers(filename: "1")

//1a Fuel required to launch a given module is based on its mass. Specifically, to find the fuel required for a module, take its mass, divide by three, round down, and subtract 2. What is all fuel?

let oneAAns = oneData.map { n in
    floor(n.d / 3.0) - 2
}.reduce(0.0, +)

print("1a: \(oneAAns.ri)")

func fuel1b(n: Int) -> Int {
    let baseFuel = (floor(n.d / 3.0) - 2).ri
    if baseFuel > 0 {
        return baseFuel + fuel1b(n: baseFuel)
    } else {
        return 0
    }
}

let oneBAns = oneData.map(fuel1b).reduce(0, +)
print("1b: \(oneBAns)")





