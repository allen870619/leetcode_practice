class Solution {
    func countVowelStrings(_ n: Int) -> Int {
        var mem = Array(repeating: Array(repeating: -1, count: 5), count: 51)
        
        func bt(_ remain: Int, _ index: Int) -> Int{
            if mem[remain][index] != -1{
                return mem[remain][index]
            }
            if index == 4 ||  n - remain == 0{
                return 1
            }
            var tmp = 0
            for i in index..<5{
                tmp += bt(remain+1, i)
            }
            if mem[remain][index] == -1{
                mem[remain][index] = tmp
            }
            return tmp
        }
        
        return bt(0, 0)
    }
}

let sol = Solution()
print(sol.countVowelStrings(1))
print(sol.countVowelStrings(2))
print(sol.countVowelStrings(33))
print(sol.countVowelStrings(50))
