class MyStack {
    var stack = [Int]()
    init() {
        stack.removeAll()
    }

    func push(_ x: Int) {
        stack.append(x)
    }

    func pop() -> Int {
        return stack.removeLast() ?? -1
    }

    func top() -> Int {
        return stack.last ?? -1
    }

    func empty() -> Bool {
        return stack.isEmpty
    }
}
