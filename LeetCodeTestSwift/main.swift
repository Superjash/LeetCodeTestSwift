//
//  main.swift
//  LeetCodeTestSwift
//
//  Created by Jash on 2020/7/11.
//  Copyright © 2020 Jash. All rights reserved.
//

import Foundation

print("Hello, World!")
Question3().solve()

class QUestion4 {
    // https://leetcode-cn.com/problems/median-of-two-sorted-arrays/
//    给定两个大小为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。
//    请你找出这两个正序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。
//    你可以假设 nums1 和 nums2 不会同时为空。
//    示例 1:
//    nums1 = [1, 3]
//    nums2 = [2]
//    则中位数是 2.0
//    示例 2:
//    nums1 = [1, 2]
//    nums2 = [3, 4]
//    则中位数是 (2 + 3)/2 = 2.5
    func solve() {
        
    }
}

class Question3 {
    // https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/
//    示例 1:
//    输入: "abcabcbb"
//    输出: 3
//    解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
//    示例 2:
//    输入: "bbbbb"
//    输出: 1
//    解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
//    示例 3:
//    输入: "pwwkew"
//    输出: 3
//    解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
//         请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
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

/*
class Question2 {
    // https://leetcode-cn.com/problems/add-two-numbers/
    // 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
    // 输出：7 -> 0 -> 8
    // 原因：342 + 465 = 807
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

/*
class Question1 {
    // https://leetcode-cn.com/problems/two-sum/
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
