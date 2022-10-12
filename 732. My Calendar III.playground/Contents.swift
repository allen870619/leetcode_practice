class MyCalendarThree {
    var dict = [Int: Int]()

    init() {
        dict.removeAll()
    }

    func book(_ start: Int, _ end: Int) -> Int {
        dict[start, default: 0] += 1
        dict[end, default: 0] -= 1
        var cur = 0, result = 0
        for i in dict.sorted(by: { $0.key < $1.key }) {
            cur += i.value
            result = max(result, cur)
        }
        return result
    }
}
