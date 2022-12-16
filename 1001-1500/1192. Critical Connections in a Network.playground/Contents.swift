class Solution {
    func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
        var list = Array(repeating: [Int](), count: n)
        for i in connections {
            list[i[0]].append(i[1])
            list[i[1]].append(i[0])
        }

        var lowTimes = Array(repeating: 0, count: n)
        var searched = Array(repeating: false, count: n)
        var result = [[Int]]()

        func dfs(time: Int, next: Int, last: Int) {
            if searched[next] {
                return
            }
            searched[next] = true
            lowTimes[next] = time
            for i in list[next] {
                if i != last {
                    if !searched[i] {
                        dfs(time: time + 1, next: i, last: next)
                    }
                    lowTimes[next] = min(lowTimes[next], lowTimes[i])
                    if time < lowTimes[i] {
                        result.append([next, i])
                    }
                }
            }
        }
        dfs(time: 1, next: 0, last: -1)
        //        print(lowTimes)
        return result
    }
}

let sol = Solution()
print(sol.criticalConnections(5, [[0, 1], [0, 3], [1, 3], [3, 2], [2, 4], [3, 4]]))
print(sol.criticalConnections(4, [[0, 1], [1, 2], [2, 0], [1, 3]]))
print(sol.criticalConnections(5, [[0, 1], [1, 2], [2, 0], [1, 3], [2, 4]]))
print(sol.criticalConnections(2, [[0, 1]]))
print(sol.criticalConnections(6, [[0, 1], [1, 2], [2, 0], [1, 3], [3, 4], [4, 5], [5, 3]]))
