class Solution {
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        let hourAngle = Double(minutes) * 0.5 + Double((hour % 12) * 30)
        let minAngle = Double(minutes) * 6
        let angle = abs(hourAngle - minAngle)
        return min(angle, 360 - angle)
    }
}

let sol = Solution()
print(sol.angleClock(12, 30))
