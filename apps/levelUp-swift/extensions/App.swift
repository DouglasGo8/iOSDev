struct Person {
  let name: String = "Steve"
}

extension Person {
  var address: String {
    return "One Infinite Dream"
  }
}

let steve = Person()
//
print(steve.address)

extension Double {
  var km: Double { return self * 1_000.0 }
  var m: Double { return self }
  var cm: Double { return self * 100.0 }
  var mm: Double { return self * 1_000.0 }
  var ft: Double { return self * 3_28084 }
}

// fucking crazy
let oneInch = 25.3.mm
let threeFeet = 3.ft

print(oneInch)

extension Int {
  func repetitions(task: () -> Void) {
    for _ in 0..<self {
      task()
    }
  }
}

3.repetitions {
  print("Hello!")
}

extension Int {
  mutating func square() {
    self = self * self
  }
}

var someInt = 3

someInt.square()
print(someInt)

// Bizarre

extension Int {
  enum Kind {
    case negative, zero, positive
  }
  var kind: Kind {
    switch self {
    case 0:
      return .zero
    case let x where x > 0:
      return .positive
    default:
      return .negative
    }
  }
}

func printKindOfInteger(_ numbers: [Int]) {
  for number in numbers {
    switch number.kind {
      case .negative:
        print("- ", terminator: "")
      case .zero:
        print("0 ", terminator: "")
      case .positive:
        print("+ ", terminator: "")

    
    }
  }
}

let numbers = [-2, 0, 1, 13]

printKindOfInteger(numbers)

struct Point {
  let x: Int
  let y: Int
}

extension Point {
  init (reserved point: Point) {
    x = -point.x
    y = -point.y
  }
}

let positiveXY = Point(x: 1, y: 1)
let copiedInt = Point.init(reserved: positiveXY)

print(copiedInt.x)
print(copiedInt.y)