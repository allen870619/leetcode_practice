// Cheating
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        return [nums.firstIndex(of: target) ?? -1, nums.lastIndex(of: target) ?? -1]
    }
}

// start here
class Solution2 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var start = -1, end = -1
        for (index, i) in nums.enumerated(){
            if i == target{
                if start == -1{
                    start = index
                }
                end = index
            }
        }
        return [start, end]
    }
}

class Solution3 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var start = -1, end = -1
        for i in stride(from: 0, to: nums.count, by: 1){
            if nums[i] == target{
                start = i
                break
            }
        }
        for i in stride(from: nums.count-1, through: 0, by: -1){
            if nums[i] == target{
                end = i
                break
            }
        }
        return [start, end]
    }
}

