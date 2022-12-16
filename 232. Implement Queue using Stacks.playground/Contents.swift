class MyQueue {
    var arr = [Int]()

    init() {}

    func push(_ x: Int) {
        arr.append(x)
    }

    func pop() -> Int {
        arr.removeFirst()
    }

    func peek() -> Int {
        arr.first ?? 0
    }

    func empty() -> Bool {
        arr.isEmpty
    }
}
