class Solution {
    func commonFactors(_ a: Int, _ b: Int) -> Int {
        var result = 0
        for i in 1 ... min(a, b) {
            if a % i == 0, b % i == 0 {
                result += 1
            }
        }
        return result
    }
}
