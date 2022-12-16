class Solution {
    func nthMagicalNumber(_ n: Int, _ a: Int, _ b: Int) -> Int {
        var result = cal(n, a, b)
        if result == -1 {
            result = cal(n, b, a)
        }
        return result % 1_000_000_007
    }

    func lcm(_ a: Int, _ b: Int) -> Int {
        var a1 = a
        var b1 = b
        while a1 != b1 {
            if a1 < b1 {
                a1 += a
            } else if a1 > b1 {
                b1 += b
            }
        }
        return a1
    }

    func cal(_ n: Int, _ a: Int, _ b: Int) -> Int {
        let ab = lcm(a, b)
        var bot = 0
        var top = n + 1
        while bot < top - 1 {
            let center = (bot + top) / 2
            let max = a * center
            let total = center + (max / b) - (max / ab)

            if total < n {
                bot = center
            } else if total > n {
                top = center
            } else {
                return max
            }
        }
        return -1
    }
}

let sol = Solution()
print(sol.nthMagicalNumber(1, 2, 3)) // 2
print(sol.nthMagicalNumber(4, 2, 3)) // 6
print(sol.nthMagicalNumber(5, 2, 4)) // 10
print(sol.nthMagicalNumber(3, 6, 4)) // 8
print(sol.nthMagicalNumber(2, 7, 3)) // 8
print(sol.nthMagicalNumber(1_000_000_000, 40000, 40000))
