class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n < 0 {
            return 1 / pow(x, -n)
        } else {
            return pow(x, n)
        }
    }

    private func pow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        if n % 2 == 0 {
            return pow(x * x, n / 2)
        } else {
            return x * pow(x, n - 1)
        }
    }
}

let sol = Solution()
print(sol.myPow(4, 5))
print(sol.myPow(2, 1))
print(sol.myPow(2, 0))
print(sol.myPow(2.1, 3))
print(sol.myPow(2, -2))
print(sol.myPow(0.1, 2_147_483_640))
