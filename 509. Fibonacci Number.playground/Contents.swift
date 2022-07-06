// fully recursive
class Solution {
    func fib(_ n: Int) -> Int {
        if n < 2{
            return n
        }
        return fib(n-1) + fib(n-2)
    }
}

// faster, tmp saved
class Solution2 {
    var dict = [Int: Int]()
    func fib(_ n: Int) -> Int {
        if n < 2{
            return n
        }
        
        if dict[n-1] == nil{
            dict[n-1] = fib(n-1)
        }
        
        if dict[n-2] == nil{
            dict[n-2] = fib(n-2)
        }
        
        return dict[n-1]! + dict[n-2]!
    }
}


