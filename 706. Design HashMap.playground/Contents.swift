class MyHashMap {
    var arr: [Int]
    
    init() {
        arr = Array(repeating: -1, count: 1000001)
    }
    
    func put(_ key: Int, _ value: Int) {
        arr[key] = value
    }
    
    func get(_ key: Int) -> Int {
        return arr[key]
    }
    
    func remove(_ key: Int) {
        arr[key] = -1
    }
}

class MyHashMap2 {
    var map = [Int: Int]()
    init() {
        map.removeAll()
    }
    
    func put(_ key: Int, _ value: Int) {
        map[key] = value
    }
    
    func get(_ key: Int) -> Int {
        return map[key] ?? -1
    }
    
    func remove(_ key: Int) {
        map.removeValue(forKey: key)
    }
}
