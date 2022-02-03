//
//  main.swift
//  LeetCodeTestSwift
//
//  Created by Jash on 2020/7/11.
//  Copyright © 2020 Jash. All rights reserved.
//

import Foundation

print("Hello, World!")
let begin = Date().timeIntervalSince1970
let value = Solution().countGoodRectangles([[2,3],[3,7],[4,3],[3,7]])
print("result \(value)")

let end = Date().timeIntervalSince1970
print("time consumed \((end - begin)) s")



//class Solution {
//    func PredictTheWinner(_ nums: [Int]) -> Bool {
//        if nums.count % 2 == 0 {
//            return true
//        }
//        var head = 0
//        var tail = nums.count - 1
//
//        return false
//    }
//
//    func findMaxGap(_ head: Int, _ tail: Int, _ nums: [Int]) -> Int {
//
//
//        return 0
//    }
//}

// MARK: ⚠️⚠️⚠️LeetCode 未解决
/*
// MARK: 982. 按位与为零的三元组
// https://leetcode-cn.com/problems/triples-with-bitwise-and-equal-to-zero/
class Solution {
    func countTriplets(_ nums: [Int]) -> Int {

    }
}
 */

/*
// MARK:  486. 预测赢家
// https://leetcode-cn.com/problems/predict-the-winner/
class Solution {
    func PredictTheWinner(_ nums: [Int]) -> Bool {
        if nums.count % 2 == 0 {
            return true
        }
        var head = 0
        var tail = nums.count - 1

        return false
    }

    func findMaxGap(_ head: Int, _ tail: Int, _ nums: [Int]) -> Int {


        return 0
    }
}
 */

/*
// MARK: 4. 寻找两个正序数组的中位数
// https://leetcode-cn.com/problems/median-of-two-sorted-arrays/
class Question4 {
    func solve() {
        
    }
}
 */

/*
// MARK: 3. 无重复字符的最长子串
// https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/
class Question3 {
    func solve() {
        var str = "abcdefghijklmnopqrstuvwxyz"
        str.append("bcdefghijklmnopqrstuvwxyz")
        str.append("cdefghijklmnopqrstuvwxyz")
        str.append("defghijklmnopqrstuvwxyz")
        str.append("efghijklmnopqrstuvwxyz")
        str.append("fghijklmnopqrstuvwxyz")
        str.append("ghijklmnopqrstuvwxyz")
        str.append("hijklmnopqrstuvwxyz")
        let begin = Date().timeIntervalSince1970
        let result = lengthOfLongestSubstring1(str)
        let end = Date().timeIntervalSince1970
        let time = (end - begin) * 1000
        print("\(result), time \(time) ms");
    }
    
    // jash to do 算法有问题, 形如 ..a,,,,a 只能统计到 a,,,,a这部分, 而无法校验 .. 和 ,,,, 之间有没有重复
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        var maxLength = 0
        var maxLengthBeginIndex = 0;
        var dic: [Character: Int] = [:]
        var index = 0
        for ch in s {
            if let value = dic[ch] {
                let length = index - value
                if length > maxLength && value > maxLengthBeginIndex {
                    print(".... \(index), \(ch), \(length)")
                    maxLength = length
                    maxLengthBeginIndex = value
                }
            }
            dic[ch] = index
            index += 1
        }
        return maxLength
    }
    
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        var maxLength = 0
        for i in 0..<s.count {
            // 逐个取子字符串
            let currentString = s.suffix(s.count - i)
            var currentContainer = ""
            for ch in currentString {
                if (currentContainer.contains(ch)) {
                    break
                } else {
                    currentContainer.append(ch)
                }
            }
            if currentContainer.count > maxLength {
                maxLength = currentContainer.count
            }
            
        }
        return maxLength
    }
}
 */

// MARK: ⚠️⚠️⚠️LeetCode 已解决-简单
/*
// MARK: 1725. 可以形成最大正方形的矩形数目
// https://leetcode-cn.com/problems/number-of-rectangles-that-can-form-the-largest-square/
class Solution {
    func countGoodRectangles(_ rectangles: [[Int]]) -> Int {
        var map: [Int: Int] = [:]
        for rect in rectangles {
            let length = min(rect[0], rect[1])
            if let value = map[length] {
                map[length] = value + 1
            } else {
                map[length] = 1
            }
        }
        var maxKey: Int = 0
        for k in map.keys {
            maxKey = max(maxKey, k)
        }
        return map[maxKey] ?? 0
    }
}
 */

/*
// MARK: 395. 至少有 K 个重复字符的最长子串
// https://leetcode-cn.com/problems/longest-substring-with-at-least-k-repeating-characters/
class Solution {
    func uncommonFromSentences(_ s1: String, _ s2: String) -> [String] {
        var map1: [String: Int] = [:]
        var map2: [String: Int] = [:]
        for str in s1.components(separatedBy: " ") {
            if let value = map1[str] {
                map1[str] = value + 1
            } else {
                map1[str] = 1
            }
        }
        for str in s2.components(separatedBy: " ") {
            if let value = map2[str] {
                map2[str] = value + 1
            } else {
                map2[str] = 1
            }
        }
        var result: [String] = []
        for k in map1.keys {
            if map1[k] == 1 && map2[k] == nil {
                result.append(k)
            }
        }
        for k in map2.keys {
            if map2[k] == 1 && map1[k] == nil {
                result.append(k)
            }
        }
        return result
    }
}
 */

/*
// MARK: 1763. 最长的美好子字符串
// https://leetcode-cn.com/problems/longest-nice-substring/
class Solution {
    func longestNiceSubstring(_ s: String) -> String {
        var chs: [Character] = []
        chs.append(contentsOf: s)
        
        var result = ""
        for i in 0..<s.count {
            for j in i+1..<s.count {
                if j-i+1 > result.count {
                    var chSet: Set<Character> = []
                    var upperSet: Set<Character> = []
                    for k in i...j {
                        let ch = chs[k]
                        chSet.insert(ch)
                        upperSet.insert(ch.uppercased().first!)
                    }
                    if chSet.count == upperSet.count * 2 {
                        let curChs = Array(chs[i...j])
                        var curResult = ""
                        curResult.append(contentsOf: curChs)
                        result = curResult
                    }
                }
            }
        }
        return result
    }
}
 */

/*
// MARK: 2000. 反转单词前缀
// https://leetcode-cn.com/problems/reverse-prefix-of-word/
class Solution {
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        var chs: [Character] = []
        var hasReversed = false
        for wch in word {
            chs.append(wch)
            if !hasReversed  && wch == ch {
                chs.reverse()
                hasReversed = true
            }
        }
        var str = ""
        str.append(contentsOf: chs)
        return str
    }
}
 */

/*
// MARK: 1342. 将数字变成 0 的操作次数
// https://leetcode-cn.com/problems/number-of-steps-to-reduce-a-number-to-zero/
class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var num = num
        var steps = 0
        while num != 0 {
            if num % 2 == 1 {
                num -= 1
            } else {
                num /= 2
            }
            steps += 1
        }
        return steps
    }
}
 */

