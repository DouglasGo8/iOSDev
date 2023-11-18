
protocol Clickable {
  var didClick: Bool {get}
  var numberOfClick: Int {get}
}

struct Button: Clickable {
  var didClick: Bool = true
  var numberOfClick: Int = 4
}

struct Link {}

extension Link: Clickable {
  var didClick: Bool {
    return true
  }

  var numberOfClick: Int {
    get {
      return 4
    }
  }
}

// Methods

protocol RandomNumberGenerator {
  func random() -> Double
}

class SimpleGenerator: RandomNumberGenerator {
  func random() -> Double {
    return 42
  }
}

protocol Togglable {
  mutating func toggle()
}

enum OnOffSwitch: Togglable {
  case off, on
  mutating func toggle() {
    switch self {
      case .off:
        self = .on
      case .on:
        self = .off
    } 
  }
}

var lightSwitch = OnOffSwitch.off
print(lightSwitch) // off
lightSwitch.toggle()
print(lightSwitch) // on


class Dice {
  let sides: Int
  let generator: RandomNumberGenerator
  // constructor
  init (sides: Int, generator: RandomNumberGenerator) {
    self.sides = sides
    self.generator = generator
  }
  //
  func roll() -> Int {
    return Int(self.generator.random() * Double(self.sides)) + 1
  }
}

// usage

var d6 = Dice(sides: 6, generator: SimpleGenerator())

for _ in 1...5 {
  print("Random dice roll is \(d6.roll())")
}


struct Point {
  let x: Int
  let y: Int
  init (_ x: Int, _ y: Int) {
    self.x = x
    self.y = y
  }
}

struct Player {
  var position = Point(0, 0)
}


enum Direction {
  case left
  case right
  case up
  case down
}

protocol Moveable {
  mutating func move(_ direction: Direction)
  func coordinates() -> String
}

extension Player: Moveable {
  mutating func move (_ direction: Direction) {
    let currentX = position.x
    let currentY = position.y

    switch direction {
      case .left:
        position = Point(currentX - 1, currentY)
      case .right:
        position = Point(currentX + 1, currentY)
      case .up:
        position = Point(currentX, currentY + 1)
      case .down:
        position = Point(currentX, currentY - 1)
    }
  }

  func coordinates() -> String {
    return "(\(position.x), \(position.y))"
  }
}

//

var player1 = Player()

print(player1.coordinates())

player1.move(.left)

print(player1.coordinates())


// Protocol Delegates


protocol DeathStarCanonDelegate {
  func canonReady()
}

struct DeathStarCanonService {
  // weak is only of classes
  var delegate: DeathStarCanonDelegate?

  func chargePrimaryCanon() {
    delegate?.canonReady()
  }
}

struct CommandCenter {
  var service = DeathStarCanonService()

  init() {
    service.delegate = self
  }

  func fireWhenReady() {
    service.chargePrimaryCanon()
  }

  private func fire() {
    print("Boom!")
  }

}

extension CommandCenter: DeathStarCanonDelegate {
  func canonReady() {
    // async invocation
    fire()
  }
}

let commandCenter = CommandCenter()

commandCenter.fireWhenReady()