// Time complexity: O(V + E)
class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var dict = [Int: [Int]](), status = Array(repeating: 0, count: numCourses)

        for i in prerequisites {
            dict[i[1], default: []].append(i[0])
        }

        func dfs(target: Int) -> Bool {
            if status[target] == 1 {
                return true
            }
            if status[target] == 2 {
                return false
            }
            status[target] = 1
            for i in dict[target] ?? [] {
                if dfs(target: i) {
                    return true
                }
            }
            status[target] = 2
            return false
        }

        for i in 0 ..< numCourses {
            if dfs(target: i) {
                return false
            }
        }
        return true
    }
}

let sol = Solution()
print(sol.canFinish(2, [[1, 0]]))
print(sol.canFinish(2, [[1, 0], [0, 1]]))
