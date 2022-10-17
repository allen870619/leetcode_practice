class Solution {
    func checkIfPangram(_ sentence: String) -> Bool {
        var dict = [Character: Bool]()
        var total = 26
        for i in sentence {
            if dict[i] ?? false == false {
                dict[i] = true
                total -= 1
            }
            if total == 0 {
                break
            }
        }
        return total == 0
    }
}

let sol = Solution()
print(sol.checkIfPangram("thequickbrownfoxjumpsoverthelazydog"))
print(sol.checkIfPangram("leetcode"))
