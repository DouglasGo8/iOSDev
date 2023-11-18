

enum EnrollmentError: Error {
  case inactiveStudent
  case doesNotMeetMinLevel(minLevel: Int)
  case courseFull
}

struct Student {
  let active = false
  let level = 1
  let name = "Peter"
}

let minLevel = 0
let capacity = 10
var students = [Student()]

struct Course {
  let name = "Math"

  func enroll(_ student: Student) throws {
    guard student.active else {
      throw EnrollmentError.inactiveStudent
    }
    guard student.level >= minLevel else {
      throw EnrollmentError.doesNotMeetMinLevel(minLevel: minLevel)
    }
    guard students.count > capacity else {
      throw EnrollmentError.courseFull
    }
    students.append(student)
  }
}
