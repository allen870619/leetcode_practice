class Solution { // TLE, top-down
    func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var dict = [Int: [Int]]()

        for i in edges {
            dict[i[0], default: []].append(i[1])
            dict[i[1], default: []].append(i[0])
        }

        var tmpFind = Array(repeating: false, count: n)
        func findTotal(target: Int, step: Int) -> Int {
            tmpFind[target] = true
            var tmp = step
            for i in dict[target] ?? [] {
                if !tmpFind[i] {
                    tmp += findTotal(target: i, step: step + 1)
                }
            }
            return tmp
        }

        var result = [Int]()
        for i in 0 ..< n {
            tmpFind = Array(repeating: false, count: n)
            result.append(findTotal(target: i, step: 0))
        }

        return result
    }
}

class Solution2 { // TLE, bottom up
    func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var dict = [Int: [Int]]()
        var result = [Int]()
        for i in edges {
            dict[i[0], default: []].append(i[1])
            dict[i[1], default: []].append(i[0])
        }

        var saved = [Int: Int]()
        func findMin(target: Int, end: Int, finded: [Int]) -> Int {
            if let s = saved[target] {
                return s
            }
            if target == end {
                return 0
            }
            var tmp = n
            for i in dict[target] ?? [] where !finded.contains(i) {
                let a = findMin(target: i, end: end, finded: finded + [i]) + 1
                tmp = min(tmp, a)
            }
            if tmp != n {
                saved[target] = tmp
            }
            return tmp
        }

        for i in 0 ..< n {
            saved.removeAll()
            var t = 0
            for j in 0 ..< n where i != j {
                t += findMin(target: j, end: i, finded: [j])
            }
            result.append(t)
        }
        return result
    }
}

let sol = Solution()
print(sol.sumOfDistancesInTree(6, [[0, 1], [0, 2], [2, 3], [2, 4], [2, 5]]))
print(sol.sumOfDistancesInTree(2, [[1, 0]]))
