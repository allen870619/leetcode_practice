class Solution {
    func bagOfTokensScore(_ tokens: [Int], _ power: Int) -> Int {
        var left = 0, right = tokens.count-1
        let tokens = tokens.sorted()
        var power = power
        var result = 0, maxResult = 0
        
        while left <= right {
            if power >= tokens[left] {
                power -= tokens[left]
                result += 1
                maxResult = max(maxResult, result)
                left += 1
            } else {
                if result > 0 {
                    power += tokens[right]
                    result -= 1
                }
                right -= 1
            }
        }
        
        return maxResult
    }
}

let sol = Solution()
print(sol.bagOfTokensScore([400,100,200,300], 200))
print(sol.bagOfTokensScore([21], 51))
print(sol.bagOfTokensScore([90,69,47], 10))
