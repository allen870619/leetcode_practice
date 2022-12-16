class Solution {
    func isUgly(_ n: Int) -> Bool {
        if n < 1 {
            return false
        }
        var n = n
        while n > 1 {
            if n % 5 == 0 {
                n /= 5
            } else if n % 3 == 0 {
                n /= 3
            } else if n % 2 == 0 {
                n /= 2
            } else {
                return false
            }
        }
        return true
    }
}
