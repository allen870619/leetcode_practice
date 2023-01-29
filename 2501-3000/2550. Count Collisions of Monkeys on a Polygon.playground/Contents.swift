class Solution {
    func monkeyMove(_ n: Int) -> Int {
        var result = pow(n: n, m: 1_000_000_007)
        result -= 2

        if result < 0 {
            result += 1_000_000_007
        }
        return result
    }

    func pow(n: Int, m: Int) -> Int {
        var n = n
        var pow2 = 2
        var result = 1
        while n > 0 {
            if n % 2 == 1 {
                result = (result * pow2) % m
            }
            pow2 = (pow2 * pow2) % m
            n = n >> 1
        }

        return result
    }
}
