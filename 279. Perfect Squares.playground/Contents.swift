class Solution { // dp
    func numSquares(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)

        for i in 1 ... n {
            dp[i] = i
            for j in 1 ..< i where i >= j * j {
                dp[i] = min(dp[i], dp[i - j * j] + 1)
            }
        }
        return dp[n]
    }
}

class Solution2 {
    func numSquares(_ n: Int) -> Int {
        var list = [n]
        var result = 0
        while !list.isEmpty {
            result += 1
            for _ in 0 ..< list.count {
                let i = list.removeFirst()
                for m in 1 ..< i {
                    let remain = i - m * m
                    if remain < 0 {
                        break
                    }
                    if remain == 0 {
                        return result
                    }
                    if remain > 0, !list.contains(remain) {
                        list.append(remain)
                    }
                }
            }
            list.sort()
        }
        return result
    }
}

let sol = Solution2()
print(sol.numSquares(13))
print(sol.numSquares(12))
// print(sol.numSquares(6616))
