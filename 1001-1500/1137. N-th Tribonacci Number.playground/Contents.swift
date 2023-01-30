class Solution {
    var dict = [Int: Int]()
    func tribonacci(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        if n <= 2 {
            return 1
        }
        if let ans = dict[n] {
            return ans
        }
        dict[n] = tribonacci(n - 1) + tribonacci(n - 2) + tribonacci(n - 3)
        return dict[n]!
    }
}

class Solution2 {
    func tribonacci(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        if n <= 2 {
            return 1
        }

        var first = 0, second = 1, result = 1
        for _ in 3 ... n {
            let tmp = first + second + result
            first = second
            second = result
            result = tmp
        }
        return result
    }
}

let sol = Solution2()
print(sol.tribonacci(4))
print(sol.tribonacci(25))