/*
// MARK: 747. 至少是其他数字两倍的最大数
// https://leetcode-cn.com/problems/largest-number-at-least-twice-of-others/
class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        var firstBig: Int = 0
        var firstBigIdx: Int = 0
        var secondBig: Int = 0
        for i in 0..<nums.count {
            let num = nums[i]
            if num > firstBig {
                secondBig = firstBig
                firstBig = num
                firstBigIdx = i
            } else if num > secondBig {
                secondBig = num
            }
        }
        if firstBig >= secondBig * 2 {
            return firstBigIdx
        }
        return -1
    }
}
 */

/*
// MARK: 1629. 按键持续时间最长的键
// https://leetcode-cn.com/problems/slowest-key/
class Solution {
    func slowestKey(_ releaseTimes: [Int], _ keysPressed: String) -> Character {
        var maxTime: Int = 0
        var maxChar: Character = "a"
        var index: Int = 0
        for ch in keysPressed {
            let time = index > 0 ? releaseTimes[index] - releaseTimes[index - 1] : releaseTimes[index]
            if time > maxTime {
                maxTime = time
                maxChar = ch
            } else if time == maxTime {
                maxChar = biggerCharacter(charA: maxChar, charB: ch)
            }
            index += 1
        }
        return maxChar
    }
    
    // b>a, c>b, d>c, ...
    func biggerCharacter(charA: Character, charB: Character) -> Character {
        guard let ascA = charA.asciiValue, let ascB = charB.asciiValue else {
            return charA
        }
        if ascA > ascB {
            return charA
        } else {
            return charB
        }
    }
}
 */

/*
// MARK: 1614. 括号的最大嵌套深度
// https://leetcode-cn.com/problems/maximum-nesting-depth-of-the-parentheses/
class Solution {
    func maxDepth(_ s: String) -> Int {
        var maxDepth = 0
        var depth = 0
        for ch in s {
            if ch == "(" {
                depth += 1
                maxDepth = max(maxDepth, depth)
            } else if ch == ")" {
                depth -= 1
            }
        }
        return maxDepth
    }
}
 */

/*
// MARK: 1576. 替换所有的问号
// https://leetcode-cn.com/problems/replace-all-s-to-avoid-consecutive-repeating-characters/
class Solution {
    let letters: [Character] = ["a", "b", "c", "d"]
    func modifyString(_ s: String) -> String {
        var chars: [String.Element] = []
        for ch in s {
            if ch != "?" {
                chars.append(ch)
            } else {
                var post: Character = "?"
                if chars.count + 1 < s.count {
                    let position = s.index(s.startIndex, offsetBy: chars.count + 1)
                    post = s[position]
                }
                chars.append(findCompatible(pre: chars.last ?? "?", post: post))
            }
        }
        var result = ""
        result.append(contentsOf: chars)
        return result
    }
    
    func findCompatible(pre: Character, post: Character) -> Character {
        for letter in letters {
            if letter != pre && letter != post {
                return letter
            }
        }
        print("wrong answer")
        return "?"
    }
}
 */

/*
// MARK: 1185. 一周中的第几天
// https://leetcode-cn.com/problems/day-of-the-week/
class Solution {
    func dayOfTheWeek(_ day: Int, _ month: Int, _ year: Int) -> String {
        var daysCount = 0
        // 1968.1.1星期一
        // 先算1968.1.1到x年1月1日中间有多少闰年（x年本身先不算
        let leapYearCount = (year - 1969) / 4 + 1 // 2100年不是闰年，但刚好是右边界，所以可以不做特殊处理
        daysCount += (year - 1968) * 365 + leapYearCount // 这里是1968.1.1到x年1月1日的天数
        for i in 1..<month {
            switch i {
                case 1:
                    daysCount += 31
                case 2:
                    let isLeapYear = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
                    daysCount += isLeapYear ? 29 : 28
                case 3:
                    daysCount += 31
                case 4:
                    daysCount += 30
                case 5:
                    daysCount += 31
                case 6:
                    daysCount += 30
                case 7:
                    daysCount += 31
                case 8:
                    daysCount += 31
                case 9:
                    daysCount += 30
                case 10:
                    daysCount += 31
                case 11:
                    daysCount += 30
            default:
                break
            }
        } // 这里是1968.1.1到x年x月1日的天数
        daysCount += day - 1
        return ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"][daysCount % 7]
    }
}
 */

/*
// MARK: 2022. 将一维数组转变成二维数组
// https://leetcode-cn.com/problems/convert-1d-array-into-2d-array/
class Solution {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        if original.count != m * n {
            return []
        }
        var newArray: [[Int]] = []
        for i in 0..<m {
            let element = original[n*i...(n*(i+1)-1)]
            newArray.append(Array(element))
        }
        return newArray
    }
}
 */

/*
// MARK: 507. 完美数
// https://leetcode-cn.com/problems/perfect-number/
class Solution {
    func checkPerfectNumber(_ num: Int) -> Bool {
        if num <= 1 {
            return false
        }
        var sum = 1
        var factor = 2
        while factor <= (num / 2) {
            if num % factor == 0 {
                sum += factor
            }
            factor += 1
        }
        return num == sum
    }
}
*/

/*
// MARK: 434. 字符串中的单词数
// https://leetcode-cn.com/problems/number-of-segments-in-a-string/
class Solution {
    func countSegments(_ s: String) -> Int {
        var segmentsCount = 0
        var isCountingLetter = false
        for ch in s {
            if ch == " " {
                if isCountingLetter {
                    isCountingLetter = false
                    segmentsCount += 1
                }
            } else {
                isCountingLetter = true
            }
        }
        if isCountingLetter {
            segmentsCount += 1
        }
        return segmentsCount
    }
}
 */

/*
// MARK: 414. 第三大的数
// https://leetcode-cn.com/problems/third-maximum-number/
class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        var topThree: [Int] = []
        for num in nums {
            var isSmallerThanAll = true
            for i in 0..<topThree.count {
                let topNum = topThree[i]
                if topNum == num {
                    // 题里说了：注意，要求返回第三大的数，是指在所有不同数字中排第三大的数
                    // 因此同样的数二次出现直接跳过
                    isSmallerThanAll = false
                    break
                } else if topNum < num {
                    // 发现更大的数，插在前面
                    topThree.insert(num, at: i)
                    if topThree.count > 3 {
                        topThree.removeLast()
                    }
                    isSmallerThanAll = false
                    break
                }
            }
            if isSmallerThanAll && topThree.count < 3 {
                topThree.append(num)
            }
        }
        if topThree.count >= 3 {
            return topThree[2]
        } else {
            return topThree.first ?? 0
        }
    }
}
 */

/*
// MARK: 482. 密钥格式化
// https://leetcode-cn.com/problems/license-key-formatting/
class Solution {
    func licenseKeyFormatting(_ s: String, _ k: Int) -> String {
        let rev = String(s.reversed())
        var result = ""
        var count = 0
        for ch in rev {
            if ch == "-" {
                continue
            }
            result.append(ch.uppercased())
            count += 1
            if count % k == 0 {
                result.append("-")
            }
        }
        if result.count > 0 && result.last == "-" {
            result = String(result.dropLast(1))
        }
        return String(result.reversed())
    }
}
 */

