class Solution {
    func reverseVowels(_ s: String) -> String {
        let s = [Character](s)
        var result = [Character]()
        let target: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        var list = s.filter { target.contains($0) }

        for i in s {
            if target.contains(i) {
                result.append(list.removeLast())
            } else {
                result.append(i)
            }
        }
        return String(result)
    }
}

let sol = Solution()
print(sol.reverseVowels("aA"))
