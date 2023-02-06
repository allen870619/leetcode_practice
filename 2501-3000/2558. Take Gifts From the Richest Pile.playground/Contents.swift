import Foundation

class Solution {
    func pickGifts(_ gifts: [Int], _ k: Int) -> Int {
        let total = gifts.count
        var gifts = gifts
        for _ in 0 ..< k {
            gifts.sort()
            gifts[total - 1] = Int(floor(sqrt(Double(gifts[total - 1]))))
        }
        return gifts.reduce(0, +)
    }
}
