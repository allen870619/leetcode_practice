class KthLargest {
    var nums = [Int]()
    var k = 0
    var count = 0

    init(_ k: Int, _ nums: [Int]) {
        self.nums = nums.sorted()
        self.k = k
        count = nums.count
    }

    func add(_ val: Int) -> Int {
        nums.append(val)
        nums.sort()
        count += 1
        return nums[count - k]
    }
}

class KthLargest2 {
    var nums = [Int]()
    var k = 0

    init(_ k: Int, _ nums: [Int]) {
        self.nums = nums.sorted()
        self.k = k
    }

    func add(_ val: Int) -> Int {
        nums.append(val)
        nums.sort()
        return nums[k - 1]
    }

    private func qsort(_ arr: [Int]) -> [Int] {
        if arr.count <= 1 {
            return arr
        }
        let pivot = arr.first!
        var left = [Int]()
        var right = [Int]()
        for i in arr[1...] {
            if i >= pivot {
                left.append(i)
            } else {
                right.append(i)
            }
        }
        return qsort(left) + [pivot] + qsort(right)
    }
}
