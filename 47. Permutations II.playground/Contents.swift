class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var set = Set<[Int]>()
        func addData(remain: [Int], tmp: [Int]) {
            if set.contains(tmp) {
                return
            }
            set.insert(tmp)
            if remain.count == 0 {
                result.append(tmp)
                return
            }
            for (index, i) in remain.enumerated() {
                var r = remain
                r.remove(at: index)
                addData(remain: r, tmp: tmp + [i])
            }
        }
        addData(remain: nums, tmp: [])
        return result
    }
}

let sol = Solution()
print(sol.permuteUnique([1, 2, 3, 4]))
print(sol.permuteUnique([1, 1, 1, 1, 1, 1, 2]))
print(sol.permuteUnique([1, 2, 3, 4, 5]))
