class TimeMap { // better
    var data = [String: [(Int, String)]]()

    init() {
        data.removeAll()
    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        data[key, default: []].append((timestamp, value))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        let arr = data[key] ?? []
        var left = 0
        var right = arr.count - 1
        var result = ""

        while left <= right {
            let mid = (left + right) / 2
            if arr[mid].0 <= timestamp {
                result = arr[mid].1
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return result
    }
}

class TimeMap2 {
    var data = [String: [Int: String]]()

    init() {
        data.removeAll()
    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        data[key, default: [:]][timestamp] = value
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        var timestamp = timestamp
        while timestamp >= 0 {
            if let data = data[key]?[timestamp] {
                return data
            }
            timestamp -= 1
        }
        return ""
    }
}
