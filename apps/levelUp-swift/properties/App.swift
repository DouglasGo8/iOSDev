

struct StoredProperties {
  var stored: String = "stored"
  lazy var importer = "lazy"
  //
  var storedObserver: String {
    
    willSet {
      print("willSet was called")
      print("stored will be set to \(newValue)")
      print("stored is now equal to \(stored)")  
    }

    didSet {
      print("didSet was called")
      print("stored is now equal \(stored)")
      print("stored was previously set to \(oldValue)")
    }
    
  }
}

struct ComputedProperties {
  var computed: String {
    return "computed"
  }

  private var _stored = "stored"
  var shortHand: String {
    get {
      return _stored
    }
    set {
      _stored = newValue // keyword (newValue)
    }
  }
}

// suppose will be expensive
class DataImporter {
  var filename = "report.dat"
}

class DataManager {
  lazy var importer = DataImporter()
  var data = [String]()
}


struct Point { 
  var x = 0.0,  y = 0.0
}

struct Size { 
  var width = 0.0, height = 0.0
}

struct Rect {
  var size = Size()
  var origin = Point()
  //
  var center: Point {
    get {
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY)
    }
    set (newCenter) {
      origin.x = newCenter.x - (size.width/2)
      origin.y = newCenter.y - (size.height/2)
    }
  }
}

struct CompactRect {
  var size = Size()
  var origin = Point()
  //
  var center: Point {
    get {
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY)
    }
    set {
      origin.x = newValue.x - (size.width/2)
      origin.y = newValue.y - (size.height/2)
    }
  }
}

struct Cuboid {
  var width = 0.0, height = 0.0, depth = 0.0
  var volume: Double {
    return width * height * depth
  }
}



// Arcade

struct Person {
  var age: Int

  var ageInDogYears: Int {
    self.age * 7
  }
}

var joe = Person(age: 25)
print(joe.ageInDogYears)

//

class Circle {
  var radius: Double = 0 {
    didSet {
      if radius < 0 {
        radius = oldValue
      }
    }
  }
}

let circle = Circle()

circle.radius = 12
circle.radius = -10
//
print(circle.radius)

// Property Wrappers

@propertyWrapper
struct TwelveOrLess {
  private var number = 0
  var wrappedValue: Int {
    get {
      return self.number
    } set {
      self.number = min(newValue, 12)
    }
  }
}


struct SmallRectangle {
  @TwelveOrLess var width: Int
  @TwelveOrLess var height: Int
}

var rectangle = SmallRectangle()

rectangle.height = 10

print(rectangle.height)



/*@propertyWrapper
struct Trimmed {
  private(set) var value: String = ""
  var wrappedValue: String {
    get {value}
    set {value = newValue.trimmingCharacters(in: .whitespacesAndNewlines)}
  }
  init(wrappedValue initialValue: String) {
      self.wrappedValue = initialValue
    }
}
struct Post {
  @Trimmed var title: String
}*/