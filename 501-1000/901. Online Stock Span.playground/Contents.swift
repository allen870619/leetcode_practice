class StockSpanner {
    var stack = [Int]()
    var tmpCount = [Int]()

    init() {}

    func next(_ price: Int) -> Int {
        stack.append(price)
        tmpCount.append(1)
        var tmp = 0, index = stack.count - 1
        while index >= 0 {
            if stack[index] <= price {
                tmp += tmpCount[index]
                index -= tmpCount[index]
            } else {
                break
            }
        }
        tmpCount[stack.count - 1] = tmp
        return tmp
    }
}
