class Solution {
    func isPowerOfFour(_ n: Int) -> Bool {
        if n <= 0 {
            return false
        }
        if n == 1 {
            return true
        }
        if n % 4 != 0 {
            return false
        }
        return isPowerOfFour(n / 4)
    }
}

class Solution2 {
    func isPowerOfFour(_ n: Int) -> Bool {
        if n <= 0 {
            return false
        }
        var n = n
        while n > 1 {
            if n % 4 != 0 {
                return false
            }
            n /= 4
        }
        return true
    }
}
