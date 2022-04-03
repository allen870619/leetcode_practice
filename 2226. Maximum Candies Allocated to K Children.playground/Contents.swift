class Solution {
    func maximumCandies(_ candies: [Int], _ k: Int) -> Int {
        let total = candies.reduce(0, +)
        if total < k{
            return 0
        }
        var left = 1
        var right = total / k
        while left < right{
            let mid = (left + right) / 2 + 1
            
            var piles = 0
            for i in candies{
                // cal piles
                piles += i / mid
            }
            if piles >= k{
                left = mid
            }else{
                right = mid - 1
            }
        }
        return left
    }
}
let sol = Solution()
print(sol.maximumCandies([5,8,6], 3)) // 5
print(sol.maximumCandies([2, 5], 11)) // 0
print(sol.maximumCandies([1, 2, 3, 4, 10], 5)) // 3
print(sol.maximumCandies([4, 7, 5], 4)) // 3
print(sol.maximumCandies([5,6,4,10,10,1,1,2,2,2], 9)) // 3
