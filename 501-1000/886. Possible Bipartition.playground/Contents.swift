class Solution {
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        var groupList = Array(repeating: 0, count: n + 1)
        var dict = [Int: [Int]]()

        for i in dislikes {
            dict[i[0], default: []].append(i[1])
            dict[i[1], default: []].append(i[0])
        }

        func dfsFrom(_ group: Int, user: Int) -> Bool {
            if groupList[user] != 0 {
                return groupList[user] == group
            }
            groupList[user] = group
            let nextGroup = group == 1 ? 2 : 1
            var result = true
            for i in dict[user] ?? [] {
                result = result && dfsFrom(nextGroup, user: i)
            }
            return result
        }

        var result = true
        for i in 1 ... n where groupList[i] == 0 {
            result = result && dfsFrom(1, user: i)
        }
        return result
    }
}

let sol = Solution()
print(sol.possibleBipartition(4, [[1, 2], [1, 3], [2, 4]]))
print(sol.possibleBipartition(3, [[1, 2], [1, 3], [2, 3]]))
print(sol.possibleBipartition(5, [[1, 2], [2, 3], [3, 4], [4, 5], [1, 5]]))
print(sol.possibleBipartition(5, [[1, 2], [3, 4], [4, 5], [3, 5]]))
print(sol.possibleBipartition(10, [[2, 7], [4, 10], [4, 7], [1, 3], [4, 9], [4, 6], [2, 9], [4, 8], [4, 5], [2, 8], [2, 10], [1, 5], [1, 8], [2, 6], [1, 6], [1, 9], [1, 7], [1, 10], [2, 3], [2, 5], [3, 4]]))
