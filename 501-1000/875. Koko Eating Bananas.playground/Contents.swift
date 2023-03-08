// 20230308
// Time complexity: O(logN)
class Solution2 {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        let piles = piles.sorted()
        var left = 1, right = piles.last!

        while left <= right {
            let mid = (left + right) / 2
            let timeTotal = piles.reduce(0) { res, val in
                var tmp = res + val / mid
                if val % mid != 0 {
                    tmp += 1
                }
                return tmp
            }

            if timeTotal > h {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return left
    }
}

// 20220120
class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        if piles.count == 1 {
            return (piles[0] / h) + (piles[0] % h == 0 ? 0 : 1)
        }
        let sortPile = piles.sorted()
        var dict: [Int: Int] = [:]
        func calCount(_ divide: Int) -> Int {
            if let ans = dict[divide] {
                return ans
            }
            var count = 0
            for i in piles {
                count += (i / divide) + (i % divide == 0 ? 0 : 1)
            }
            dict[divide] = count
            return count
        }

        var leftIndex = 0
        var rightIndex = piles.count - 1
        while leftIndex != rightIndex {
            let centerIndex = (leftIndex + rightIndex) / 2
            let count = calCount(sortPile[centerIndex])
            if count > h {
                leftIndex = centerIndex + 1
            } else {
                rightIndex = centerIndex
            }
        }

        var leftVal = leftIndex == 0 ? 0 : sortPile[leftIndex - 1]
        var rightVal = sortPile[rightIndex]
        while leftVal != rightVal {
            let center = (leftVal + rightVal) / 2
            let count = calCount(center)
            if count > h {
                leftVal = center + 1
            } else {
                rightVal = center
            }
        }
        return leftVal
    }
}

let sol = Solution()
print(sol.minEatingSpeed([3, 6, 7, 11], 8))
print(sol.minEatingSpeed([30, 11, 23, 4, 20], 5))
print(sol.minEatingSpeed([30, 11, 23, 4, 20], 6))
