class Solution {
    func maxScoreIndices(_ nums: [Int]) -> [Int] {
        var totalOne = 0
        for i in nums {
            if i == 1 {
                totalOne += 1
            }
        }

        var leftZero = 0
        var maxVal = totalOne
        var maxIndex = [0]
        var index = 1
        for i in nums {
            if i == 0 {
                leftZero += 1
            } else if i == 1 {
                totalOne -= 1
            }
            if maxVal < leftZero + totalOne {
                maxVal = leftZero + totalOne
                maxIndex = [index]
            } else if maxVal == leftZero + totalOne {
                maxIndex.append(index)
            }
            index += 1
        }
        return maxIndex
    }
}
