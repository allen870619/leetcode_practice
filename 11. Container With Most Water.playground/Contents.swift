class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxVal = 0
        for i in 0 ..< height.count {
            let left = height[i]
            if left * (height.count - i) > maxVal {
                for j in i + 1 ..< height.count {
                    let right = height[j]
                    let bar = min(left, right)
                    maxVal = max(maxVal, bar * (j - i))
                }
            }
        }
        return maxVal
    }
}

class Solution2 {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxVal = 0
        while left < right {
            maxVal = max(maxVal, min(height[left], height[right]) * (right - left))
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxVal
    }
}

let sol = Solution2()
print(sol.maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]))
print(sol.maxArea([1, 1]))
