class Solution {
    func distinctIntegers(_ n: Int) -> Int {
        var set = Set<Int>()
        for j in 1 ... n {
            for i in 1 ... j {
                if j % i == 1 {
                    set.insert(i)
                }
            }
        }
        return set.count + 1
    }
}

let sol = Solution()
print(sol.distinctIntegers(5))