/*
// MARK: 405. 数字转换为十六进制数
// https://leetcode-cn.com/problems/convert-a-number-to-hexadecimal/
class Solution {
    func toHex(_ num: Int) -> String {
        if num == 0 {
            return "0"
        }
        var hex: String = ""
        for i in 0..<8 {
            let index = 7 - i
            let thisNum = (num >> (4 * index)) & 0xf
            if thisNum == 0 {
                if hex.count > 0 { // 不计先导0
                    hex.append("\(thisNum)")
                }
            } else if thisNum < 10 {
                hex.append("\(thisNum)")
            } else if thisNum == 10 {
                hex.append("a")
            } else if thisNum == 11 {
                hex.append("b")
            } else if thisNum == 12 {
                hex.append("c")
            } else if thisNum == 13 {
                hex.append("d")
            } else if thisNum == 14 {
                hex.append("e")
            } else if thisNum == 15 {
                hex.append("f")
            }
        }
        return hex
    }
}
 */

/*
// MARK: 1436. 旅行终点站
// https://leetcode-cn.com/problems/destination-city/
class Solution {
    // 更为简化的逻辑：先记录全部的起点，然后在全部的终点中搜索不被起点包含的那一个
    func destCity(_ paths: [[String]]) -> String {
        var map: [String: Int] = [:]
        for path in paths {
            map[path[0]] = 0
        }
        for path in paths {
            if map[path[1]] == nil {
                return path[1]
            }
        }
        return ""
    }
    
//    func destCity(_ paths: [[String]]) -> String {
//        var map: [String: Int] = [:] // 城市: 该城市是否可以作为起点前往下一站
//        for path in paths {
//            let dest = path[1]
//            if map[dest] == nil {
//                map[dest] = 0
//            }
//            let origin = path[0]
//            map[origin] = 1
//        }
//        for key in map.keys {
//            if map[key] == 0 {
//                return key
//            }
//        }
//        return ""
//    }
}
 */

/*
// MARK: 326. 3的幂
// https://leetcode-cn.com/problems/power-of-three/
// 暴力除
class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        if n == 1 {
            return true
        } else if n < 3 {
            return false
        }
        var num = n
        while num >= 3 {
            if num % 3 != 0 {
                return false
            }
            num /= 3
        }
        return num == 1
    }
}

// 找到符合题设条件的最高次幂
class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        /*
            题设条件 -231 <= n <= 231 - 1
            1162261467 = 3的19次方
            是符合题设条件的最高次幂
            因此只需判断 n 是否可以被其整除
           */
        //
        return n > 0 && 1162261467 % n == 0
    }
}
 */

/*
// MARK: 58. 最后一个单词的长度
// https://leetcode-cn.com/problems/length-of-last-word/
class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var length = 0
        var needsReset = false
        for ch in s {
            if ch == " " {
                needsReset = true
            } else {
                if needsReset {
                    needsReset = false
                    length = 1
                } else {
                    length += 1
                }
            }
        }
        return length
    }
}
 */

/*
// MARK: 1588. 所有奇数长度子数组的和
// https://leetcode-cn.com/problems/sum-of-all-odd-length-subarrays/
class Solution {
    func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        var sum: Int = 0
        for i in 0..<arr.count {
            let left = i
            let right = arr.count - i - 1
            let leftOdd = (left + 1) / 2
            let rightOdd = (right + 1) / 2
            let leftEven = left / 2 + 1
            let rightEven = right / 2 + 1
            let multiple = leftOdd * rightOdd + leftEven * rightEven
            sum += arr[i] * multiple
        }
        return sum
    }
}
 */

/*
// MARK: 1646. 获取生成数组中的最大值
// https://leetcode-cn.com/problems/get-maximum-in-generated-array/
class Solution {
    func getMaximumGenerated(_ n: Int) -> Int {
        if n == 0 {
            return 0
        } else if n == 1 {
            return 1
        }
        var nums: [Int] = [0, 1]
        var max = 1
        for i in 2...n {
            var value: Int = 0
            if i % 2 == 0 {
                value = nums[i / 2]
            } else {
                value = nums[i / 2] + nums[i / 2 + 1]
            }
            if value > max {
                max = value
            }
            nums.append(value)
        }
        return max
    }
}
 */

/*
// MARK: 108. 将有序数组转换为二叉搜索树
// https://leetcode-cn.com/problems/convert-sorted-array-to-binary-search-tree/
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    // BST = binary search tree
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if (nums.count == 0) {
            return nil
        }
        if (nums.count == 1) {
            return TreeNode(nums[0])
        }
        let mid = nums.count / 2
        let node = TreeNode(nums[mid])
        node.left = sortedArrayToBST(Array(nums[0..<mid]))
        node.right = sortedArrayToBST(Array(nums[mid+1..<nums.count]))
        return node
    }
    
    // BFS = breadth first search
    func outputNodeByBFS(_ node: TreeNode) -> [Int] {
        // no need
        return []
    }
}
 */

/*
// MARK: 20. 有效的括号
// https://leetcode-cn.com/problems/valid-parentheses/
class Solution {
    var leftSymbols: [Character] = ["(","[","{"]
    var rightSymbols: [Character] = [")","]","}"]
    var symbolsMap: [Character: Character] = [")":"(","]":"[","}":"{"]
    
    var stack: [Character] = []
    
    func isValid(_ s: String) -> Bool {
        for ch in s {
            if leftSymbols.contains(ch) {
                push(ch)
            } else if rightSymbols.contains(ch) {
                if let compare = pop(), let target = symbolsMap[ch] {
                    if compare != target {
                        // 不匹配，非法
                        return false
                    }
                } else {
                    // 收到右括号时栈已经空了，非法
                    return false
                }
            }
        }
        if let _ = pop() {
            // 栈不为空，有未匹配的左符号，非法
            return false
        } else {
            return true
        }
    }
    
    func push(_ ch: Character) {
        stack.append(ch)
    }
    
    func pop() -> Character? {
        if let last = stack.last {
            stack = stack.dropLast()
            return last
        } else {
            return nil
        }
    }
}
 */

/*
// MARK: 1. 两数之和
// https://leetcode-cn.com/problems/two-sum/
class Question1 {
    func solve() {
        // 准备数据
        var nums = [Int]();
        for i in 0..<1000 {
            nums.append(i * 2)
        }
        let target = (998 + 999) * 2
        
        // 开始计算
        let begin = Date().timeIntervalSince1970
        let result = twoSum2(nums, target)
        let end = Date().timeIntervalSince1970
        let time = (end - begin) * 1000
 
        // 输出结果
        print("result \(result[0]) \(result[1]), time \(time) ms");
    }
    
    // 哈希表
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int:Int]()
        for i in 0..<nums.count {
            let remain = target - nums[i];
            if let another = dic[remain] {
                return [another, i];
            } else {
                dic[nums[i]] = i
            }
        }
        return [-1, -1]
    }
    
    // 暴力双循环
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        var value1 = -1;
        var value2 = -1;
        label: for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] + nums[j] == target {
                    value1 = i
                    value2 = j
                    break label
                }
            }
        }
        return [value1, value2]
    }
}
*/

