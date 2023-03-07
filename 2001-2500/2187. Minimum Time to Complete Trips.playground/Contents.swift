class Solution {
    func minimumTime(_ time: [Int], _ totalTrips: Int) -> Int {
        var left = 1, right = (time.last ?? 1) * totalTrips

        while left <= right {
            let mid = (left + right) / 2
            let trip = time.map {
                mid / $0
            }.reduce(0, +)
            if trip < totalTrips {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return left
    }
}
