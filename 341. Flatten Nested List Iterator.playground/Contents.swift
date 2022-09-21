class NestedIterator {
    var index = 0
    var list = [Int]()
    var tmp = [NestedInteger]()

    init(_ nestedList: [NestedInteger]) {
        tmp = nestedList
        while !tmp.isEmpty {
            for _ in tmp {
                let a = tmp.removeFirst()
                let i = a.getInteger()
                if a.isInteger() {
                    list.append(i)
                } else {
                    tmp = a.getList() + tmp
                }
            }
        }
    }

    func next() -> Int {
        let v = list[index]
        index += 1
        return v
    }

    func hasNext() -> Bool {
        return index < list.count
    }
}
