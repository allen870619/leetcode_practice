class Solution {
    struct Task: Equatable {
        var index: Int
        var start: Int
        var duration: Int

        static func == (_ lhs: Task, _ rhs: Task) -> Bool {
            lhs.index == rhs.index
        }
    }

    func getOrder(_ tasks: [[Int]]) -> [Int] {
        // list init
        var list = [Task]()
        for (index, i) in tasks.enumerated() {
            list.append(Task(index: index, start: i[0], duration: i[1]))
        }
        list.sort(by: { $0.start < $1.start
                || $0.start == $1.start && $0.duration < $1.duration
        })

        // heap
        var result = [Int]()
        var heap = Heap<Task>(comparison: { l, r -> Bool in
            l.duration < r.duration || (l.duration == r.duration && l.index < r.index)
        })

        var avblUntil = 0
        for task in list {
            while !heap.isEmpty(), avblUntil < task.start {
                let t = heap.dequeue()!
                result.append(t.index)
                avblUntil = max(avblUntil, t.start) + t.duration
            }
            heap.enqueue(value: task)
        }

        while !heap.isEmpty() {
            result.append(heap.dequeue()!.index)
        }

        return result
    }

    struct Heap<T> where T: Equatable {
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

        func isEmpty() -> Bool {
            list.isEmpty
        }

        func peek() -> T? {
            list.first
        }
    }
}

let sol = Solution()
print(sol.getOrder([[1, 2], [2, 4], [3, 2], [4, 1]]))
print(sol.getOrder([[7, 10], [7, 12], [7, 5], [7, 4], [7, 2]]))
print(sol.getOrder([[19, 13], [16, 9], [21, 10], [32, 25], [37, 4], [49, 24], [2, 15], [38, 41], [37, 34], [33, 6], [45, 4], [18, 18], [46, 39], [12, 24]]))
print(sol.getOrder([[35, 36], [11, 7], [15, 47], [34, 2], [47, 19], [16, 14], [19, 8], [7, 34], [38, 15], [16, 18], [27, 22], [7, 15], [43, 2], [10, 5], [5, 4], [3, 11]]))
