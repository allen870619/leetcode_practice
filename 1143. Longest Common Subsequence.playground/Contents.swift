class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var arr = Array(repeating: Array(repeating: 0, count: text2.count), count: text1.count)

        for (i1, t1) in text1.enumerated() {
            for (i2, t2) in text2.enumerated() {
                if t1 == t2 {
                    if i1 > 0, i2 > 0 {
                        arr[i1][i2] = arr[i1 - 1][i2 - 1]
                    }
                    arr[i1][i2] += 1
                } else {
                    if i1 > 0 {
                        arr[i1][i2] = max(arr[i1][i2], arr[i1 - 1][i2])
                    }
                    if i2 > 0 {
                        arr[i1][i2] = max(arr[i1][i2], arr[i1][i2 - 1])
                    }
                }
            }
        }
        return arr.last?.last ?? 0
    }
}

let sol = Solution()
print(sol.longestCommonSubsequence("abcde", "ace"))
print(sol.longestCommonSubsequence("bsbininm", "jmjkbkjkv"))
