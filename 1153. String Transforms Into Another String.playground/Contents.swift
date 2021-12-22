class Solution {
    func canConvert(_ str1: String, _ str2: String) -> Bool {
        if str1 == str2{
            return true
        }
        /// 可以各自轉換，但是如果把26個字全部都轉換了，會有字元被取代掉(轉換是要轉整個字串一起轉，轉完後再繼續)， 必須小於26 保留至少一個定竿
        var charDict: [Character: Character] = [:]
        var cs: Set<Character> = []
        for i in 0..<str1.count{
            let a = str1[str1.index(str1.startIndex, offsetBy: i)]
            let b = str2[str2.index(str2.startIndex, offsetBy: i)]
            if charDict[a] == nil{
                charDict[a] = b
                cs.insert(b)
            }else if charDict[a] != b{
                return false
            }
        }
        return cs.count < 26
    }
}

let sol = Solution()
print(sol.canConvert("aabcc", "ccdee")) //true
print(sol.canConvert("aabcc", "cxdee")) // false
print(sol.canConvert("agbcc", "ccdee")) // true
print(sol.canConvert("leetcode", "codeleet")) // false
print(sol.canConvert("abcdefghijklmnopqrstuvwxyz", "bcadefghijklmnopqrstuvwxzz")) // true
print(sol.canConvert("abcdefghijklmnopqrstuvwxyz", "bcdefghijklmnopqrstuvwxyzq")) // true
print(sol.canConvert("aa", "ab")) // false
