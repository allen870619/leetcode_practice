class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n == 0{
            return false
        }
        var n = n
        while n != 1{
            if n % 2 != 0{
                return false
            }
            n /= 2
        }
        return true
    }
}
