class Solution {
    func bestTeamScore(_ scores: [Int], _ ages: [Int]) -> Int {
        typealias Pair = (score: Int, age: Int)
        var list = [Pair]()

        for (index, i) in scores.enumerated() {
            list.append((i, ages[index]))
        }
        list.sort(by: { p1, p2 in
            if p1.age == p2.age {
                return p1.score < p2.score
            } else {
                return p1.age < p2.age
            }
        })

        let total = scores.count
        var dp = Array(repeating: 0, count: total)

        for i in 0 ..< total {
            dp[i] = list[i].score
            for j in 0 ..< i {
                if (list[i].age == list[j].age) || (list[i].age > list[j].age && list[i].score >= list[j].score) {
                    dp[i] = max(dp[i], dp[j] + list[i].score)
                }
            }
        }

        return dp.max() ?? 0
    }
}
