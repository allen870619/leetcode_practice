// second try, slower, less memory
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        for i in 0..<k{
            nums.insert(nums.popLast()!, at: 0)
        }
    }
}

// first try, faster, more memory
class Solution2 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var tmpArr: [Int] = []
        var index = nums.count - k % nums.count
        for i in 0..<nums.count{
            index -= index >= nums.count ? nums.count : 0
            tmpArr.append(nums[index])
            index += 1
        }
        nums = tmpArr
    }
}
