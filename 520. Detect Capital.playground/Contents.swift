class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        var upper = 0
        let capital = (65 ... 90).contains(word.first!.asciiValue!)
        for i in word {
            guard let ascii = i.asciiValue else { return false }
            if (65 ... 90).contains(ascii) {
                upper += 1
            }
        }
        if upper == word.count || upper == 0 || (upper == 1 && capital) {
            return true
        }
        return false
    }
}

let sol = Solution()
print(sol.detectCapitalUse("FFFFFFFFFFFFFFFFFFFFf"))
