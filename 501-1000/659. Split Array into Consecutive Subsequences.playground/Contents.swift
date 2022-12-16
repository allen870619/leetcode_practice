class Solution {
    func isPossible(_ nums: [Int]) -> Bool {
        var lastDict = [Int: [Int]]()
        var arr = [[Int]]()
        for i in nums {
            var len = Int.max
            var targetIndex = -1

            if let list = lastDict[i - 1] {
                var tmp = 0
                for (index, arrIndex) in list.enumerated() {
                    if arr[arrIndex].count < len {
                        len = arr[arrIndex].count
                        targetIndex = arrIndex
                        tmp = index
                    }
                }

                lastDict[i - 1]?.remove(at: tmp)
                if lastDict[i - 1]?.isEmpty ?? false {
                    lastDict[i - 1] = nil
                }
                lastDict[i, default: []].append(targetIndex)
                arr[targetIndex].append(i)
            } else {
                arr.append([i])
                lastDict[i, default: []].append(arr.count - 1)
            }
        }

        for i in arr {
            if i.count < 3 {
                return false
            }
        }

        return true
    }
}

let sol = Solution()
print(sol.isPossible([1, 2, 3, 3, 4, 5]))
print(sol.isPossible([1, 2, 3, 3, 4, 4, 5, 5]))
print(sol.isPossible([1, 2, 3, 4, 4, 5]))
print(sol.isPossible([1, 2, 3]))
print(sol.isPossible([1, 2, 3, 4, 6, 7, 8, 9, 10, 11]))
print(sol.isPossible([1, 2, 3, 4, 5, 5, 6, 7]))
print(sol.isPossible([4, 5, 6, 6, 7, 8, 9, 10, 10, 11]))
