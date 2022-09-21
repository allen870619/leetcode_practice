class Solution {
    func maxVowels(_ s: String, _ k: Int) -> Int {
        let alpha: [Character] = ["a", "e", "i", "o", "u"]
        let str = [Character](s)
        var left = 0
        var right = 0
        var maxV = 0
        var v = 0
        while right < str.count {
            if alpha.contains(str[right]) {
                v += 1
            }
            if right - left >= k {
                if alpha.contains(str[left]) {
                    v -= 1
                }
                left += 1
            }
            maxV = max(maxV, v)
            if maxV == k {
                break
            }
            right += 1
        }
        return maxV
    }
}

let sol = Solution()
print(sol.maxVowels("abciiidef", 3))
