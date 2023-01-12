class Solution {
    func countSubTrees(_ n: Int, _ edges: [[Int]], _ labels: String) -> [Int] {
        let labels = [Character](labels)
        var dict = [Int: [Int]]()
        var result = Array(repeating: 0, count: n)
        var ran = Array(repeating: false, count: n)

        for i in edges {
            dict[i[1], default: []].append(i[0])
            dict[i[0], default: []].append(i[1])
        }

        func findCount(_ node: Int) -> [Character: Int] {
            if ran[node] {
                return [:]
            }
            ran[node] = true
            var countDict = [labels[node]: 1]
            for i in dict[node] ?? [] {
                countDict = countDict.reduce(into: findCount(i)) { r, e in
                    r[e.0, default: 0] += e.1
                }
            }
            result[node] = countDict[labels[node]]!
            return countDict
        }

        findCount(0)
        return result
    }
}

let sol = Solution()
print(sol.countSubTrees(7, [[0, 1], [0, 2], [1, 4], [1, 5], [2, 3], [2, 6]], "abaedcd"))
print(sol.countSubTrees(4, [[0, 1], [1, 2], [0, 3]], "bbbb"))
print(sol.countSubTrees(5, [[0, 1], [0, 2], [1, 3], [0, 4]], "aabab"))
print(sol.countSubTrees(4, [[0, 2], [0, 3], [1, 2]], "aeed"))
print(sol.countSubTrees(25, [[4, 0], [5, 4], [12, 5], [3, 12], [18, 3], [10, 18], [8, 5], [16, 8], [14, 16], [13, 16], [9, 13], [22, 9], [2, 5], [6, 2], [1, 6], [11, 1], [15, 11], [20, 11], [7, 20], [19, 1], [17, 19], [23, 19], [24, 2], [21, 24]], "hcheiavadwjctaortvpsflssg"))
