class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var list = [[Int]]()
        func cal(_ curK: Int, last: Int, tmp: [Int], tmpTotal: Int) {
            if last == 9 {
                return
            }
            for i in last + 1 ... 9 {
                if curK == k {
                    if tmpTotal + i == n {
                        list.append(tmp + [i])
                    }
                } else {
                    cal(curK + 1, last: i, tmp: tmp + [i], tmpTotal: tmpTotal + i)
                }
            }
        }
        cal(1, last: 0, tmp: [], tmpTotal: 0)
        return list
    }
}

let sol = Solution()
print(sol.combinationSum3(3, 7))
print(sol.combinationSum3(3, 9))
print(sol.combinationSum3(4, 1))
print(sol.combinationSum3(5, 20))
