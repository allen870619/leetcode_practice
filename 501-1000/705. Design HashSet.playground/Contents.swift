class MyHashSet {
    var array = Set<Int>()
    init() {
        array.removeAll()
    }

    func add(_ key: Int) {
        array.insert(key)
    }

    func remove(_ key: Int) {
        array.remove(key)
    }

    func contains(_ key: Int) -> Bool {
        array.contains(key)
    }
}
