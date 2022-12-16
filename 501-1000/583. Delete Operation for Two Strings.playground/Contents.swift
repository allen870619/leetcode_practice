class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        var word1 = [Character](word1)
        var word2 = [Character](word2)
        var m = 0
        var arr = Array(repeating: Array(repeating: 0, count: word1.count), count: word2.count)
        for i2 in 0 ..< word2.count {
            for i1 in 0 ..< word1.count {
                if word1[i1] == word2[i2] {
                    arr[i2][i1] = i2 > 0 && i1 > 0 ? arr[i2 - 1][i1 - 1] + 1 : 1
                } else {
                    var left = i1 > 0 ? arr[i2][i1 - 1] : 0
                    var up = i2 > 0 ? arr[i2 - 1][i1] : 0
                    arr[i2][i1] = max(left, up)
                }
                m = max(m, arr[i2][i1])
            }
        }
        return word1.count + word2.count - m * 2
    }
}

let sol = Solution()
print(sol.minDistance("sea", "eat"))
print(sol.minDistance("leetcodeaa", "etco"))
