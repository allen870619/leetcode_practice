class Solution2 { // better
    func totalFruit(_ fruits: [Int]) -> Int {
        var left = 0, right = 0
        var rightConst = 0
        var count = 0
        var result = 0

        for fruit in fruits {
            count = (left == fruit || right == fruit) ? count + 1 : rightConst + 1
            rightConst = fruit == right ? rightConst + 1 : 1

            if fruit != right {
                left = right
                right = fruit
            }
            result = max(result, count)
        }
        return result
    }
}

class Solution {
    func totalFruit(_ fruits: [Int]) -> Int {
        if fruits.count == 0 {
            return 0
        }

        var map = [fruits[0]: 1]
        var pointer = [fruits[0]: 0]
        var type1 = fruits[0], type2 = fruits[0]
        var result = 1

        for i in 1 ..< fruits.count {
            if fruits[i] != type1, type2 != fruits[i] {
                if type1 == type2 {
                    type2 = fruits[i]
                } else {
                    map[fruits[i - 1]] = abs(pointer[type1]! - pointer[type2]!)
                    if fruits[i - 1] == type1 {
                        map.removeValue(forKey: type2)
                        type2 = type1
                        type1 = fruits[i]
                    } else {
                        map.removeValue(forKey: type1)
                        type1 = type2
                        type2 = fruits[i]
                    }
                }
            }
            pointer[fruits[i]] = i
            map[fruits[i], default: 0] += 1

            if type1 == type2 {
                result = max(result, map[type2]!)
            } else {
                result = max(result, map[type1]! + map[type2]!)
            }
        }

        return result
    }
}

let sol = Solution2()

print(sol.totalFruit([1, 2, 1]))
print(sol.totalFruit([0, 1, 2, 2]))
print(sol.totalFruit([1, 2, 3, 2, 2]))
print(sol.totalFruit([1, 1, 1, 5, 1, 1, 1]))
print(sol.totalFruit([1, 0, 1, 4, 1, 4, 1, 2, 3]))
