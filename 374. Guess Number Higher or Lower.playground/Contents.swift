class Solution: GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var left = 1, right = n
        while left < right {
            let mid = (left + right) / 2
            let result = guess(mid)
            if result == -1 {
                right = mid
            } else if result == 1 {
                left = mid + 1
            } else {
                return mid
            }
        }
        return left
    }

    /// private method
    //    func guess(_ num: Int) -> Int{
    // inner func, give the guess result
    //        return 0
    //    }
}
