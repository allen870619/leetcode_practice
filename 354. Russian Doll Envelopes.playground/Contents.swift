class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        let total = envelopes.count
        let envelopes = envelopes.sorted {
            if $0[0] == $1[0] {
                return $0[1] > $1[1]
            } else {
                return $0[0] < $1[0]
            }
        }
        var tmp = [Int]()
        for e in envelopes {
            var i = 0, j = tmp.count - 1
            while i <= j {
                let mid = i + (j - i) / 2
                if tmp[mid] < e[1] {
                    i = mid + 1
                } else {
                    j = mid - 1
                }
            }
            if i < tmp.count {
                tmp[i] = e[1]
            } else {
                tmp.append(e[1])
            }
        }
        return tmp.count
    }
}

class Solution2 { // TLE
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        var dp = Array(repeating: 1, count: envelopes.count)
        var result = 1
        let total = envelopes.count
        let envelopes = envelopes.sorted {
            if $0[0] + $0[1] == $1[0] + $1[1] {
                return abs($0[0] - $0[1]) > abs($1[0] - $1[1])
            } else {
                return $0[0] + $0[1] < $1[0] + $1[1]
            }
        }
        for i in 0 ..< total {
            let target = envelopes[i]
            for j in i ..< total {
                let cur = envelopes[j]
                if target[0] < cur[0], target[1] < cur[1] {
                    dp[j] = max(dp[j], dp[i] + 1)
                    result = max(result, dp[j])
                }
            }
        }

        return result
    }
}

let sol = Solution()
print(sol.maxEnvelopes([[5, 4], [6, 4], [6, 7], [2, 3]]))
print(sol.maxEnvelopes([[4, 5], [4, 6], [6, 7], [2, 3], [1, 1]]))
print(sol.maxEnvelopes([[1, 1], [1, 1], [1, 1]]))
print(sol.maxEnvelopes(
    [[1, 3], [3, 5], [6, 7], [6, 8], [8, 4], [9, 5]]))

print(sol.maxEnvelopes(
    [[30, 50], [12, 2], [3, 4], [12, 15]]))
