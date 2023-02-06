class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        var result = [Int]()
        for i in 0 ..< n {
            result.append(nums[i])
            result.append(nums[n + i])
        }
        return result
    }
}

let sol = Solution()
print(sol.shuffle([2, 5, 1, 3, 4, 7], 3))
