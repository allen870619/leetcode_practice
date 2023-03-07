class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var visited = [Int]()
        var dict = [Int: [Int]]()
        var ran = Array(repeating: 0, count: numCourses)

        for i in prerequisites {
            dict[i[1], default: []].append(i[0])
            if dict[i[0]]?.contains(i[1]) ?? false {
                return []
            }
        }

        // if loop return true
        func findRoute(target: Int) -> Bool {
            if ran[target] == 1 {
                return true
            }
            if ran[target] == 2 {
                return false
            }

            ran[target] = 1
            for i in dict[target] ?? [] {
                if findRoute(target: i) {
                    return true
                }
            }

            ran[target] = 2
            visited.append(target)
            return false
        }

        for i in 0 ..< numCourses {
            if findRoute(target: i) {
                return []
            }
        }

        return visited.reversed()
    }
}
