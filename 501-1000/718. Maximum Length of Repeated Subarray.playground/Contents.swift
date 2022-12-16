class Solution {
    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var tmpLen: [[Int?]] = Array(repeating: Array(repeating: nil, count: nums2.count), count: nums1.count)
        var indexList = [Int: [Int]]()
        var result = 0

        for (jIndex, j) in nums2.enumerated() {
            indexList[j, default: []].append(jIndex)
        }
        for (iIndex, i) in nums1.enumerated() {
            if let nums2List = indexList[i] {
                for jIndex in nums2List {
                    result = max(result, checkLength(iIndex, jIndex))
                }
            }
        }

        func checkLength(_ iIndex: Int, _ jIndex: Int) -> Int {
            if iIndex >= nums1.count || jIndex >= nums2.count {
                return 0
            }
            if let save = tmpLen[iIndex][jIndex] {
                return save
            }
            if nums1[iIndex] == nums2[jIndex] {
                let tmp = checkLength(iIndex + 1, jIndex + 1) + 1
                tmpLen[iIndex][jIndex] = tmp
                return tmp
            } else {
                return 0
            }
        }
        return result
    }
}

class Solution2 { // Better
    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var save = Array(repeating: Array(repeating: 0, count: nums2.count + 1), count: nums1.count + 1)
        var result = 0

        for i in 1 ... nums1.count {
            for j in 1 ... nums2.count {
                if nums1[i - 1] == nums2[j - 1] {
                    save[i][j] = save[i - 1][j - 1] + 1
                    result = max(result, save[i][j])
                }
            }
        }
        return result
    }
}

let sol = Solution2()
print(sol.findLength([1, 2, 3, 2, 1], [3, 2, 1, 4, 7]))
print(sol.findLength([0, 0, 0, 0, 0], [0, 0, 0, 0, 0]))
print(sol.findLength([0, 1, 1, 1, 1], [1, 0, 1, 0, 1]))