// MARK: ⚠️⚠️⚠️LeetCode 已解决-中等
/*
// MARK: 1414. 和为 K 的最少斐波那契数字数目
// https://leetcode-cn.com/problems/find-the-minimum-number-of-fibonacci-numbers-whose-sum-is-k/
// 精彩的证明 https://leetcode-cn.com/problems/find-the-minimum-number-of-fibonacci-numbers-whose-sum-is-k/solution/he-wei-k-de-zui-shao-fei-bo-na-qi-shu-zi-shu-mu-by/
class Solution {
    func findMinFibonacciNumbers(_ k: Int) -> Int {
        var fibonacci: [Int] = [1, 1]
        var a: Int = 1 // bigger one
        var b: Int = 1 // smaller one
        while a + b <= k {
            let next = a + b
            b = a
            a = next
            fibonacci.append(next)
        }
        var ans: Int = 0
        var k = k
        for i in 0..<fibonacci.count {
            if k == 0 {
                break
            }
            let index = fibonacci.count - i - 1
            if k >= fibonacci[index] {
                k -= fibonacci[index]
                print("\(fibonacci[index]), \(k)")
                ans += 1
            }
        }
        return ans
    }
    
//    func fibonacciValue(_ index: Int) -> Int { // 斐波那契数列通项公式
//        let an = (pow(Decimal((1 + sqrt(5)) / 2), index) - pow(Decimal((1 - sqrt(5)) / 2), index)) / Decimal(sqrt(5))
//        let DoubleAn = Double(truncating: an as NSNumber)
//        return Int(DoubleAn)
//    }
}
 */

/*
// MARK: 71. 简化路径
// https://leetcode-cn.com/problems/simplify-path/
class Solution {
    func simplifyPath(_ path: String) -> String {
        var components: [String] = []
        var elements: [Character] = []
        for ch in path {
            if ch == "/" {
                if elements.count > 0 {
                    var currentComponent = ""
                    currentComponent.append(contentsOf: elements)
                    elements.removeAll()
                    if currentComponent == "." {
                        continue
                    } else if currentComponent == ".." {
                        if components.count > 0 {
                            components.removeLast()
                        }
                    } else {
                        components.append(currentComponent)
                    }
                }
            } else {
                elements.append(ch)
            }
        }
        if elements.count > 0 {
            var currentComponent = ""
            currentComponent.append(contentsOf: elements)
            elements.removeAll()
            if currentComponent == "." {
                // do nothing
            } else if currentComponent == ".." {
                if components.count > 0 {
                    components.removeLast()
                }
            } else {
                components.append(currentComponent)
            }
        }
        return "/\(components.joined(separator: "/"))"
    }
}
 */

/*
// MARK: 390. 消除游戏
// https://leetcode-cn.com/problems/elimination-game/
// 推导过程见印象笔记
class Solution {
    func lastRemaining(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        return 2 * (n / 2 + 1 - lastRemaining(n / 2))
    }
}
 */

/*
// MARK: 284. 窥探迭代器
// https://leetcode-cn.com/problems/peeking-iterator/
// Swift IndexingIterator refernence:
// https://developer.apple.com/documentation/swift/indexingiterator
class PeekingIterator {
    
    var iter: IndexingIterator<Array<Int>>
    var nextEle: Int?
    
    init(_ arr: IndexingIterator<Array<Int>>) {
        iter = arr
        nextEle = iter.next()
    }
    
    func next() -> Int {
        let next = nextEle
        nextEle = iter.next()
        return next ?? 0
    }
    
    func peek() -> Int {
        return nextEle ?? 0
    }
    
    func hasNext() -> Bool {
        return nextEle != nil
    }
}

/**
 * Your PeekingIterator object will be instantiated and called as such:
 * let obj = PeekingIterator(arr)
 * let ret_1: Int = obj.next()
 * let ret_2: Int = obj.peek()
 * let ret_3: Bool = obj.hasNext()
 */
 */

/*
// MARK: 166. 分数到小数
// https://leetcode-cn.com/problems/fraction-to-recurring-decimal/
class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        let symbol = numerator * denominator >= 0 ? "" : "-"
        let num = numerator >= 0 ? numerator : numerator * -1
        let den = denominator >= 0 ? denominator : denominator * -1
        let beforeDot = num / den
        var remain = num % den
        if remain == 0 {
            return "\(symbol)\(beforeDot)"
        }
        var remains: [Int] = []
        var strs: [String] = []
        while true {
            if let idx = remains.firstIndex(of: remain) {
                strs.insert("(", at: idx)
                strs.append(")")
                return "\(symbol)\(beforeDot).\(strs.joined())"
            }
            remains.append(remain)
            strs.append("\(remain * 10 / den)")
            remain = remain * 10 % den
            if remain == 0 {
                // 整除了，不需要()标记循环体
                return "\(symbol)\(beforeDot).\(strs.joined())"
            }
        }
    }
}
 */

/*
// MARK: 223. 矩形面积
// https://leetcode-cn.com/problems/rectangle-area/
class Solution {
    func computeArea(_ ax1: Int, _ ay1: Int, _ ax2: Int, _ ay2: Int, _ bx1: Int, _ by1: Int, _ bx2: Int, _ by2: Int) -> Int {
        let rect1 = (ax2 - ax1) * (ay2 - ay1) // 矩形1的面积
        let rect2 = (bx2 - bx1) * (by2 - by1) // 矩形2的面积
        let conincideX = computeCoincide(ax1, ax2, bx1, bx2) // x轴重合长度
        let conincideY = computeCoincide(ay1, ay2, by1, by2) // y轴重合长度
        return rect1 + rect2 - conincideX * conincideY
    }
    
    // 更为简化的重合计算
    func computeCoincide(_ ax1: Int, _ ax2: Int, _ bx1: Int, _ bx2: Int) -> Int {
        let left = max(ax1, bx1)
        let right = min(ax2, bx2)
        return max(0, right - left)
    }
    
//    func computeCoincide(_ ax1: Int, _ ax2: Int, _ bx1: Int, _ bx2: Int) -> Int {
//        // 为简化包含关系，先确定长短边
//        let isALonger = ax2 - ax1 > bx2 - bx1
//        // 短边
//        let sx1 = isALonger ? bx1 : ax1
//        let sx2 = isALonger ? bx2 : ax2
//        // 长边
//        let lx1 = isALonger ? ax1 : bx1
//        let lx2 = isALonger ? ax2 : bx2
//
//        if sx2 < lx1 {
//            // 短边完全在长边左侧，无重合
//            return 0
//        } else if sx1 < lx1 {
//            // 短边右侧进入长边，但左侧仍在长边以外
//            return sx2 - lx1
//        } else if sx2 < lx2 {
//            // 短边左侧也进入长边，但右侧仍在长边以内
//            return sx2 - sx1
//        } else if sx1 < lx2 {
//            // 短边右侧走出长边，但左侧仍在长边之内
//            return lx2 - sx1
//        } else {
//            // 短边左侧走出长边右侧，无重合
//            return 0
//        }
//    }
}
 */

/*
// MARK: 371. 两整数之和
// https://leetcode-cn.com/problems/sum-of-two-integers/
class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        // 按位异或，算出对位想加（不带进位）的结果，按位与并左移一位算出进位的结果，二者相加即为最终结果
        return getSum(a ^ b, (a & b) << 1)
    }
}
 */

