class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dict = [Character: Int]()
        for i in s {
            dict[i, default: 0] += 1
        }
        for (index, i) in s.enumerated() {
            if dict[i] == 1 {
                return index
            }
        }
        return -1
    }
}
