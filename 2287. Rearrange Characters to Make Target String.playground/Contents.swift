class Solution {
    func rearrangeCharacters(_ s: String, _ target: String) -> Int {
        var dict = [Character: Int]()
        s.map{ dict[$0, default: 0] += 1 }
        
        var result = 0
        while true{
            for i in target{
                if dict[i] ?? 0 > 0{
                    dict[i]? -= 1
                }else{
                    return result
                }
            }
            result += 1
        }
        return 0
    }
}

let sol = Solution()
print(sol.rearrangeCharacters("ilovecodingonleetcode", "code"))
print(sol.rearrangeCharacters("abcba", "abc"))
print(sol.rearrangeCharacters("abbaccaddaeea", "code"))
