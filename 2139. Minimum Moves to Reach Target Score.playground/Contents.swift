class Solution {
    func minMoves(_ t: Int, _ maxDoubles: Int) -> Int {
        if maxDoubles == 0 {
            return t - 1
        }
        if t == 1 {
            return 0
        }
        var count = 0
        var target = t
        for i in 0 ..< maxDoubles {
            while target % 2 != 0 {
                target -= 1
                count += 1
            }
            target /= 2
            count += 1
            if target == 1 {
                return count
            }
        }
        count += (target - 1)
        return count
    }
}

let sol = Solution()
print(sol.minMoves(5, 0)) // 4
print(sol.minMoves(19, 2)) // 7
print(sol.minMoves(10, 4)) // 4
print(sol.minMoves(1, 100)) // 0