/*
// MARK: 583. 两个字符串的删除操作
// https://leetcode-cn.com/problems/delete-operation-for-two-strings/
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let common = longestCommonSubsequence(word1, word2)
        return word1.count - common + word2.count - common
    }
    
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        // text1 为横轴，text2 为纵轴，建表
        var chart: [[Int]] = []
        var i = 0
        for ch2 in text2 {
            var thisRow: [Int] = []
            var j = 0
            for ch1 in text1 {
                if ch1 == ch2 {
                    // 如果两字符相等，对比左上方格子（如无左上方则取1）和上方格子（如无上方则取0）
                    let leftTop = i > 0 && j > 0 ? chart[i-1][j-1] + 1 : 1
                    let top = i > 0 ? chart[i-1][j] : 0
                    thisRow.append(max(leftTop, top))
                } else {
                    // 如果两字符不等，对比左方格子（如无左方则取0）和上方格子（如无上方则取0）
                    let left = j > 0 ? thisRow[j-1] : 0
                    let top = i > 0 ? chart[i-1][j] : 0
                    thisRow.append(max(left, top))
                }
                j += 1
            }
            chart.append(thisRow)
            i += 1
        }
        return chart[text2.count-1][text1.count-1]
    }
}
 */

/*
// MARK: 1143. 最长公共子序列
// https://leetcode-cn.com/problems/longest-common-subsequence/
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        // text1 为横轴，text2 为纵轴，建表
        var chart: [[Int]] = []
        var i = 0
        for ch2 in text2 {
            var thisRow: [Int] = []
            var j = 0
            for ch1 in text1 {
                if ch1 == ch2 {
                    // 如果两字符相等，对比左上方格子（如无左上方则取1）和上方格子（如无上方则取0）
                    let leftTop = i > 0 && j > 0 ? chart[i-1][j-1] + 1 : 1
                    let top = i > 0 ? chart[i-1][j] : 0
                    thisRow.append(max(leftTop, top))
                } else {
                    // 如果两字符不等，对比左方格子（如无左方则取0）和上方格子（如无上方则取0）
                    let left = j > 0 ? thisRow[j-1] : 0
                    let top = i > 0 ? chart[i-1][j] : 0
                    thisRow.append(max(left, top))
                }
                j += 1
            }
            chart.append(thisRow)
            i += 1
        }
        return chart[text2.count-1][text1.count-1]
    }
}
 */

/*
// MARK: 725. 分隔链表
// https://leetcode-cn.com/problems/split-linked-list-in-parts/
class Solution {
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        guard let head = head else {
            var nodes: [ListNode?] = []
            while nodes.count < k {
                nodes.append(nil)
            }
            return nodes
        }
        var count: Int = 1
        var node: ListNode = head
        while true {
            if let next = node.next {
                count += 1
                node = next
            } else {
                break
            }
        }
        
        let perFragmentCount = count / k // 每个分隔链表中的节点数
        let extraFragmentCount = count % k // 前xx个分隔链表的节点数会多1
        
        node = head
        var index = 0
        var nodes: [ListNode?] = [node]
        var lasNode = node // 用来截断链表
        while true {
            if (nodes.count <= extraFragmentCount && index == (perFragmentCount + 1)) || (nodes.count > extraFragmentCount && index == perFragmentCount) {
                index = 0
                nodes.append(node)
                lasNode.next = nil
            }
            if let next = node.next {
                lasNode = node
                node = next
                index += 1
            } else {
                break
            }
        }
        while nodes.count < k {
            nodes.append(nil)
        }
        return nodes
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0; self.next = nil;
    }
    
    public init(_ val: Int) {
        self.val = val; self.next = nil;
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val; self.next = next;
    }
}
 */

/*
// MARK: 430. 扁平化多级双向链表
// https://leetcode-cn.com/problems/flatten-a-multilevel-doubly-linked-list/
class Solution {
    func flatten(_ head: Node?) -> Node? {
        guard let head = head else {
            return nil
        }
        flat(head)
        return head
    }
    
    @discardableResult func flat(_ head: Node) -> Node? {
        var currentNode: Node = head
        while true {
            if currentNode.child != nil {
                let next = currentNode.next
                currentNode.next = currentNode.child
                currentNode.child = nil
                currentNode.next?.prev = currentNode
                let childLast = flat(currentNode)
                childLast?.next = next
                next?.prev = childLast
                if let n = next {
                    currentNode = n
                } else {
                    return childLast
                }
            } else if let next = currentNode.next {
                currentNode = next
            } else {
                return currentNode
            }
        }
    }
}

class Node {
    var val: Int
    var prev: Node?
    var next: Node?
    var child: Node?
    init(_ val: Int) {
        self.val = val
    }
}
 */

/*
// MARK: 650. 只有两个键的键盘
// https://leetcode-cn.com/problems/2-keys-keyboard/
class Solution {
    func minSteps(_ n: Int) -> Int {
        if n <= 1 {
            return 0
        } else if n == 2 {
            return 2
        }
        var divisor = 0
        for i in 0..<n/2 {
            let reverse = n/2 - i
            if n % reverse == 0 {
                divisor = reverse
                break
            }
        }
        if divisor == 1 { // 说明是质数
            return n
        }
        return minSteps(divisor) + (n / divisor)
    }
}
 */

/*
// MARK: 797. 所有可能的路径
// https://leetcode-cn.com/problems/all-paths-from-source-to-target/
// 动态规划解法
class Solution {
    var cacheMap: [Int: [[Int]]] = [:]
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        let result = find(0, graph.count - 1, graph, [0])
        return result
    }
    
    func find(_ src: Int, _ dest: Int, _ graph: [[Int]], _ path: [Int]) -> [[Int]] {
        if let cacheValue = cacheMap[src] {
            var result: [[Int]] = []
            for cache in cacheValue {
                var r = path
                r.append(contentsOf: cache)
                result.append(r)
            }
            return result
        }
        var result: [[Int]] = []
        let srcCanReach = graph[src]
        for canReach in srcCanReach {
            if canReach == dest {
                var p = path
                p.append(dest)
                result.append(p)
            } else {
                var newPath = path
                newPath.append(canReach)
                let findResult = find(canReach, dest, graph, newPath)
                for fr in findResult {
                    if fr.last == dest {
                        result.append(fr)
                    }
                }
            }
        }
        var cacheValue: [[Int]] = []
        for r in result {
            cacheValue.append(Array(r.suffix(from: path.count)))
        }
        cacheMap[src] = cacheValue
        return result
    }
}

// DFS 遍历解法
class Solution {
    var graph: [[Int]] = []
    var result: [[Int]] = []
    var dest: Int = 0
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        self.graph = graph
        self.dest = graph.count - 1
        findPath(0, [0])
        return result
    }
    
    func findPath(_ currentSpot: Int, _ currentRoute: [Int]) {
        if currentSpot == dest {
            result.append(currentRoute)
        } else {
            for spot in graph[currentSpot] {
                var route = currentRoute
                route.append(spot)
                findPath(spot, route)
            }
        }
    }
}
 
// BFS 遍历解法
class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var result: [[Int]] = []
        var queue: [PathNode] = [PathNode(0, [0])]
        while queue.count > 0 {
            let firstNode = queue.removeFirst()
            for nextStep in graph[firstNode.value] {
                if nextStep == graph.count - 1 {
                    // 终点
                    var path = firstNode.path
                    path.append(nextStep)
                    result.append(path)
                } else {
                    var path = firstNode.path
                    path.append(nextStep)
                    let node = PathNode(nextStep, path)
                    queue.append(node)
                }
            }
        }
        return result
    }
}

class PathNode {
    var value = 0
    var path: [Int] = []
    
    init(_ value: Int, _ path: [Int]) {
        self.value = value
        self.path = path
    }
}
 */

