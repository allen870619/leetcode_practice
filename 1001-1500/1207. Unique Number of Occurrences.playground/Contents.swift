class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        if arr.count <= 1 {
            return true
        }
        var dict = [Int: Int]()
        for i in arr {
            dict[i, default: 0] += 1
        }
        let result = dict.values.sorted()
        var last = result[0]
        for i in result[1...] {
            if last == i {
                return false
            }
            last = i
        }
        return true
    }
}
