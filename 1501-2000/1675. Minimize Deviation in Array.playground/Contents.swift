// 20230224
class Solution2 {
    func minimumDeviation(_ nums: [Int]) -> Int {
        var pq = PriorityQueue<Int>(comparison: >)
        var mini = Int.max
        for i in nums {
            mini = min(mini, i % 2 == 0 ? i : i * 2)
            pq.enqueue(value: i % 2 == 0 ? i : i * 2)
        }

        var result = Int.max
        while (pq.peek() ?? 1) % 2 == 0 {
            let v = pq.dequeue()! / 2
            pq.enqueue(value: v)
            if v < mini {
                mini = v
            }
            result = min(result, (pq.peek() ?? Int.max) - mini)
        }
        return result
    }
}

struct PriorityQueue<T> where T: Equatable {
    var list = [T]()
    var comparison: (T, T) -> Bool

    // find index
    private func leftChild(of index: Int) -> Int {
        2 * index + 1
    }

    private func rightChild(of index: Int) -> Int {
        2 * index + 2
    }

    private func parentIndex(of index: Int) -> Int {
        // actually, (index-1)/2 is for odd, (index-2)/2 is for even, but they are same result
        (index - 1) / 2
    }

    // compare
    private func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        comparison(list[firstIndex], list[secondIndex])
    }

    /// compare parent, left child and right child.
    ///
    /// If parent's priority is highest, if will return `nil`, otherwise return higher index
    private func childHigherPriority(parent index: Int) -> Int? {
        let left = leftChild(of: index)
        let right = rightChild(of: index)
        let total = list.count

        if left < total, right < total {
            if isHigherPriority(at: left, than: index) || isHigherPriority(at: right, than: index) {
                return isHigherPriority(at: left, than: right) ? left : right
            } else {
                return nil
            }
        } else if left < total {
            return isHigherPriority(at: left, than: index) ? left : nil
        } else if right < total {
            return isHigherPriority(at: right, than: index) ? right : nil
        }
        return nil
    }

    // sift: up(enqueue) and down(dequeue)
    // enqueue
    private mutating func siftUp(index: Int) {
        let parentIndex = parentIndex(of: index)
        if isHigherPriority(at: index, than: parentIndex) {
            list.swapAt(index, parentIndex)
            siftUp(index: parentIndex)
        }
    }

    // dequeue
    private mutating func siftDown(index: Int) {
        if let child = childHigherPriority(parent: index) {
            list.swapAt(child, index)
            siftDown(index: child)
        }
    }

    // get data
    mutating func enqueue(value: T) {
        list.append(value)
        siftUp(index: list.count - 1)
    }

    mutating func dequeue() -> T? {
        if list.isEmpty {
            return nil
        }

        let tmp = list[0]
        list.swapAt(list.count - 1, 0)
        list.removeLast()
        siftDown(index: 0)
        return tmp
    }

    func peek() -> T? {
        list.first
    }
}

// 20220219
class Solution {
    func minimumDeviation(_ nums: [Int]) -> Int {
        var set = [Int]()
        for num in nums {
            let val = num * (num % 2 == 1 ? 2 : 1)
            set.append(val)
        }
        set.sort()

        var result = set.last! - set.first!
        while set.last! % 2 == 0 {
            insert(arr: &set, set.last! / 2)
            set.removeLast()
            result = min(result, set.last! - set.first!)
        }

        return result
    }

    func insert(arr: inout [Int], _ target: Int) {
        if arr.isEmpty {
            arr.append(target)
            return
        }

        var left = 0
        var right = arr.count - 1
        while left < right {
            var mid = (left + right) / 2
            if arr[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }

        if arr[left] == target {
            return
        } else if arr[left] < target {
            arr.insert(target, at: left + 1)
        } else {
            arr.insert(target, at: left)
        }
    }
}

class Solution2 { // TLE
    func minimumDeviation(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for num in nums {
            let val = num * (num % 2 == 1 ? 2 : 1)
            set.insert(val)
        }

        var result = set.max()! - set.min()!
        while set.max()! % 2 == 0 {
            let maxD = set.max()!
            set.remove(maxD)
            set.insert(maxD / 2)
            result = min(result, set.max()! - set.min()!)
        }

        return result
    }
}

let sol = Solution()
print(sol.minimumDeviation([1, 2, 3, 4]))
print(sol.minimumDeviation([4, 1, 5, 20, 3]))
print(sol.minimumDeviation([2, 10, 8]))
print(sol.minimumDeviation([16, 6]))
print(sol.minimumDeviation([3, 5]))
print(sol.minimumDeviation([610, 778, 846, 733, 395]))