/*
// MARK: 787. K 站中转内最便宜的航班
// https://leetcode-cn.com/problems/cheapest-flights-within-k-stops/
class Solution {
    var cacheMap: [String: [Int]] = [:]
    
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        let result = cheapest(src, dst, flights, k, 0)
        if result.count > 0 {
            return result[0]
        }
        return -1
    }
    
    func cheapest(_ from: Int, _ to: Int, _ flights: [[Int]], _ limitK: Int, _ currentK: Int) -> [Int] { // return 价格 & 步数，超出步数 return 空
        if currentK > limitK + 1 {
            return [] // 超出中转次数，直接返回空
        }
        if to == from {
            return [0, currentK - 1]
        }
        
        var minPrice: Int = Int.max
        var minPriceK: Int = Int.max
        
        for flight in flights {
            if (flight[1] == to) { // 只需计算能到这里的航班
                var cheapestToThisFlight: [Int] = []
                if let cache = cacheMap["\(flight[0])-\(currentK + 1)"] {
                    if cache.count > 0 {
                        cheapestToThisFlight = [cache[0] + flight[2], cache[1]]
                    }
                } else {
                    cheapestToThisFlight = cheapest(from, flight[0], flights, limitK, currentK + 1)
                    if (cheapestToThisFlight.count > 0) {
                        cheapestToThisFlight = [cheapestToThisFlight[0] + flight[2], cheapestToThisFlight[1]]
                    }
                }
                if cheapestToThisFlight.count > 0 && cheapestToThisFlight[1] <= limitK { // 查找有结果，并且转机次数没有超出
                    if cheapestToThisFlight[0] < minPrice {
                        minPrice = cheapestToThisFlight[0]
                        minPriceK = cheapestToThisFlight[1]
                    } else  if cheapestToThisFlight[0] == minPrice {
                        if cheapestToThisFlight[1] < minPriceK {
                            minPriceK = cheapestToThisFlight[1] // 价格一样但中转次数更少，说明潜力大，更新 minPriceK
                        }
                    }
                }
            }
        }
        if minPrice < Int.max {
            cacheMap["\(to)-\(currentK)"] = [minPrice, minPriceK]
            return [minPrice, minPriceK]
        }
        cacheMap["\(to)-\(currentK)"] = []
        return []
    }
}
 */

/*
// MARK: 443. 压缩字符串
// https://leetcode-cn.com/problems/string-compression/
class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        var result: [Character] = []
        var currentChar: Character?
        var currentCount: Int = 0
        for char in chars {
            if currentChar != char {
                result.append(contentsOf: generateComponents(currentChar, count: currentCount))
                currentChar = char
                currentCount = 1
            } else {
                currentCount += 1
            }
        }
        result.append(contentsOf: generateComponents(currentChar, count: currentCount))
        chars = result
        return result.count
    }
    
    func generateComponents(_ char: Character?, count: Int) -> [Character] {
        guard let char = char, count > 0 else {
            return []
        }
        if count == 1 {
            return [char]
        }
        var result: [Character] = []
        var count = count
        let thousand = count / 1000
        if let t = "\(thousand)".first {
            result.append(t)
        }
        count -= thousand * 1000
        let hundred = count / 100
        if let h = "\(hundred)".first {
            result.append(h)
        }
        count -= hundred * 100
        let ten = count / 10
        if let t = "\(ten)".first {
            result.append(t)
        }
        count -= ten * 10
        if let c = "\(count)".first {
            result.append(c)
        }
        // 去先导0
        while true {
            if let first = result.first {
                if first == "0" {
                    result.removeFirst()
                } else {
                    break
                }
            } else {
                break
            }
        }
        result.insert(char, at: 0)
        return result
    }
}
 */

/*
// MARK: 789. 逃脱阻碍者
// https://leetcode-cn.com/problems/escape-the-ghosts/
class Solution {
    func escapeGhosts(_ ghosts: [[Int]], _ target: [Int]) -> Bool {
        let myDis = abs(target[0]) + abs(target[1])
        for ghost in ghosts {
            let ghostDis = abs(ghost[0] - target[0]) + abs(ghost[1] - target[1])
            if ghostDis <= myDis {
                return false
            }
        }
        return true
    }
}
 */

/*
// MARK: 633. 平方数之和
// https://leetcode-cn.com/problems/sum-of-square-numbers/
class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        let inputRoot = Int(floor(sqrt(Double(c))))
        for i in 0...inputRoot {
            let anotherRoot = sqrt(Double(c - (i * i)))
            if anotherRoot - floor(anotherRoot) == 0 {
                return true
            }
        }
        return false
    }
}
 */

/*
// MARK: 剑指 Offer 20. 表示数值的字符串
// https://leetcode-cn.com/problems/biao-shi-shu-zhi-de-zi-fu-chuan-lcof/
class Solution {
    enum CharacterType {
        case empty
        case numbers
        case posNegSymbols
        case dots
        case eSymbols
        case others
    }
    
    let numbersSet: [Character] = ["0","1","2","3","4","5","6","7","8","9"]
    let posNegSymbolsSet: [Character] = ["+","-"]
    let dotsSet: [Character] = ["."]
    let eSymbolsSet: [Character] = ["e","E"]
    
    var lastCharacterType: CharacterType = .empty
    
    func isNumber(_ s: String) -> Bool {
        var str = s
        // 去前后空格
        while str.count > 0 {
            if let first = str.first, first == " " {
                str = String(str.dropFirst())
            } else if let last = str.last, last == " " {
                str = String(str.dropLast())
            } else {
                break
            }
        }
        
        var hasNumbers = false
        var hasDots = false
        var hasESymbols = false
        
        lastCharacterType = .empty
        for ch in str {
            let type = characterType(ch)
            switch type {
                case .numbers:
                    hasNumbers = true
                case .posNegSymbols:
                    if lastCharacterType != .empty && lastCharacterType != .eSymbols {
                        // 正负号既不在开头也不在e后面，非法
                        return false
                    }
                case .dots:
                    if hasESymbols {
                        // e符号后方出现小数点即为非法
                        return false
                    }
                    if hasDots {
                        // 小数点二次出现即为非法
                        return false
                    }
                    if lastCharacterType != .numbers && lastCharacterType != .posNegSymbols && lastCharacterType != .empty {
                        // 小数点只能接在数字之后、符号之后或开头
                        return false
                    }
                    hasDots = true
                case .eSymbols:
                    if hasESymbols {
                        // e符号二次出现即为非法
                        return false
                    }
                    if lastCharacterType != .numbers && lastCharacterType != .dots {
                        // e符号只能接在数字或小数点之后
                        return false
                    }
                    if !hasNumbers && lastCharacterType == .dots {
                        // 没有出现过数字，且e符号出现在小数点之后，非法
                        return false
                    }
                    hasESymbols = true
                case .others:
                    // 其余字符一经收到即判为非法
                    return false
                default:
                    print("")
            }
            lastCharacterType = type
        }
        if !hasNumbers {
            // 没有出现过数字，非法
            return false
        }
        // 必须以数字或小数点结尾，否则非法
        return lastCharacterType == .numbers || lastCharacterType == .dots
    }
    
    func characterType(_ ch: Character) -> CharacterType {
        if numbersSet.contains(ch) {
            return .numbers
        } else if posNegSymbolsSet.contains(ch) {
            return .posNegSymbols
        } else if dotsSet.contains(ch) {
            return .dots
        } else if eSymbolsSet.contains(ch) {
            return .eSymbols
        }
        return .others
    }
}
 */

