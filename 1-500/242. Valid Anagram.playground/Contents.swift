class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }

        var dict1 = [Character: Int]()
        var dict2 = [Character: Int]()

        for i in s {
            dict1[i, default: 0] += 1
        }
        for i in t {
            dict2[i, default: 0] += 1
        }
        return dict1 == dict2
    }
}

class Solution2 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        s.sorted() == t.sorted()
    }
}
