//

func greet(person: String, day: String) -> String {
  "Hello \(person), today is \(day)"
}

print(greet(person: "Bob", day: "Tuesday"))

func greet(_ person: String, _ special: String) -> String {
  "Hello \(person), today's lunch special is \(special)"
}

print(greet("Bob", "Tacos"))

func greet(person: String, from hometown: String) -> String {
  "Hello \(person)! Glad you could visit from \(hometown)"
}

print(greet(person: "Bob", from: "Cupertino"))

func greet(to person: String, from hometown: String) -> String {
  "Hello \(person)! Glad you could visit from \(hometown)"
}

print(greet(to: "Bob", from: "Alicia"))

func myFunction(_ person: String = "unknown") -> String {
  "The name is \(person)"
}

print(myFunction())


func addTwoInts(_ a: Int, _ b: Int) -> Int {
  a + b
}

var mathSumFunction: (Int, Int) -> Int = addTwoInts

print(addTwoInts(2,3))

//func printMessage() {
//  print("Hi from Swift")
//}

/**
 * condition (Closure) param is a Function/Callback style
 */
func hasAnyMatches(_ list: [Int], _ condition: (Int) -> Bool) -> Bool {
  for item in list {
    if condition(item) {
      return true
    }
  }
  return false
}

var numbers = [20, 19, 7, 12]

func isTrueThis(_ a: Int, _ b: Int, _ condition: (Int, Int) -> Bool) -> String {
  guard condition(a, b) else { // 
   return "a \(a) is less than b \(b)"
  }
  return "a \(a) is greater than b \(b)"
}

//func lessThanThen(_ num: Int) -> Bool {  
//  num < 10
//}

// Lambda/Callback Style
var lessThanThen = hasAnyMatches(numbers, {(num) in num < 10})
var betweenThan = hasAnyMatches(numbers, {(num) in num >= 1 && num <= 10})

// var result = hasAnyMatches(numbers, lessThanThen)
print(betweenThan)
print(lessThanThen)

print(isTrueThis(2, 21,  {(a, b) in a > b  }))


func lastDigit(_ number: Int) -> Int {
  number % 10
}

func firstOf(_ N: Int) -> [Int] {
  var numbers = [Int]() // allocated Array
  for num in 1...N {
    numbers.append(num)
  }
  return numbers
}