class Solution {
    func countOrders(_ n: Int) -> Int {
        var pickup = 1
        var delivery = 1
        for i in 1...n{
            pickup = pickup * i % 1000000007
            delivery = delivery * (i * 2 - 1) % 1000000007
        }
        return pickup * delivery % 1000000007
    }
}

let sol = Solution()
print(sol.countOrders(1))
print(sol.countOrders(2))
print(sol.countOrders(3))
print(sol.countOrders(4))
print(sol.countOrders(18))
