class Solution {
    func minStoneSum(_ piles: [Int], _ k: Int) -> Int {
        var piles = piles
        var total = piles.reduce(0, +)
        var h = Heap<Int>(comparison: >)
        for i in piles {
            h.enqueue(value: i)
        }

        for _ in 0 ..< k {
            var v = h.dequeue()!
            total -= v / 2
            if v % 2 == 0 {
                h.enqueue(value: v / 2)
            } else {
                h.enqueue(value: (v / 2) + 1)
            }
        }

        return total
    }

    struct Heap<T> where T: Equatable {
        var list = [T]()
        var comparison: (T, T) -> Bool

        // find index
        func leftChild(of index: Int) -> Int {
            2 * index + 1
        }

        func rightChild(of index: Int) -> Int {
            2 * index + 2
        }

        func parentIndex(of index: Int) -> Int {
            // actually, (index-1)/2 is for odd, (index-2)/2 is for even, but they are same result
            (index - 1) / 2
        }

        // compare
        func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
            comparison(list[firstIndex], list[secondIndex])
        }

        func childHigherPriority(parent index: Int) -> Int? {
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
        private mutating func siftUp(index: Int) {
            let parentIndex = parentIndex(of: index)
            if isHigherPriority(at: index, than: parentIndex) {
                list.swapAt(index, parentIndex)
                siftUp(index: parentIndex)
            }
        }

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
    }
}

let sol = Solution()
print(sol.minStoneSum([5, 4, 9], 2))
