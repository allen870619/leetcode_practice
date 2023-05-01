class Solution {
    func average(_ salary: [Int]) -> Double {
        var minS = 1_000_000, maxS = 0
        var result = 0.0, count = 0
        for i in salary {
            count += 1
            minS = min(minS, i)
            maxS = max(maxS, i)
            result += Double(i)
        }

        result = result - Double(minS + maxS)
        return result / Double(count - 2)
    }
}
