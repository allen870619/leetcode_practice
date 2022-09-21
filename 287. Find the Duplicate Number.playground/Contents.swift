class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var arr = Array(repeating: 0, count: 100_002)
        for i in nums {
            if arr[i] == 0 {
                arr[i] = 1
            } else {
                return i
            }
        }
        return -1
    }
}

class Solution2 { // set, fastest
    func findDuplicate(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for i in nums {
            if set.update(with: i) != nil {
                return i
            }
        }
        return -1
    }
}

class Solution3 { // sort
    func findDuplicate(_ nums: [Int]) -> Int {
        var last = 0
        for i in nums.sorted() {
            if i != last {
                last = i
            } else {
                return i
            }
        }
        return -1
    }
}

class Solution4 { // negative mark
    func findDuplicate(_ nums: [Int]) -> Int {
        var nums = nums
        for i in nums {
            let index = abs(i)
            if nums[index] > 0 {
                nums[index] = -nums[index]
            } else {
                return i
            }
        }
        return -1
    }
}
