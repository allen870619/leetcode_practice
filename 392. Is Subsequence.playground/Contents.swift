class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.isEmpty {
            return true
        }
        if t.isEmpty {
            return false
        }

        let sub = [Character](s)
        var index = 0
        for tc in t {
            if tc == sub[index] {
                index += 1
                if index == sub.count {
                    return true
                }
            }
        }
        return false
    }
}

let sol = Solution()
print(sol.isSubsequence("", "ahbgdc"))
print(sol.isSubsequence("abc", ""))
print(sol.isSubsequence("abc", "ahbgdc"))
print(sol.isSubsequence("axc", "ahbgdc"))
