class Solution {
    func trap(_ height: [Int]) -> Int {
        func calRange(_ start: Int, _ end: Int) -> Int {
            var total = 0
            var ref = min(height[start], height[end])
            for i in start ..< end {
                if ref - height[i] > 0 {
                    total += ref - height[i]
                }
            }
            return total
        }

        var left = 0
        var right = height.count - 1
        var tmpL = 0
        var tmpR = height.count - 1
        var result = 0
        while tmpL < tmpR {
            if height[tmpL] < height[tmpR] {
                tmpL += 1
                if height[tmpL] >= height[left] {
                    // cal range
                    result += calRange(left, tmpL)
                    left = tmpL
                }
            } else {
                tmpR -= 1
                if height[tmpR] >= height[right] {
                    // cal range
                    result += calRange(tmpR, right)
                    right = tmpR
                }
            }
        }
        return result
    }
}

class Solution2 {
    func trap(_ height: [Int]) -> Int {
        var left = 0; var tmpL = 0
        var right = height.count - 1; var tmpR = height.count - 1
        var result = 0

        while tmpL < tmpR {
            if height[tmpL] < height[tmpR] {
                tmpL += 1
                if height[tmpL] < height[left] {
                    result += height[left] - height[tmpL]
                } else {
                    left = tmpL
                }
            } else {
                tmpR -= 1
                if height[tmpR] < height[right] {
                    result += height[right] - height[tmpR]
                } else {
                    right = tmpR
                }
            }
        }
        return result
    }
}

let sol = Solution2()
print(sol.trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]))
print(sol.trap([4, 2, 0, 3, 2, 5]))
print(sol.trap([0]))
print(sol.trap([2, 0, 2]))
print(sol.trap([6, 4, 2, 0, 3, 2, 0, 3, 1, 4, 5, 3, 2, 7, 5, 3, 0, 1, 2, 1, 3, 4, 6, 8, 1, 3]))
