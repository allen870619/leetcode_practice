class Solution2 { // O(logN)
    func arrangeCoins(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        var left = 1, right = n
        while left < right {
            let mid = (left + right) / 2
            let sum = (mid + 1) * mid / 2
            if sum > n {
                right = mid
            } else if sum == n {
                return mid
            } else {
                left = mid + 1
            }
        }
        return left - 1
    }
}

class Solution { // O(N)
    func arrangeCoins(_ n: Int) -> Int {
        var layer = 1, total = 0

        while total < n {
            total += layer
            if total == n {
                return layer
            } else if total < n {
                layer += 1
            }
        }
        return layer - 1
    }
}
