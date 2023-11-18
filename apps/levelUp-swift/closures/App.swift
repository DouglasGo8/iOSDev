let closureAsCode = {
  let player1 = "Player1"
  let computer = "Computer"

  if (player1 > computer) {
    print("\(player1) wins!")
  } else {
    print("Game over")
  }
}

closureAsCode()

// as variable
let closureAsVariable = {print("I'm a closure")}

func print(payload: String) {
  print("Hey are u say? \(payload)")
}

func printIt(closure: (String)-> Void) {
  let message = "Hi"
  closure(message)
}

printIt(closure: print)

var hello: () -> String = {
  return "hello"
}

// Closure has the same effect Function/Callback in Java/JS
var double: (Int) -> (Int) = {x in return 2 * x}

print(double(2))

//
let names = ["Chris", "Alex", "Ewa", "Barry", "Dani"]



// backward order using Closure inline
 names.sorted(by: {(s1, s2) -> Bool in s1 > s2 }).forEach { name in
  print(name)
 }

// backward order using Closure inferring the type
//names.sorted(by: {s1, s2 in return s1 > s2})

// Trailing is'a better format
//names.sorted(by: {s1, s2 in s1 > s2});
//names.sorted(by: {$0 > $1})
// 
//names.sorted() {$0 > $1}

print("-------------")

names.sorted(by: {s1, s2 in s1.count < s2.count}).forEach{name in print(name)}


// Capturing Values, similar to callbacks

func intIncrementer(forIncrement amount: Int) -> () -> Int {
  var total = 0
  func incrementer() -> Int {
    total += amount
    return total
  }
  return incrementer
}

let increByTen = intIncrementer(forIncrement: 10)

//increByTen() // 10
//increByTen() // 20
//print(increByTen()) // 30


// @escaping closures are closures you want to use when
// 1. Needs make asynchronous call
// 2. Access some variables beyond the scope of the function
func escapingClosure(completionHandler: @escaping () -> Void) {}
func nonEscapingClosure(closure: ()-> Void){}

class MyClass {
  var x = 10
  func doSomething() {
    escapingClosure { self.x = 100 }
    nonEscapingClosure { x = 200 }
  }
}


// AutoClosures

var isDebug = true

func assert(_ expression: () -> Bool, _ message: () -> String) {
  guard isDebug else { return }
  if !expression() {
    // throw Error
    assertionFailure(message())
  }
}

func assert(_ expression: @autoclosure ()-> Bool, _ message: @autoclosure ()-> String) {
  guard isDebug else {return}
  if !expression() {
    assertionFailure(message())
  }
}

func throwMe(_ expression: @autoclosure ()-> Bool, _ message: () -> String) {
    
    if !expression() {
        assertionFailure(message())
    }
}


//throwMe({true})
//throwMe(false) {"Fuuuck"}

//assert({true}, {"Kaboom!!!"})
//assert(false, "Kaboom Mister")




// Map, Filter and Reduce

var numbers = [1, 2, 3, 4, 5]


numbers.map { s1 in "\(s1)"}
numbers.filter {s1 in s1 % 2 == 0}


// Two parameters
print(numbers.reduce(0) { $0 + $1}) // 15


// Closures Arcade


//
//
//
func applyKTimes(K: Int, closure: () -> Void) {
  for _ in 1...K {
    closure()
  }
}

//applyKTimes(K: 3, clousure: { print("I heart Swift") })

func applyKTimes(_ K: Int, _ closure: () -> Void) {
  for _ in 1...K {
    closure()
  }
}

//applyKTimes(3, { print("I heart Swift") })

//applyKTimes(3) { print("I'm love Swift") }


//
//
let numbers = [4, 7, 1, 9, 6, 5, 16, 9]

let max = numbers.reduce(numbers[0]) {
  $0 > $1 ? $0 : $1
}

print(max) // 16


//

let words = ["Sa", "Ta", "Na", "El"]

let result = words.reduce("") {
  guard $0 != "" else {
    return $1
  }

  return "\($0) \($1)"
}

print(result)


//



var numbers = [1,2,3,4,5,6]

let sum = numbers.filter {
  $0 % 2 == 1
}.map {
  $0 * $0
}.reduce(0, +)

print(sum)


//


//

var array = [1, 2, 3, 4, 5]

func forTheEach(_ array: [Int], _ closure: (Int) -> Void) {
  array.map { closure($0) }
}

forTheEach(array) { print($0) }
