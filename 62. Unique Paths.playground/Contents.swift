class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var tmp = Array(repeating: Array(repeating: -1, count: n), count: m)
        
        func dfs(_ nn: Int, _ nm: Int) -> Int{
            if nm == m-1 && nn == n-1{
                return 1
            }else if nm > m-1 || nn > n-1{
                return 0
            }
            
            if tmp[nm][nn] != -1{
                return tmp[nm][nn]
            }
            tmp[nm][nn] = dfs(nn+1, nm) + dfs(nn, nm+1)
            return tmp[nm][nn]
        }
        return dfs(0, 0)
    }
}
let sol = Solution()
print(sol.uniquePaths(3, 7))
print(sol.uniquePaths(16, 16))
