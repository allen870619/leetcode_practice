class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        if n == 1 {
            return true
        }
        if n % 3 != 0 || n <= 0 {
            return false
        }
        return isPowerOfThree(n / 3)
    }
}

class Solution2 {
    func isPowerOfThree(_ n: Int) -> Bool {
        // 1162261467: The num cloest to Int.max(), 3^19
        n > 0 && 1_162_261_467 % n == 0
    }
}

class Solution3 {
    func isPowerOfThree(_ n: Int) -> Bool {
        var start: Int64 = 1
        let n = Int64(n)
        while start <= n {
            if start == n {
                return true
            }
            start *= 3
        }
        return false
    }
}

class Solution4 {
    func isPowerOfThree(_ n: Int) -> Bool {
        if n <= 0 {
            return false
        }
        var n = n
        while n % 3 == 0 {
            n /= 3
        }
        return n == 1
    }
}
