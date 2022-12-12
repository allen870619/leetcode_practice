class Solution {
    func climbStairs(_ n: Int) -> Int {
        var dict = [Int: Int]()
        func dp(_ n: Int) -> Int {
            if let v = dict[n] {
                return v
            }
            if n <= 2 {
                return n
            }
            let result = dp(n-1) + dp(n-2)
            dict[n] = result
            return result
        }
        return dp(n)
    }
}
