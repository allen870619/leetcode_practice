class Solution {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var left = weights.max()!, right = weights.reduce(0, +)

        while left < right {
            let mid = (left + right) / 2

            var count = 0, tmp = 0
            for i in weights {
                if tmp + i >= mid {
                    tmp = (tmp + i == mid) ? 0 : i
                    count += 1
                } else {
                    tmp += i
                }
            }
            count += tmp != 0 ? 1 : 0

            if count > days {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return right
    }
}

let sol = Solution()
print(sol.shipWithinDays([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 5))
