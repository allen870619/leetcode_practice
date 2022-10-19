class Solution {
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var dict = [String: Int]()
        var result = [String]()
        for i in words {
            dict[i, default: 0] += 1
        }
        let list = dict.sorted(by: { a, b in
            if a.value == b.value {
                return a.key < b.key
            } else {
                return a.value > b.value
            }
        })
        for i in 0 ..< k {
            result.append(list[i].key)
        }
        return result
    }
}
