class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if haystack.count < needle.count {
            return -1
        }
        let haystack = [Character](haystack), needle = [Character](needle)
        let needleCount = needle.count

        for i in 0 ... haystack.count - needleCount {
            if Array(haystack[i ..< i + needleCount]) == needle {
                return i
            }
        }
        return -1
    }
}

let sol = Solution()
print(sol.strStr("leetcode", "leeto"))
print(sol.strStr("sagbutsad", "sad"))
print(sol.strStr("sasasasad", "s"))
print(sol.strStr("mississippi", "issip"))
