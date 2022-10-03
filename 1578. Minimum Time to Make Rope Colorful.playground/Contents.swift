class Solution { // better
    func minCost(_ colors: String, _ neededTime: [Int]) -> Int {
        let colors = [Character](colors)
        var lastColor: Character?
        var maxT = 0, result = 0

        for (index, i) in colors.enumerated() {
            if lastColor != i {
                lastColor = i
                result -= maxT
                maxT = neededTime[index]
            } else {
                maxT = max(maxT, neededTime[index])
            }
            result += neededTime[index]
        }
        return result - maxT
    }
}

class Solution2 {
    func minCost(_ colors: String, _ neededTime: [Int]) -> Int {
        let colors = [Character](colors)
        var result = 0
        var lastColor: Character?
        var maxTime = 0
        var tmpTime = 0

        for (index, i) in colors.enumerated() {
            if lastColor != i {
                lastColor = i
                if index > 1, colors[index - 1] == colors[index - 2] {
                    result += tmpTime - maxTime
                }
                maxTime = neededTime[index]
            } else {
                maxTime = max(maxTime, neededTime[index])
            }
            tmpTime = neededTime[index]
        }
        if colors[colors.count - 1] == colors[colors.count - 2] {
            result += tmpTime - maxTime
        }
        return result
    }
}

let sol = Solution()
print(sol.minCost("abaac", [1, 2, 3, 4, 5]))
print(sol.minCost("aabaa", [1, 2, 3, 4, 1]))
print(sol.minCost("a", [1]))
