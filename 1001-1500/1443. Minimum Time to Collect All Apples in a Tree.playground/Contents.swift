// Bottom-up DFS
class Solution {
    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        var result = 0
        var dictNode = [Int: Int]()
        var ran = Array(repeating: false, count: n)

        // create node
        for i in edges {
            if dictNode[i[1]] != nil {
                dictNode[i[0]] = i[1]
            } else {
                dictNode[i[1]] = i[0]
            }
        }

        // cal route
        func toRoot(_ value: Int) {
            if ran[value] {
                return
            }
            ran[value] = true
            result += 2
            if let root = dictNode[value] {
                toRoot(root)
            }
        }

        // count length if there is an apple
        ran[0] = true
        for (index, apple) in hasApple.enumerated() {
            if apple {
                toRoot(index)
            }
        }

        return result
    }
}

/// Bottom-up BFS
class Solution2 {
    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        // create node
        var dictNode = [Int: Int]()
        for i in edges {
            if dictNode[i[1]] != nil {
                dictNode[i[0]] = i[1]
            } else {
                dictNode[i[1]] = i[0]
            }
        }

        // create bfs
        var hasApple = hasApple
        var list = [Int]()
        var ran = Array(repeating: false, count: n)
        for index in 0 ..< n {
            if hasApple[index] {
                list.append(index)
            }
        }
        while !list.isEmpty {
            for _ in 0 ..< list.count {
                let node = list.removeFirst()
                hasApple[node] = true
                ran[node] = true
                if let parent = dictNode[node], !ran[parent] {
                    list.append(parent)
                }
            }
        }

        // calculate tree height
        let avbl = hasApple.filter { $0 == true }.count
        if avbl == 0 {
            return 0
        } else {
            return (avbl - 1) * 2
        }
    }
}

let sol = Solution()
print(sol.minTime(7, [[0, 1], [0, 2], [1, 4], [1, 5], [2, 3], [2, 6]], [false, false, true, false, true, true, false]))

print(sol.minTime(7, [[0, 1], [0, 2], [1, 4], [1, 5], [2, 3], [2, 6]], [false, false, false, false, false, false, false]))

print(sol.minTime(3, [[0, 2], [0, 3], [1, 2]], [false, true, false, false]))
