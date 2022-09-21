class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        if arr.count < 1 {
            return false
        }
        var isUp = false
        var isDown = false
        var last = arr[0]
        for i in arr[1...] {
            if i > last {
                if isDown {
                    return false
                }
                isUp = true
            } else if i < last {
                if !isDown {
                    isDown = true
                }
            } else {
                return false
            }
            last = i
        }
        return isUp && isDown
    }
}

let sol = Solution()
print(sol.validMountainArray([2, 1])) // f
print(sol.validMountainArray([3, 5, 5])) // f
print(sol.validMountainArray([0, 3, 2, 1]))
print(sol.validMountainArray([0, 2, 3, 4, 5, 2, 1, 0]))
print(sol.validMountainArray([0, 2, 3, 3, 4, 2, 1, 0])) // f
