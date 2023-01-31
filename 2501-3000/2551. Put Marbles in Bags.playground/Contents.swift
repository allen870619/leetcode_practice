class Solution {
    func putMarbles(_ weights: [Int], _ k: Int) -> Int {
        let total = weights.count
        var arr = [Int]()

        /// 換方向思考
        ///
        /// 要分k組, 表示要插入k-1塊板子, 插進去後排序最大的前k-1個, 跟最小的前k-1個做相減
        ///
        /// 頭尾因為都會重複計算 所以可以忽略
        /// * x x x O | O x O | O x x * 計算O就好
        for i in 0 ..< total - 1 {
            arr.append(weights[i] + weights[i + 1])
        }
        arr.sort()

        var result = 0
        for i in stride(from: total - 2, to: total - 1 - k, by: -1) {
            result += arr[i]
        }

        for i in 0 ..< k - 1 {
            result -= arr[i]
        }
        return result
    }
}
