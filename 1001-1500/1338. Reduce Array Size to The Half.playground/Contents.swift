class Solution {
    func minSetSize(_ arr: [Int]) -> Int {
        var countDict = [Int: Int]()
        for i in arr {
            countDict[i, default: 0] += 1
        }

        var timeDict = [Int: Int]()
        for i in countDict.values {
            timeDict[i, default: 0] += 1
        }

        var tmp = 0
        var result = 0
        var keys = timeDict.keys.sorted()
        var last = keys.popLast()
        while tmp * 2 < arr.count {
            if let time = last {
                if timeDict[time]! > 0 {
                    tmp += time
                    timeDict[time]! -= 1
                    result += 1
                } else {
                    last = keys.popLast()!
                }
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.minSetSize([3, 3, 3, 3, 5, 5, 5, 2, 2, 7]))
print(sol.minSetSize([7, 7, 7, 7, 7, 7]))
