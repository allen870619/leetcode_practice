
class Solution {
    func winnerSquareGame(_ n: Int) -> Bool {
        var dict: [Int: Bool] = [:]
        dict[0] = false
        dict[1] = true
        func dfs(_ n: Int) -> Bool {
            if let ans = dict[n] {
                return ans
            }
            if n > 1 {
                var c = 1
                var result = false
                while c * c <= n {
                    if !dfs(n - c * c) {
                        dict[n] = true
                        return true
                    }
                    c += 1
                }
            }
            dict[n] = false
            return false
        }
        return dfs(n)
    }
}

class Solution2 {
    func winnerSquareGame(_ n: Int) -> Bool {
        var dict: [Int: Bool] = [:]
        dict[0] = false
        dict[1] = true
        for i in 0 ... n {
            var c = 1
            while c * c <= i {
                if dict[i - c * c] != true {
                    dict[i] = true
                    break
                }
                c += 1
            }
        }
        return dict[n] == nil ? false : true
    }
}

let sol = Solution2()
print(sol.winnerSquareGame(1))
print(sol.winnerSquareGame(2)) // f
print(sol.winnerSquareGame(4))
print(sol.winnerSquareGame(7)) // f
print(sol.winnerSquareGame(9))
