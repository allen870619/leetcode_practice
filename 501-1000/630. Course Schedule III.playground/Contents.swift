// 20230308
// Time complexity: O(N^2) + O(NlogN)
class Solution2 {
    func scheduleCourse(_ courses: [[Int]]) -> Int {
        var courses = courses.sorted(by: { $0[1] < $1[1] })
        var result = 0, totalDay = 0
        for i in 0 ..< courses.count {
            if totalDay + courses[i][0] <= courses[i][1] {
                result += 1
                totalDay += courses[i][0]
            } else {
                var maxIndex = i
                for j in 0 ..< i {
                    if courses[j][0] > courses[maxIndex][0] {
                        maxIndex = j
                    }
                }

                totalDay += courses[i][0] - courses[maxIndex][0]
                courses[maxIndex][0] = -1
            }
        }
        return result
    }
}

// 20220123
class Solution {
    func scheduleCourse(_ courses: [[Int]]) -> Int {
        var newCourses = courses.sorted { $0[1] < $1[1] }
        var totalDay = 0, result = 0
        for i in 0 ..< newCourses.count {
            if totalDay + newCourses[i][0] <= newCourses[i][1] {
                result += 1
                totalDay += newCourses[i][0]
            } else {
                var index = i
                for j in 0 ..< i {
                    if newCourses[j][0] > newCourses[index][0] {
                        index = j
                    }
                }
                if newCourses[index][0] > newCourses[i][0] {
                    totalDay += newCourses[i][0] - newCourses[index][0]
                }
                newCourses[index][0] = -1
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.scheduleCourse([[100, 200], [200, 1300], [1000, 1250], [2000, 3200]]))
print(sol.scheduleCourse([[1, 2]]))
print(sol.scheduleCourse([[3, 2], [4, 3]]))
print(sol.scheduleCourse([[5, 15], [3, 19], [6, 7], [2, 10], [5, 16], [8, 14], [10, 11], [2, 19]]))
print(sol.scheduleCourse([[5, 5], [4, 6], [2, 6]]))
print(sol.scheduleCourse([[5, 7], [3, 5], [10, 18], [4, 16], [10, 14]]))
