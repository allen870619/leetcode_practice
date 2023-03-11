class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var diff = x ^ y
        var result = 0, count = 0

        while diff != 0 {
            if diff % 2 == 1 {
                result += 1
            }
            diff >>= 1
            count += 1
        }
        return result
    }
}
