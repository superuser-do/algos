import Foundation

class Node {
    var value: Int
    var both: Int?
    
    init(_ value: Int,
         _ both: Int? = nil)
    {
        self.value = value
        self.both = both
    }
}

class XORLinkedList {
    var head: Node?
    var tail: Node?
    
    init(_ head: Node? = nil,
         _ tail: Node? = nil) {
        self.head = head
        self.tail = tail
    }
    
    func add(node: Node) {
        guard head != nil,
              var tail = tail else {
            head = node
            tail = node
            return
        }
        
        tail.both = node.both! ^ tail.both!
        node.both = tail.both
        tail = node
    }
    
    func get(index: Int) -> Node? {
        guard let node = head else { return nil }
        var prevID = 0
        
        for _ in stride(from: 0, to: index, by: 1) {
            let nextID = prevID ^ node.both!
            
            prevID = node.both!
            node.both = nextID
        }
        return node
    }
}
