

func addition<T: Numeric>(a: T, b: T)-> T {
  return a + b
}

let someInt = addition(a: 2, b: 3)

print(someInt)