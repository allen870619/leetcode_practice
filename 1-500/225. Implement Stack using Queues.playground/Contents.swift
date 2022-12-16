class MyStack {
    var stack = [Int]()
    init() {
        stack.removeAll()
    }

    func push(_ x: Int) {
        stack.append(x)
    }

    func pop() -> Int {
        stack.removeLast() ?? -1
    }

    func top() -> Int {
        stack.last ?? -1
    }

    func empty() -> Bool {
        stack.isEmpty
    }
}
