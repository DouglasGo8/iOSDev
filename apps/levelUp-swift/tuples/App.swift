
let error = (404, "Not found")

let code = error.0
let reason = error.1
//
var person: (firstName: String, lastName: String) = (firstName: "John", lastName: "Smith")

print(person.firstName)

//
var point = (0, 0)

point.0 = 10
point.1 = 23

var origin = (x:0, y:0)

var point1 = origin

point1.x = 3
point1.y = 5

origin // (0, 0)
point1 // (3, 5)

let atuple = ("tuple", 1, true)

print(atuple)

// Can be decomposed

let aPerson = (firstN:"John", lastN: "Doe")

let (p1, p2) = aPerson

print(p1)

var (onlyP1, _) = aPerson


print(onlyP1)

//

func getStatusCode() -> (Int, String) {
  return (400, "Not found")
}

let status = getStatusCode()


print (status.1)

//



func myFunc() -> (param1: Int, param2: String) {
  return (404,  "Not found")
}


var pp = myFunc()


print(pp.param1)


let flight = (airport: "Calgary", airplane: "222")

print("Flight \(flight.airplane) from \(flight.airport) is ready for take off!")


//

let drivers = ["drive1", "drive2", "drive3"]

for (index, name) in drivers.enumerated() {
  print("\(name) has position \(index)")
}

drivers.enumerated().map {
  print("\($0)")
}