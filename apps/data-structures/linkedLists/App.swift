
class MyNode<T>: CustomStringConvertible {
  
  var value: T
  var next: MyNode?

  public init(value: T, next: MyNode? = nil) {
    self.next = next
    self.value = value
  }

  public var description: String {
    guard let next = next else {
      return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}

class MyLinkedList<T>: CustomStringConvertible {
  public var head: MyNode<T>?
  public var tail: MyNode<T>?
  public init() {}
  
  public var isEmpty: Bool {head == nil}

  public func push(_ value: T) {
    self.head = MyNode(value: value, next: self.head)
    if tail == nil {
      tail = head
    }
  }

  public func append(_ value: T) {
    guard !isEmpty else {
      self.push(value);
      return
    }
    self.tail?.next = MyNode(value: value)
    self.tail = self.tail!.next
  }

  public func insert() -> MyNode<T> {}

  private func node(at index: Int) -> MyNode<T>? {
    var thPos = 0
    var thNode = self.head;

    while thNode != nil && thPos < index {
      thNode = thNode!.next
      thPos += 1
    }

    return thNode
    
  }
  

  public var description: String {
    guard let head = head else {
      return "Empty List"
    }
    return String(describing: head)
  }
}

//let node1 = MyNode(value: 1)
//let node2 = MyNode(value: 2)
//let node3 = MyNode(value: 3)
//
//node1.next = node2
//node2.next = node3
//
// print(node1)

var linkedNode1 = MyLinkedList<Int>()

linkedNode1.push(3)
linkedNode1.push(2)
linkedNode1.push(1)

print(linkedNode1)

var linkedNode2 = MyLinkedList<Int>()

linkedNode2.append(1)
linkedNode2.append(2)
linkedNode2.append(3)

print(linkedNode2)

//print("Main App")