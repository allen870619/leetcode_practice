class Solution {
    func removeStones(_ stones: [[Int]]) -> Int {
        var result = 0
        var run = [[Int]]()

        func dfs(_ coord: [Int]) -> Int {
            if run.contains(coord) {
                return 0
            }
            run.append(coord)
            var tmp = 1
            for i in stones.filter({ $0[0] == coord[0] || $0[1] == coord[1] }) {
                tmp += dfs(i)
            }
            return tmp
        }

        for i in stones {
            let tmp = dfs(i)
            if tmp > 0 {
                result += tmp - 1
            }
        }

        return result
    }
}

let sol = Solution()
print(sol.removeStones([[0, 0], [0, 1], [1, 0], [1, 2], [2, 1], [2, 2]]))
print(sol.removeStones([[0, 0], [0, 2], [1, 1], [2, 0], [2, 2]]))
print(sol.removeStones([[0, 0]]))
