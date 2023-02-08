class Solution {
    func jump(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return 0
        }
        var result = 0, maxCount = 0, index = 0
        let total = nums.count

        while index < total - 1 {
            if index + nums[index] >= total - 1 {
                result += 1
                break
            }

            let tmpIndex = index
            for i in 0 ..< nums[index] {
                let shift = i + 1
                if tmpIndex + shift + nums[tmpIndex + shift] > maxCount {
                    maxCount = tmpIndex + shift + nums[tmpIndex + shift]
                    index = tmpIndex + shift
                }
            }

            result += 1
        }
        return result
    }
}

let sol = Solution()
print(sol.jump([1])) // 0
print(sol.jump([2, 3, 1, 1, 4])) // 2
print(sol.jump([2, 1, 1, 1, 4])) // 3
print(sol.jump([7, 0, 9, 6, 9, 6, 1, 7, 9, 0, 1, 2, 9, 0, 3])) // 2
print(sol.jump([1, 2])) // 1
print(sol.jump([1, 2, 0, 1])) // 2
