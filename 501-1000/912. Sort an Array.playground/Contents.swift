class Solution { // merge sort
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 {
            return nums
        }

        let total = nums.count - 1

        // divide
        var left = sortArray(Array(nums[0 ... total / 2]))
        var right = sortArray(Array(nums[(total / 2) + 1 ... total]))

        // conquer
        var tmp = [Int]()
        while !(left.isEmpty && right.isEmpty) {
            if left.first ?? Int.max < right.first ?? Int.max {
                tmp.append(left.removeFirst())
            } else {
                tmp.append(right.removeFirst())
            }
        }
        return tmp
    }
}

class Solution2 { // quick sort
    func sortArray(_ nums: [Int]) -> [Int] {
        var nums = nums
        quickSort(nums: &nums, left: 0, right: nums.count - 1)
        return nums
    }

    private func quickSort(nums: inout [Int], left: Int, right: Int) {
        if left >= right {
            return
        }
        var l = left, r = right, ref = nums[left]
        while l != r {
            while nums[r] > ref, l < r {
                r -= 1
            }
            while nums[l] <= ref, l < r {
                l += 1
            }
            if l < r {
                nums.swapAt(l, r)
            }
        }
        nums.swapAt(left, l)

        quickSort(nums: &nums, left: left, right: l - 1)
        quickSort(nums: &nums, left: l + 1, right: right)
    }
}

let sol = Solution2()
print(sol.sortArray([5, 2, 3]))
print(sol.sortArray([5, 1, 1, 2, 0, 0]))
