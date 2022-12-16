class Solution {
    func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
        let minX = min(rec1[0], rec2[0])
        let maxX = max(rec1[2], rec2[2])
        let minY = min(rec1[1], rec2[1])
        let maxY = max(rec1[3], rec2[3])
        let w1 = rec1[2] - rec1[0], h1 = rec1[3] - rec1[1]
        let w2 = rec2[2] - rec2[0], h2 = rec2[3] - rec2[1]
        return (maxX - minX - w1 - w2 < 0) && (maxY - minY - h1 - h2 < 0)
    }
}