/*
// MARK: 841. 钥匙和房间
// https://leetcode-cn.com/problems/keys-and-rooms/
class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var alreadyFetchedKeysRoomNo: [Int] = [] // 已经找了钥匙的RoomNo，防止重复找钥匙
        var searchQueue: [Int] = [] // 正在查找的queue
        
        if let room0 = rooms.first {
            searchQueue.append(contentsOf: room0)
            alreadyFetchedKeysRoomNo.append(0)
        }
        while searchQueue.count > 0 {
            if let currentRoomNo = searchQueue.first {
                searchQueue.removeFirst()
                if alreadyFetchedKeysRoomNo.contains(currentRoomNo) {
                    continue
                } else {
                    let newKeys = rooms[currentRoomNo]
                    searchQueue.append(contentsOf: newKeys)
                    alreadyFetchedKeysRoomNo.append(currentRoomNo)
                }
            } else {
                break
            }
        }
        return alreadyFetchedKeysRoomNo.count == rooms.count
    }
}
 */

/*
// MARK: 45. 跳跃游戏 II
// https://leetcode-cn.com/problems/jump-game-ii/
class Solution {
    func jump(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return 0
        }
        var startIndex = 0
        var stepCount = 0
        while true {
            let currentValue = nums[startIndex]
            var maxValue = 0
            var maxI = 0
            if startIndex + currentValue >= nums.count - 1 {
                // 抵达终点
                return stepCount + 1
            }
            for i in 0...currentValue {
                if startIndex + i + nums[startIndex + i] > maxValue {
                    // 寻找让下一步的可达距离最远的跳法
                    maxValue = startIndex + i + nums[startIndex + i]
                    maxI = i
                }
            }
            if maxI == 0 {
                // 陷入黑洞，例如 [1,3,2,1,0,4]，第一步跳到3后，无法继续向前
                return -1
            }
            // 更新 startIndex，准备下一跳
            startIndex += maxI
            stepCount += 1
        }
    }
    
    // 动态规划太慢
//    var resultMap: [Int: Int] = [:] // 结果记忆
//
//    func jump(_ nums: [Int]) -> Int {
//        if nums.count <= 1 {
//            return 0
//        }
//        let step = findFast(nums, startIndex: 0)
//        if step == Int.max {
//            return 0
//        } else {
//            return step
//        }
//    }
//
//    func findFast(_ nums: [Int], startIndex: Int) -> Int {
//        if nums[startIndex] == 0 {
//            return Int.max // 误入黑洞
//        }
//        if startIndex + nums[startIndex] >= nums.count - 1 {
//            return 1 // 一步到底
//        }
//        var minStep = Int.max
//        for i in 1..<nums[startIndex] + 1 {
//            let newStartIndex = startIndex + i
//            var step = 0
//            if let memory = resultMap[newStartIndex] {
//                step = memory
//            } else {
//                step = findFast(nums, startIndex: newStartIndex)
//                resultMap[newStartIndex] = step
//            }
//            if step < minStep {
//                minStep = step
//            }
//        }
//        if minStep == Int.max {
//            return minStep
//        } else {
//            return minStep + 1
//        }
//    }
}
 */

/*
// MARK: 6. Z字形变换
// https://leetcode-cn.com/problems/zigzag-conversion/
class Question6 {
    func solve() {
        let result = convert("LEETCODEISHIRING", 4)
        print("\(result)")
    }

    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows <= 0 {
            return "Error"
        }
        if numRows == 1 {
            return s
        }
        var container: [String] = []
        for _ in 0..<numRows {
            container.append("")
        }
        var currentIndex = 0
        var isAdding = true
        for ch in s {
            container[currentIndex].append(ch)
            if isAdding {
                currentIndex += 1
                if currentIndex == numRows {
                    currentIndex -= 2
                    isAdding = false
                }
            } else {
                currentIndex -= 1
                if currentIndex < 0 {
                    currentIndex += 2
                    isAdding = true
                }
            }
        }
        return container.joined()
    }
}
 */

/*
// MARK: 2. 两数相加
// https://leetcode-cn.com/problems/add-two-numbers/
class Question2 {
    func solve() {
        // 准备数据
        var ln1 = buildNode([8, 7, 9]) // 879
        var ln2 = buildNode([4, 9, 6]) // 496
        
        // 计算
        let begin = Date().timeIntervalSince1970
        var result = addTwoNumbers(ln1, ln2);
        let end = Date().timeIntervalSince1970
        let time = (end - begin) * 1000
        
        // 耗时
        print("time \(time) ms");
        
        // 结果
        print("l1 node")
        while ln1 != nil {
            if let value = ln1?.value {
                print("\(value)")
            }
            ln1 = ln1?.next
        }
        
        print("l2 node")
        while ln2 != nil {
            if let value = ln2?.value {
                print("\(value)")
            }
            ln2 = ln2?.next
        }
        
        print("result node")
        while result != nil {
            if let value = result?.value {
                print("\(value)")
            }
            result = result?.next
        }
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var next1: ListNode? = l1; // 逐个遍历 l1
        var next2: ListNode? = l2; // 逐个遍历 l2
        var first: ListNode? // 最终返回的节点，即两数之和的个位
        var result: ListNode? // 每次循环产生的节点
        while next1 != nil || next2 != nil {
            var value = 0
            if let n1 = next1 {
                value += n1.value
            }
            if let n2 = next2 {
                value += n2.value
            }
            let node = ListNode(value, nil);
            if first == nil {
                first = node
            }
            if let r = result {
                r.next = node
                // 处理进位
                if r.value >= 10 {
                    r.value -= 10
                    node.value += 1
                }
            }
            result = node
            
            next1 = next1?.next
            next2 = next2?.next
        }
        // 处理最高位进位
        if let r = result, r.value >= 10 {
            r.value -= 10;
            r.next = ListNode(1, nil)
        }
        return first;
    }
    
    func buildNode(_ nums: [Int]) -> ListNode? {
        var nextNode: ListNode?
        for i in 0..<nums.count {
            nextNode = ListNode(nums[i], nextNode);
        }
        return nextNode!
    }
}

class ListNode {
    var value: Int
    var next: ListNode?
    
    init(_ value: Int, _ next: ListNode?) {
        self.value = value
        self.next = next
    }
}
 */

