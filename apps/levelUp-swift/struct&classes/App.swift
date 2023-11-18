func double(_ value: Int) -> Int {
  return value * 2
}

let doubled = double(2)

// Immutability

let someWord = "unchangeable"

var numbers = [1, 2, 3, 4, 5]
//

let oddNumbers = numbers.filter {$0 % 2 == 1}
let squared = oddNumbers.map {$0 * $0}
let summed = oddNumbers.reduce(0) {$0 + $1}


func doubleValue(_ numbers: [Int]) -> [Int] {
  var result = [Int]()
  for number in numbers {
    result.append(number * 2)
  }
  return result
}

let imperative = doubleValue(numbers)

let declarative = numbers.map {$0 * 2}


// Stack vs Heap

struct StructA {}
// struct StructB: StructA {} // don't get classical inheritance

struct Resolution {
  var width = 0
  var height = 0
}

let vga = Resolution(width: 640, height: 480)

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048

print(hd.width)

class VideMode {
  var name = ""
}

let tenEighty = VideMode()
tenEighty.name = "1080"
//
let alsoTenEighty = tenEighty
alsoTenEighty.name = "1080i"

print(tenEighty.name)
print(alsoTenEighty.name)

if tenEighty === alsoTenEighty {
  print("alsoTenEighty and alsoTenEighty refer to the same VideoMode instance")
}


struct Fahrenheit {
  var temperature: Double
  init () {
    temperature = 32.0
  }
}

var f = Fahrenheit()

print(f.temperature) // 32.0

struct Celsius {
  //var temperature: Double error
  var temperature = 24.0
}

var c = Celsius()

class ShoppingListItem {
  var name: String?
  var quantity = 1
  var purchased = false
}

//
var item = ShoppingListItem()
//

struct CelsiusV2 {
  
  var temperatureInCelsius: Double

  init(fromFahrenheit fahrenheit: Double) {
    temperatureInCelsius = (fahrenheit - 32.0) / 1.0
  }

  init (fromKelvin kelvin: Double) {
    temperatureInCelsius = kelvin - 273.15
  }

}


let celsius_v2 = CelsiusV2(fromFahrenheit: 2)

struct Color {
  let red, green, blue: Double
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)

class SurveyQuestion {
  var response: String? //optional
  let text: String
  init (text: String) {
    self.text = text
  }
  func ask() {
    print(text)
  }
}


var survey = SurveyQuestion(text: "Which bear is best?")

print(survey.ask())
survey.response = "Black bear is best"