class PeekingIterator { // Array
    var a = [Int]()
    var pointer = -1
    init(_ arr: IndexingIterator<[Int]>) {
        for i in arr.enumerated() {
            a.append(i.element)
        }
    }

    func next() -> Int {
        pointer += 1
        return a[pointer]
    }

    func peek() -> Int {
        return a[pointer + 1]
    }

    func hasNext() -> Bool {
        pointer != a.count - 1
    }
}

class PeekingIterator2 { // Node
    class Node {
        var val: Int
        var next: Node?
        init(_ val: Int) {
            self.val = val
        }
    }

    var head: Node? = Node(-1)

    init(_ arr: IndexingIterator<[Int]>) {
        var tmp = head
        for i in arr.enumerated() {
            head?.next = Node(i.element)
            head = head?.next
        }
        head = tmp
    }

    func next() -> Int {
        let t = head?.next?.val ?? -1
        head = head?.next
        return t
    }

    func peek() -> Int {
        return head?.next?.val ?? -1
    }

    func hasNext() -> Bool {
        return head?.next != nil
    }
}
