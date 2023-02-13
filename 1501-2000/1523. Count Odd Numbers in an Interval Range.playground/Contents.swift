class Solution {
    func countOdds(_ low: Int, _ high: Int) -> Int {
        let diff = high - low + 1
        if diff % 2 == 0 {
            return diff / 2
        } else {
            return (low % 2 == 0 ? diff : diff + 1) / 2
        }
    }
}