// MARK: ⚠️⚠️⚠️LeetCode 已解决-困难
/*
// MARK: 403. 青蛙过河
// https://leetcode-cn.com/problems/frog-jump/
 class Solution {
     var dfsDic: [String: Bool] = [:]
     var stones: [Int] = []
     var destination: Int = 0
     
     func canCross(_ stones: [Int]) -> Bool {
         self.stones = stones
         self.destination = stones.last ?? 0
         return reachable(0, 0)
     }
     
     func reachable(_ currentPos: Int, _ lastDistance: Int) -> Bool {
         if currentPos == destination {
             return true
         }
         if let result = dfsDic["\(currentPos),\(lastDistance)"] {
             return result
         }
         for i in (lastDistance - 1)...(lastDistance + 1) {
             if i < 1 {
                 continue
             }
             if stones.contains(currentPos + i) && reachable(currentPos + i, i) {
                 dfsDic["\(currentPos),\(lastDistance)"] = true
                 return true
             }
         }
         dfsDic["\(currentPos),\(lastDistance)"] = false
         return false
     }
 }
 */

/*
// MARK: 51. N 皇后
// https://leetcode-cn.com/problems/n-queens/
// 正面求解法
class QueenNode {
    var targetN: Int = 0 // N皇后的N
    var solutionPath: [Int] = [] // 解的路径
    
    init(_ targetN: Int, _ solutionPath: [Int]) {
        self.targetN = targetN
        self.solutionPath = solutionPath
    }
    
    func nextValidPos() -> [Int] {
        var pos: [Int] = []
        for i in 0..<targetN { // 先将0-n都塞进数组
            pos.append(i)
        }
        for i in 0..<solutionPath.count { // 遍历此前的路径，将不可摆放的位置剔除
            let val = solutionPath[i]
            pos.removeAll { p in
                // 剔除皇后正下方、右下方、左下方的位置（左右偏移量与相隔的行数相关）
                return p == val || p == val + (solutionPath.count - i) || p == val - (solutionPath.count - i)
            }
        }
        return pos
    }
}

class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        if (n == 1) {
            return [["Q"]]
        }
        var result: [[String]] = [] // 存储结果
        var nodes: [QueenNode] = [] // 存储临时节点
        for i in 0..<n {
            nodes.append(QueenNode(n, [i])) // 启动时从第一行所有位置生成节点，开始检查
        }
        while nodes.count > 0 {
            let currentNode = nodes.removeFirst() // 取出并删除第一个
            let nextValidPos = currentNode.nextValidPos()
            if nextValidPos.count > 0 {
                // 下一步有的走
                if currentNode.solutionPath.count == n - 1 {
                    // 当前节点解路径的长度已经到达n-1且下一步有的走，这就是一个解
                    var solutionPath = currentNode.solutionPath
                    solutionPath.append(nextValidPos[0])
                    result.append(convertSolution(solutionPath))
                } else {
                    // 与终点仍有距离，存储所有的可能，继续检查
                    for pos in nextValidPos {
                        var solutionPath = currentNode.solutionPath
                        solutionPath.append(pos)
                        nodes.insert(QueenNode(n, solutionPath), at: 0)
                    }
                }
            }
            // 下一步没的走，当前节点死路，废弃，开始检查下一个节点
        }
        return result
    }
    
    func convertSolution(_ solutionPath: [Int]) -> [String] {
        var result: [String] = []
        let n = solutionPath.count
        for val in solutionPath {
            result.append("\(String(repeating: ".", count: val))Q\(String(repeating: ".", count: n - val - 1))")
        }
        return result
    }
}

// 递归回溯法
class Solution {
    var result: [[String]] = []
    
    func solveNQueens(_ n: Int) -> [[String]] {
        insertQ(0, n, generateCheeseBoard(n))
        return result
    }
    
    func insertQ(_ onRow: Int, _ totalRow: Int, _ cheeseBoard: [[Int]]) {
        for i in 0..<totalRow {
            // 即将在 onRow 行，i 列插入 Q，检查在此插入是否合法
            if checkIsValid(onRow, i, cheeseBoard) {
                var cheeseBoard = cheeseBoard
                cheeseBoard[onRow][i] = 1
                if onRow == totalRow - 1 {
                    // 已经到底，说明这是一个解
                    recordCheeseBoard(cheeseBoard)
                } else {
                    // 仍未到底，继续递归
                    insertQ(onRow + 1, totalRow, cheeseBoard)
                }
            }
            // 不可插入，直接进入下一个位置的检查
        }
    }
    
    func checkIsValid(_ onRow: Int, _ onColumn: Int, _ cheeseBoard: [[Int]]) -> Bool {
        for i in 0..<onRow {
            let thisRow = cheeseBoard[i]
            // 检查是否有同列的 Q
            if thisRow[onColumn] == 1 {
                return false
            }
            // 检查左上是否有 Q
            let topLeftColumn = onColumn - (onRow - i)
            if topLeftColumn >= 0 && thisRow[topLeftColumn] == 1 {
                return false
            }
            let topRightColumn = onColumn + (onRow - i)
            if topRightColumn < thisRow.count && thisRow[topRightColumn] == 1 {
                return false
            }
        }
        
        // 都没有，合法
        return true
    }
    
    func recordCheeseBoard(_ cheeseBoard: [[Int]]) {
        var rowsToString: [String] = []
        for i in 0..<cheeseBoard.count {
            let row = cheeseBoard[i]
            var rowStr: String = ""
            for j in 0..<row.count {
                if row[j] == 1 {
                    rowStr.append("Q")
                } else {
                    rowStr.append(".")
                }
            }
            rowsToString.append(rowStr)
        }
        self.result.append(rowsToString)
    }
    
    func generateCheeseBoard(_ n: Int) -> [[Int]] {
        var cheeseBoard: [[Int]] = []
        for _ in 0..<n {
            var row: [Int] = []
            for _ in 0..<n {
                row.append(0)
            }
            cheeseBoard.append(row)
        }
        return cheeseBoard
    }
}
 */

// MARK: ⚠️⚠️⚠️真实面试题
/*
// MARK: 三数之和 懂车帝面试题
class ThreeSum {
    func findThreeSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        var map: [Int: Int] = [:]
        for i in 0..<nums.count {
            // 值为key, 下标为value
            map[nums[i]] = i
        }
        for i in 0..<nums.count / 2 {
            let twoTarget = target - nums[i]
            for j in i+1..<nums.count {
                let oneTarget = twoTarget - nums[j]
                if let index = map[oneTarget], index > j {
                    // 存在要找的数
                    result.append([nums[i], nums[j], oneTarget])
                } else {
                    // 不存在要找的数, 无需处理
                }
            }
        }
        return result
    }
}
 */

/*
// MARK: 之字形遍历 懂车帝面试题
class TreeTracking {
    func beginZTracking(_ root: TreeNode) {
        safePrintValue(root)
        zTracking([root], false)
    }
    
    func zTracking(_ nodes: [TreeNode], _ isLeftToRigth: Bool) {
        if (nodes.count == 0) {
            return
        }
        var queue: [TreeNode] = []
        for node in nodes {
            if let left = root.left {
                queue.append(left)
            }
            if let right = root.right {
                queue.append(right)
            }
        }
        var trackingArray: [TreeNode] = []
        if (isLeftToRigth) {
            trackingArray.append(contentsOf: queue)
        } else {
            trackingArray.append(contentsOf: queue.reverse())
        }
        for node in trackingArray {
            safePrintValue(node)
        }
        zTracking(queue, !isLeftToRigth)
    }
    
    func safePrintValue(_ node: TreeNode?) {
        if let value = node?.value {
            print("\(value)")
        }
    }
}

class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    var value: Int?
}
 */
