class Solution {
    func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        let arr = arr.sorted()
        var minDis = Int.max
        var result: [[Int]] = []
        for i in 0 ..< arr.count - 1 {
            let dis = arr[i + 1] - arr[i]
            if dis < minDis {
                result.removeAll()
                minDis = dis
            }
            if dis <= minDis {
                result.append([arr[i], arr[i + 1]])
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.minimumAbsDifference([4, 2, 1, 3]))
print(sol.minimumAbsDifference([1, 3, 6, 10, 15]))
print(sol.minimumAbsDifference([3, 8, -10, 23, 19, -4, -14, 27]))
