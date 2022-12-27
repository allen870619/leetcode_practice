// second: 20221227
class Solution2 {
    func maximumBags(_ capacity: [Int], _ rocks: [Int], _ additionalRocks: Int) -> Int {
        let total = capacity.count
        var diffRock = Array(repeating: 0, count: total)
        for i in 0 ..< total {
            diffRock[i] = capacity[i] - rocks[i]
        }
        diffRock.sort()

        var remain = additionalRocks, index = 0
        while remain > 0, index < total {
            if remain >= diffRock[index] {
                remain -= diffRock[index]
                diffRock[index] = 0
            } else {
                break
            }
            index += 1
        }
        return diffRock.filter { $0 == 0 }.count
    }
}

// 20220522
class Solution {
    func maximumBags(_ capacity: [Int], _ rocks: [Int], _ additionalRocks: Int) -> Int {
        let total = capacity.count
        var additionalRocks = additionalRocks
        var result = 0
        var diff = [Int]()
        for i in 0 ..< total {
            if capacity[i] - rocks[i] > 0 {
                diff.append(capacity[i] - rocks[i])
            } else {
                result += 1
            }
        }
        diff.sort { $0 > $1 }

        while additionalRocks > 0, !diff.isEmpty {
            let target = diff.popLast()!
            additionalRocks -= target
            if additionalRocks >= 0 {
                result += 1
            }
        }

        return result
    }
}

let sol = Solution()
print(sol.maximumBags([2, 3, 4, 5], [1, 2, 4, 4], 2))
print(sol.maximumBags([10, 2, 2], [2, 2, 0], 100))
