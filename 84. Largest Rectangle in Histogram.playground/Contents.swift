class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var heights = heights
        heights.append(-1)
        var mono: [Int] = []
        var maxVal = 0
        
        for i in 0..<heights.count {
            while !mono.isEmpty && heights[mono.last!] >= heights[i] {
                var height = heights[mono.popLast()!]
                var width = mono.isEmpty ? i : i - mono.last! - 1
                maxVal = max(maxVal, height * width)
            }
            mono.append(i)
        }
        return maxVal
    }
}

let sol = Solution()
print(sol.largestRectangleArea([2,1,5,6,2,3]))
print(sol.largestRectangleArea([2,4]))
print(sol.largestRectangleArea([4, 2]))
print(sol.largestRectangleArea([2,1,2]))
