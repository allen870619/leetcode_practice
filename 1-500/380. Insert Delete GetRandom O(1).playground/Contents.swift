class RandomizedSet {
    var set = Set<Int>()
    init() {}

    func insert(_ val: Int) -> Bool {
        if set.contains(val) {
            return false
        }
        set.insert(val)
        return true
    }

    func remove(_ val: Int) -> Bool {
        if set.contains(val) {
            set.remove(val)
            return true
        }
        return false
    }

    func getRandom() -> Int {
        set.randomElement() ?? -1
    }
}

class RandomizedSet2 {
    var dict = [Int: Int]()
    var array = [Int]()
    init() {}

    func insert(_ val: Int) -> Bool {
        if dict[val] == nil {
            dict[val] = array.count
            array.append(val)
            return true
        }
        return false
    }

    func remove(_ val: Int) -> Bool {
        if array.isEmpty {
            return false
        }
        if let targetIndex = dict[val] {
            dict[array.last!] = targetIndex
            array.swapAt(targetIndex, array.count - 1)
            dict.removeValue(forKey: val)
            array.removeLast()
            return true
        }
        return false
    }

    func getRandom() -> Int {
        array.randomElement() ?? -1
    }
}
