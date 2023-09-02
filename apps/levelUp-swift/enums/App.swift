enum CompassPoint {
  case north
  case south
  case east
  case west
}

enum Planet {
  case mercury, earth, venus
}

var directionToHead = CompassPoint.west
directionToHead = .east
directionToHead = .south

switch directionToHead {
  case .north:
    print("North here")
  case .east:
    print("East here")
  case .south:
    print("South here")
  case .west:
    print("West here")
}


let somePlanet = Planet.earth

switch somePlanet {
  case .earth:
    print("Come to Earth")
  default:
    print("You gonna dieee!!!")
}

enum Barcode {
  case upc(Int)
  case qrCode(String)
}

var productBarcode = Barcode.upc(8)
productBarcode = .qrCode("XXADSDSDWQ")

switch productBarcode {
  case .upc(let numOfSys):
    print("UPC: \(numOfSys)") 
  case .qrCode(let pCode):
    print("QR code: \(pCode)")
}


enum ASCIIChars: Character {
  case tab = "\t"
  case lineFeed = "\n"
}


/*let spacer = ASCIIChars.tab.rawValue


print (spacer)

enum OtherPlan: Int {
  case mercury = 1, earth
}


print(OtherPlan.earth.rawValue) // 2

//

enum Device {
  case iPad
  case iPhone

  var year: Int {
    switch self {
    case .iPad:
      return 2010
    case .iPhone:
      return 2018
    }
  }

}


let device = Device.iPhone

print(device.year)


// Really??
enum Character {
  enum Weapon {
    case bow
    case sword
    case dagger
  }

  case thief (weapon: Weapon)
  case warrior (weapon: Weapon)

  func getDescription() -> String {
    switch self {
      case let .thief(weapon):
        return "Thief chose \(weapon)"
      case let .warrior(weapon):
        return "Warrior chosen \(weapon)"
    }
  }
}

let char1 = Character.warrior(weapon: .sword)

print(char1.getDescription())
*/

//


enum ChatType {
  case authenticated
  case nonAuthenticated
}


let chatType = ChatType.authenticated


func isAuth( chatType: ChatType) -> Bool {

  guard chatType == .authenticated else {
    return false
  }

  return true
}

print(isAuth(chatType: chatType))