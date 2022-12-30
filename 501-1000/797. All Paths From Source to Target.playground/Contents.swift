class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var list = [[Int]]()
        let lastElement = graph.count - 1

        func loop(_ index: Int, tmp: [Int]) {
            if index == lastElement {
                list.append(tmp)
                return
            }

            if graph[index].isEmpty {
                return
            }

            for i in graph[index] {
                loop(i, tmp: tmp + [i])
            }
        }

        loop(0, tmp: [0])
        return list
    }
}

let sol = Solution()
print(sol.allPathsSourceTarget([[1, 2], [3], [3], []]))
print(sol.allPathsSourceTarget([[4, 3, 1], [3, 2, 4], [3], [4], []]))
print(sol.allPathsSourceTarget([[4, 3, 1], [3, 2, 4], [], [4], []]))
print(sol.allPathsSourceTarget([[2], [], [1]]))
