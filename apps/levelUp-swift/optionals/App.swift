let num1: Int = Int(43)
let num2: Int = 11
let num3 = 11
//
let num4: Int? = 42

// unwrap
if let num = num4 {
  print("We've a number \(num)")
} else {
  print("Sorry. No soup for you.") // nil
}


func printNum(num: Int?) {
  guard let nn = num else {
    print("No number here.")
    return
  }
  print("Yep! We've a number \(nn)!")
}


//printNum(num: num4)

//var someOptValue: Int?
//let myType = someOptValue! // Error


let nickName: String? = nil
let defaultName: String = "John"
//?? means if nil nickName use defaultName
let information = "Hi \(nickName ?? defaultName)" 

print(information)



class Person {
  var residence: Residence? // nil
}

class Residence {
  var roomsNumb = 1
}

var john = Person()

if let roomCount = john.residence?.roomsNumb {
  print("John's residence has \(roomCount) rooms(s).")
} else {
  print("Unable to retrieve the number of rooms.")
}

let shortF: Int? = Int("42")
let longF: Optional<Int> = Int("42")
let number: Int? = Optional.some(42)
let noNumber: Int? = Optional.none

//

