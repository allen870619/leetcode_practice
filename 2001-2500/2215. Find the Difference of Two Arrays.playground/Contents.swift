class Solution {
    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        var result = Array(repeating: [Int](), count: 2)
        for i in nums1 {
            if !nums2.contains(where: { $0 == i }), !result[0].contains(where: { $0 == i }) {
                result[0].append(i)
            }
        }
        for i in nums2 {
            if !nums1.contains(where: { $0 == i }), !result[1].contains(where: { $0 == i }) {
                result[1].append(i)
            }
        }
        return result
    }
}

class Solution2 { // faster
    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        var set1 = Set(nums1)
        var set2 = Set(nums2)

        var result = Array(repeating: [Int](), count: 2)
        result[0] = Array(set1.subtracting(set2))
        result[1] = Array(set2.subtracting(set1))
        return result
    }
}
