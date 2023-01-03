class Solution {
    func minDeletionSize(_ strs: [String]) -> Int {
        let colSize = strs.first?.count ?? 0
        let rowSize = strs.count
        let strs = strs.map { [Character]($0) }
        var result = 0

        for i in 0 ..< colSize {
            var last = 0
            for j in 0 ..< rowSize {
                let ascii = Int(strs[j][i].asciiValue ?? 0)
                if last > ascii {
                    result += 1
                    break
                } else {
                    last = ascii
                }
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.minDeletionSize(["cba", "daf", "ghi"]))
