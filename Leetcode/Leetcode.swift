
//
//  Leetcode.swift
//  Leetcode
//
//  Created by 未可知 on 2019/1/8.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import UIKit
import SQLite3

public class ListNode {
	public var val: Int
	public var next: ListNode?
	public init(_ val: Int) {
		self.val = val
		self.next = nil
	}
	
}

public class TreeNode: NSObject {
	public var val: Int
	public var left: TreeNode?
	public var right: TreeNode?
	public init(_ val: Int) {
		self.val = val
		self.left = nil
		self.right = nil
	}
}


public class Node1 {
	public var val: Int
	public var left: Node1?
	public var right: Node1?
	public var next: Node1?
	public init(_ val: Int) {
		self.val = val
		self.left = nil
		self.right = nil
		self.next = nil
	}
}

public class Node2: Hashable, Equatable {
	public var val: Int
	public var next: Node2?
	public var random: Node2?
	public var hashValue: Int {
		return self.val.hashValue
	}
	public init(_ val: Int) {
		self.val = val
		self.next = nil
		self.random = nil
	}
	
	static public func ==(a: Node2, b: Node2) -> Bool {
		return a.val == b.val
	}
	
}

class Leetcode: NSObject {
	func start() -> Void {
		
	}
	
	
	
	// 链表不能使用for - in 循环
	func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
		
		if l1 == nil || l2 == nil {
			return nil;
		}
		var newL1 = l1;
		var newL2 = l2;
		let rootNode = ListNode.init(0);
		var mnode : ListNode;
		mnode = rootNode;
		var e = 0;
		while (newL1 != nil && newL2 != nil) || e == 1 {
			let node = ListNode.init(0);
			if newL1 != nil && newL2 != nil {
				node.val = newL1!.val + newL2!.val + e;
			}
			else if newL1 != nil {
				node.val = newL1!.val + e;
			}
			else if newL2 != nil {
				node.val = newL2!.val + e;
			}
			else {
				node.val =  e;
			}
			e = 0;
			if node.val >= 10 {
				e = 1;
				node.val = node.val - 10;
			}
			mnode.next = node;
			mnode = node;
			newL1 = newL1?.next;
			newL2 = newL2?.next;
		}
		
		if newL1 != nil {
			mnode.next = newL1;
		}
		else if newL2 != nil
		{
			mnode.next = newL2;
		}
		return rootNode.next;
	}
	
	// 3、
	func lengthOfLongestSubstring(_ s: String) -> Int {
		if s.count == 0 {
			return 0;
		}
		var max = 0
		var cuNums = [Character]();
		for item in s {
			if cuNums.count == 0 {
				cuNums.append(item);
				max = cuNums.count;
			}
			else {
				if cuNums.contains(item) {
					let index = cuNums.firstIndex(of: item);
					cuNums = Array(cuNums.suffix(from: (index! + 1)));
					cuNums.append(item);
					max = max > cuNums.count ? max : cuNums.count;
				}
				else {
					cuNums.append(item);
					max = cuNums.count;
					max = max > cuNums.count ? max : cuNums.count;
				}
			}
		}
		return max;
	}
	
	func twoSum(_ nums : [Int], _ target : Int) -> [Int] {
		var re = [Int]();
		for i in 0..<nums.count {
			for j in i+1..<nums.count {
				if (nums[i] + nums[j] == target) {
					re[0] = i;
					re[1] = j;
					break;
				}
			}
		}
		return re;
	}
	
	func convert1(_ s: String, _ numRows: Int) -> String? {
		if s.count == 0 || numRows == 0 {
			return nil
		}
		var a = [Array<Any>]()
		let m = min(s.count, numRows)
		for _ in 0...m {
			var b = [Character]()
			a.append(b)
		}
		var c = 0
		for x in s {
			a[c].append(x)
			c+=1
			if c == m {
				c = 0
			}
		}
		
		return nil;
	}
	
	// 20 有效的括号
	func isValid(_ s: String) -> Bool {
		if s.isEmpty {
			return true
		}
		var array:Array<Character> = []
		for ch in s {
			if array.count == 0 {
				array.append(ch)
			}
			else if isValidRight(c1: array.last! , c2: ch) {
				array.removeLast()
			}
			else {
				array.append(ch)
			}
		}
		print("array\(array)")
		return array.count == 0
	}
	
	func isValidRight(c1: Character, c2: Character) -> Bool{
		return (c1 == "(" && c2 == ")") ||
			(c1 == "[" && c2 == "]") ||
			(c1 == "{" && c2 == "}")
	}
	
	// 21 合并两个有序链表
	func mergeTwoListsRes(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
		if l1 == nil {
			return l2
		}
		if l2 == nil {
			return l1
		}
		if l1!.val < l2!.val {
			l1?.next = mergeTwoListsRes(l1?.next, l2)
			return l1
		}
		else {
			l2?.next = mergeTwoListsRes(l1, l2?.next)
			return l2
		}
	}
	
	func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
		if l1 == nil && l2 == nil {
			print("return nil")
			return nil
		}
		let val = l1 != nil ? l1?.val:l2?.val
		var newNode = ListNode(val!)
		let fNode = newNode
		var node1 = l1
		var node2 = l2
		while(node1 != nil || node2 != nil) {
			if node1 != nil && node2 != nil {
				if node1!.val > node2!.val {
					newNode.next = ListNode(node2!.val)
					node2 = node2?.next
				}
				else {
					newNode.next = ListNode(node1!.val)
					node1 = node1?.next
				}
				newNode = newNode.next!
			}
			else if node1 != nil && node2 == nil {
				newNode.next = ListNode(node1!.val)
				node1 = node1?.next
				newNode = newNode.next!
			}
			else {
				newNode.next = ListNode(node2!.val)
				node2 = node2?.next
				newNode = newNode.next!
			}
		}
		return fNode.next
	}
	
	// 14 最长公共前缀
	func longestCommonPrefix(_ strs: [String]) -> String {
		if strs.count == 0 || strs[0].count == 0 {
			return ""
		}
		var index = 1
		var maxStr = strs[0]
		var coStr = maxStr.prefix(index)
		while true {
			var flag = false
			for str in strs {
				if str.count > maxStr.count {
					maxStr = str
				}
				if str.count >= index {
					flag = true
				}
				if coStr != str.prefix(index) {
					return String(coStr.prefix(coStr.count - 1))
				}
			}
			if !flag {
				break
			}
			index+=1
			coStr = maxStr.prefix(index)
		}
		return String(coStr)
	}
	
	//26 删除排序数组中的重复项
	func removeDuplicates(_ nums: inout [Int]) -> Int {
		if nums.count <= 1 {
			return nums.count
		}
		var i = 0, j=1
		while j<nums.count {
			if nums[i] == nums[j] {
				j+=1
			}
			else {
				i+=1
				nums[i] = nums[j]
				j+=1
			}
		}
		return i+1
	}
	
	// 27 移除元素
	func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
		var j = 0
		for i in 0..<nums.count {
			if nums[i] != val {
				nums[j] = nums[i]
				j+=1
			}
		}
		print("nums = \(nums)")
		return j
	}
	
	// 28 实现strStr()
	func strStr(_ haystack: String, _ needle: String) -> Int {
		if needle.count == 0 {
			return 0
		}
		if haystack.count < needle.count || haystack.count == 0 {
			return -1
		}
		var i = 0
		var index = -1
		while i < haystack.count {
			var res = true
			if haystack.count - i < needle.count {
				break
			}
			let tmp = i
			for j in 0..<needle.count {
				if needle[j] != haystack[i] {
					res = false
					break
				}
				i+=1
			}
			if res {
				index = tmp
				break
			}
			i = tmp+1
		}
		return index
	}
	
	//35.搜索插入位置
	func searchInsert(_ nums: [Int], _ target: Int) -> Int {
		if nums.count == 0 {
			return 0
		}
		for (i, num) in nums.enumerated() {
			if num >= target {
				return i
			}
		}
		return nums.count
	}
	
	// 38.报数
//	func countAndSay(_ n: Int) -> String {
//		var str = ""
//		for i in 0..<n {
//			if i == 0 {
//				str = "1"
//			}
//			else {
//				var subStr = ""
//				var sub = ""
//				for j in 0..<str.count  {
//					sub.append(str[j]!)
//					if j == 0 {
//						continue
//					}
//					if j%2 == 0 {
//						subStr.append(countAndSaySub(str:sub))
//						sub = ""
//					}
//				}
//				str = subStr
//			}
//		}
//		return str
//	}
	
//	func countAndSaySub(str: String) -> String {
//		if str.count == 1 {
//			return "1" + str
//		}
//		else if str.count == 2 {
//			if str[0] == str[1] {
//				return "1" + String(str[0]!)
//			}
//			else {
//				return "1" + String(str[0]!) + "1" + String(str[1]!)
//			}
//		}
//		else {
//			return ""
//		}
//	}
	
	// 53 最大子序和
	@discardableResult
	func maxSubArray(_ nums: [Int]) -> Int {
		var sum = 0, ans = nums[0]
		for num in nums {
			if sum > 0 {
				sum += num
			}
			else {
				sum = num
			}
			ans = ans > sum ? ans : sum
			//			print("max = \(ans)")
		}
		return ans
	}
	
	// x的平方根
	func mySqrt(_ x: Int) -> Int {
		if x == 0 {
			return x
		}
		if x < 4 {
			return 1
		}
		var start = 0
		var end = x
		var mid = (start + end)/2
		while start != mid {
			if mid * mid < x {
				start = mid
			}
			else if mid * mid > x {
				end = mid
			}
			else {
				return mid
			}
			mid = (start + end)/2
		}
		if (mid + 1) * (mid + 1) > x && mid * mid < x  {
			return mid
		}
		else if (mid - 1) * (mid - 1) < x && mid * mid > x {
			return mid - 1
		}
		return mid
	}
	
	// 70 爬楼梯(典型的动态规划)
	func climbStairs(_ n: Int) -> Int {
		if n <= 3 {
			return n
		}
		var arr: Array<Int> = []
		arr.append(1)
		arr.append(2)
		arr.append(3)
		for i in 0..<n {
			if arr.count < i + 1 {
				let r = arr[i - 1] + arr[i - 2]
				arr.append(r)
			}
		}
		return arr.last!;
	}
	
	//66 加1
	func plusOne(_ digits: [Int]) -> [Int] {
		var newDigits = [Int]()
		var isOverflow = false
		for (index, i) in Array(digits.reversed()).enumerated() {
			if index == 0 {
				let num = i + 1
				if num > 9 {
					isOverflow = true
					newDigits.append(0)
				}
				else {
					isOverflow = false
					newDigits.append(num)
				}
			}
			else {
				if isOverflow {
					let num = i + 1
					if num > 9 {
						isOverflow = true
						newDigits.append(0)
					}
					else {
						isOverflow = false
						newDigits.append(num)
					}
				}
				else {
					isOverflow = false
					newDigits.append(i)
				}
			}
		}
		if newDigits.last == 0 {
			newDigits.append(1)
		}
		return Array(newDigits.reversed())
	}
	
	func addBinary(_ a: String, _ b: String) -> String {
		let short = a.count > b.count ? b : a
		let long = a.count > b.count ? a : b
		var isOverflow = false
		var newStr = String()
		for i in 0..<long.count {
			let index = long.count - i - 1 - (long.count - short.count)
			var shortv = 0
			if index >= 0 {
				shortv = short[index]!.hexDigitValue!
			}
			let longv = long[index + long.count - short.count]!.hexDigitValue!
			var re = shortv + longv
			if isOverflow {
				re = re + 1
			}
			if re  >= 2 {
				re = re%2
				isOverflow = true
			}
			else {
				isOverflow = false
			}
			newStr.insert(Character(String(re)), at: newStr.startIndex)
		}
		if isOverflow {
			newStr.insert(Character(String(1)), at: newStr.startIndex)
		}
		return newStr
	}
	
	// 83
	func deleteDuplicates(_ head: ListNode?) -> ListNode? {
		if head == nil {
			return nil
		}
		let startNode = ListNode(head!.val)
		var newNode = startNode
		var sNode = head!
		while sNode.next != nil {
			if sNode.next!.val != newNode.val {
				newNode.next = ListNode(sNode.next!.val)
				newNode = newNode.next!
			}
			sNode = sNode.next!
		}
		return startNode
	}
	
	// 88
	func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
		if m == 0 {
			nums1 = nums2
		}
		while nums1.count != m {
			nums1.removeLast()
		}
		nums1.append(contentsOf: nums2)
		for i in 0..<nums1.count {
			for j in (i+1)..<nums1.count {
				if nums1[i] > nums1[j] {
					let a = nums1[j]
					nums1[j] = nums1[i]
					nums1[i] = a
				}
			}
		}
	}
	
	// 136
	func singleNumber(_ nums: [Int]) -> Int {
		if nums.count == 1 {
			return nums[0]
		}
		var ams = nums[0]
		for i in 1..<nums.count {
			ams = ams ^ nums[i]
		}
		return ams
	}
	
	// 167
	func twoSums(_ numbers: [Int], _ target: Int) -> [Int] {
		var i = 0
		var j = numbers.count - 1
		while numbers[i] + numbers[j] != target {
			if numbers[i] + numbers[j] < target {
				i+=1
			}
			else if numbers[i] + numbers[j] > target {
				j-=1
			}
		}
		return [i+1, j+1]
	}
	// 169
	func majorityElement(_ nums: [Int]) -> Int {
		var map = Dictionary<Int, Int>()
		for v in nums {
			var count = map[v]
			if count != nil {
				count!+=1
				map[v] = count
			}
			else {
				map[v] = 1
			}
		}
		print(map)
		var max = 0
		var k = 0
		for (key, value) in map {
			if max < value {
				max = value
				k = key
			}
		}
		return k
	}
	
	// 172
	func trailingZeroes(_ n: Int) -> Int {
		var c = n
		var count = 0
		while c != 0 {
			count = count + c/5
			c/=5
		}
		return count
	}
	
	// 189
	func rotate(_ nums: inout [Int], _ k: Int) {
		if nums.count == 0 {
			return
		}
		var i = 0
		while i != k {
			i+=1
			let value = nums.removeLast()
			nums.insert(value, at: 0)
		}
	}
	
	func hammingWeight(num: Int) -> Int {
		var mark = 1
		var count = 0
		for _ in 0...31 {
			let re = mark & num
			if re == 1 {
				count+=1
			}
			mark <<= 1
		}
		return count
	}
	
	// 198
	func rob(_ nums: [Int]) -> Int {
		if nums.count == 0 {
			return 0
		}
		var map = Dictionary<Int,Int>();
		map[0] = nums[0];
		if nums.count >= 2 {
			map[1] = max(nums[0], nums[1])
		}
		if nums.count >= 3 {
			map[2] = max(map[0]! + nums[2], nums[1])
		}
		if nums.count >= 4 {
			map[3] = max(map[1]! + nums[3], map[0]!+nums[2])
		}
		if nums.count > 4 {
			for i in 4..<nums.count {
				map[i] = max(map[i-2]!+nums[i], map[i-3]!+nums[i-1])
			}
		}
		print(map)
		return map[nums.count - 1]!
	}
	
	// 202
	func isHappy(_ n: Int) -> Bool {
		var slow = n
		var fast = n
		repeat {
			slow = isHappySquare(n: &slow)
			fast = isHappySquare(n: &fast)
			fast = isHappySquare(n: &fast)
		} while slow != fast
		return slow == 1
	}
	
	func isHappySquare(n: inout Int) -> Int {
		var ans = 0
		while n != 0 {
			ans += ((n%10)*(n%10))
			n = n/10
		}
		return ans
	}
	
	// 203
	func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
		if  head == nil {
			return nil
		}
		var newHead = head
		var preHead: ListNode? = nil
		var firstHead: ListNode? = nil
		while newHead != nil {
			if newHead?.val != val {
				if preHead == nil {
					firstHead = newHead
				}
				else {
					preHead?.next = newHead
				}
				preHead = newHead
			}
			else {
				preHead?.next = nil
			}
			newHead = newHead?.next
		}
		return firstHead
	}
	
	// 204
	func countPrimes(_ n: Int) -> Int {
		if n <= 1 {
			return 0
		}
		
		var signs = Array<Bool>()
		var count = 0
		for i in 0..<n {
			signs.append(false)
		}
		for i in 2..<n {
			if !signs[i] {
				count+=1
				var j = i
				while i * j < n {
					signs[i*j] = true
					j+=1
				}
			}
		}
		return count
	}
	
	// 205
	// 这样解也是正确的但是由于swift效率很低，leetcode执行超时
	//	func isIsomorphic(_ s: String, _ t: String) -> Bool {
	//		if s.count != t.count {
	//			return false
	//		}
	//		var smap = Dictionary<Character, Character>()
	//		var tmap = Dictionary<Character, Character>()
	//		for i in 0..<s.count {
	//			if smap[s[i]!] != nil {
	//				if smap[s[i]!] != t[i] {
	//					return false
	//				}
	//			}
	//			else if tmap[t[i]!] != nil {
	//				if tmap[t[i]!] != s[i] {
	//					return false
	//				}
	//			}
	//			else {
	//				smap[s[i]!] = t[i]!
	//				tmap[t[i]!] = s[i]!
	//			}
	//		}
	//		return true
	//	}
	
	// 206
	func reverseList(_ head: ListNode?) -> ListNode? {
		var cur = head
		var prev: ListNode? = nil
		while cur?.next != nil {
			let next = cur?.next
			cur?.next = prev
			prev = cur
			cur = next
		}
		return prev
	}
	
	// 206递归
	func reverseListRec(_ head: ListNode?) -> ListNode? {
		if head == nil || head?.next == nil {
			return head;
		}
		let p = reverseListRec(head)
		head?.next?.next = head
		head?.next = nil
		return p
	}
	
	// 217 哈希表
	func containsDuplicate(_ nums: [Int]) -> Bool {
		if nums.count < 1 {
			return false
		}
		var map = Dictionary<Int, Int>()
		for (i, n) in nums.enumerated() {
			map[n] = i
		}
		return map.count != nums.count
	}
	// 217 遍历 (超时)
	func containsDuplicateRe(_ nums: [Int]) -> Bool {
		if nums.count <= 1 {
			return false
		}
		var flag = false
		out: for i in 0..<(nums.count - 1){
			for j in i..<(nums.count - 1) {
				if nums[i] == nums[j+1] {
					flag = true
					break out
				}
			}
		}
		return flag
	}
	
	// 226
	func invertTree(_ root: TreeNode?) -> TreeNode? {
		if root == nil || (root?.left == nil && root?.right == nil) {
			return root
		}
		let temp = root?.left
		root?.left = root?.right
		root?.right = temp
		invertTree(root?.left)
		invertTree(root?.right)
		return root
	}
	
	//231
	func isPowerOfTwo(_ n: Int) -> Bool {
		if n == 0 {
			return false
		}
		if n == 1 {
			return true
		}
		var m = n
		while m != 1 {
			if m%2 == 0 {
				m = m/2
			}
			else {
				return false
			}
		}
		return true
	}
	
	// 234
	func isPalindrome(_ head: ListNode?) -> Bool {
		if head == nil || head?.next == nil {
			return true
		}
		var slow = head
		var fast = head
		var pre = head
		var prep: ListNode? = nil
		while fast != nil && fast?.next != nil {
			pre = slow
			fast = fast?.next?.next
			slow = slow?.next
			pre?.next = prep
			prep = pre
		}
		if fast != nil {
			slow = slow?.next
		}
		while slow != nil {
			if slow?.val != pre?.val {
				return false
			}
			slow = slow?.next
			pre = pre?.next
		}
		return true
	}
	
	//242  超时
	func isAnagram(_ s: String, _ t: String) ->Bool {
		if s.count != t.count {
			return false
		}
		var map = Dictionary<Character, Int>()
		for i in 0..<s.count {
			if map[s[i]!] == nil {
				map[s[i]!] = 0
			}
			if map[t[i]!] == nil {
				map[t[i]!] = 0
			}
			map[s[i]!]! += 1
			map[t[i]!]! -= 1
		}
		for (_,v) in map {
			if v != 0 {
				return false
			}
		}
		return true
	}
	
	// 263
	func isUgly(_ num: Int) -> Bool {
		if num == 1 {
			return true
		}
		if num == 0 {
			return false
		}
		var n = num
		var flag = true
		while flag && n != 1 {
			if n % 2 == 0 {
				n = n / 2
			}
			else if n % 3 == 0 {
				n = n / 3
			}
			else if n % 5 == 0 {
				n = n / 5
			}
			else {
				flag = false
			}
		}
		return n == 1
	}
	
	// 268 超时
	func missingNumberOverTime(_ nums: [Int]) -> Int {
		var e = Array<Int>()
		for i in 0..<(nums.count + 1) {
			e.append(i)
		}
		for i in nums {
			e.remove(at: e.index(of: i)!)
		}
		return e.last!
	}
	
	// 268
	func missingNumber(_ nums: [Int]) -> Int {
		var v = 0
		for i in 0..<(nums.count + 1) {
			v += i
		}
		for i in nums {
			v -= i
		}
		return v
	}
	
	// 283
	func moveZeroes(_ nums: inout [Int]) {
		var lastNonZeroIndex = 0
		for i in nums {
			if i != 0 {
				nums[lastNonZeroIndex] = i
				lastNonZeroIndex+=1
			}
		}
		for i in lastNonZeroIndex..<nums.count {
			nums[i] = 0
		}
	}
	
	//
	func threeSum(_ nums: [Int]) -> [[Int]] {
		if nums.count < 3 {
			return []
		}
		var res = Array<Array<Int>>()
		let snums = nums.sorted {$0<$1}
		for i in 0..<(snums.count - 2) {
			if snums[i] > 0 {
				// 大于0，说明后面的值都是大于0的所以可以跳出循环了
				break
			}
			if i > 0 && snums[i] == snums[i-1] {
				// 去重
				continue
			}
			var L = i+1
			var R = snums.count - 1
			while L < R {
				let sum = snums[i] + snums[L] + snums[R]
				if sum == 0 {
					res.append([snums[i], snums[L], snums[R]])
					while L < R && snums[L] == snums[L+1] {
						if snums[L] == snums[L+1] {
							L+=1
						}
					}
					while L < R && snums[R] == snums[R-1] {
						if snums[R] == snums[R-1] {
							R-=1
						}
					}
					L+=1
					R-=1
				}
				else if sum > 0 {
					R-=1
				}
				else if sum < 0 {
					L+=1
				}
			}
		}
		return res
	}
	
	// 16
	func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
		let snums = nums.sorted{$0<$1}
		var sum = 0
		var diff = 0 - Int.max
		outer: for i in 0..<(snums.count - 2) {
			var L = i+1
			var R = snums.count - 1
			while L < R {
				let s = snums[i] + snums[L] + snums[R]
				let d = s - target
				if abs(d) < abs(diff) {
					diff = d
					sum = s
				}
				if d < 0 {
					L+=1
				}
				else if d > 0 {
					R-=1
				}
				else if d == 0 {
					break outer
				}
			}
		}
		return sum
	}
	
	// 6
	func convert(_ s: String, _ numRows: Int) -> String {
		if numRows == 1 {
			return s
		}
		var map = Dictionary<Int,String>()
		for i in 1..<(numRows+1) {
			map[i] = ""
		}
		let L = numRows*2-2
		for i in 0..<s.count {
			let remind = i%L + 1
			if remind <= numRows {
				map[remind]?.append(s[i]!)
			}
			else {
				map[numRows*2-remind]?.append(s[i]!)
			}
		}
		var re = ""
		for i in 1..<(numRows+1) {
			re.append(contentsOf: map[i]!)
		}
		return re
	}
	
	// 17
	var letterMap = [
		"2":["a","b","c"],
		"3":["d","e","f"],
		"4":["g","h","i"],
		"5":["j","k","l"],
		"6":["m","n","o"],
		"7":["p","q","r","s"],
		"8":["t","u","v"],
		"9":["w","x","y","z"],
	]
	var output = Array<String>()
	func letterCombinations(_ digits: String) -> [String] {
		if digits.count == 0 {
			return []
		}
		var strs = [String]()
		backTrack(s: &strs, digits: digits, i:0)
		return output
	}
	
	func backTrack(s: inout [String], digits: String, i: Int) {
		if i >= digits.count {
			// 基数条件
			var str = String()
			for m in s {
				str+=m
			}
			output.append(str)
		}
		else {
			let index = digits.index(digits.startIndex, offsetBy: i)
			let strs = letterMap[String(digits[index])]!
			for j in 0..<strs.count {
				s.append(strs[j])
				// 递归条件
				backTrack(s: &s, digits: digits, i:i+1)
				s.removeLast()
			}
		}
	}
	
	// 18
	func fourSum(_ nums: inout [Int], _ target: Int) -> [[Int]] {
		if nums.count < 4 {
			return []
		}
		var re = Array<Array<Int>>()
		let snums = nums.sorted{$0<$1}
		let maxSum2 = snums.last! + snums[snums.count - 2]
		let maxSum3 = snums.last! + snums[snums.count - 2] + snums[snums.count - 3]
		for i in 0..<(snums.count - 3) {
			if snums[i] * 4 > target {
				break
			}
			if i != 0 && snums[i] == snums[i-1] {
				continue
			}
			if snums[i] + maxSum3 < target {
				continue
			}
			for j in (i+1)..<(snums.count - 2) {
				if 2*(snums[i]+snums[j]) > target {
					break
				}
				if j != i+1 && snums[j] == snums[j-1] {
					continue
				}
				if snums[i] + snums[j] + maxSum2 < target {
					continue
				}
				var L = j+1
				var R = snums.count - 1
				while L < R {
					let sum = snums[i] + snums[j] + snums[L] + snums[R]
					if sum == target {
						re.append([snums[i], snums[j], snums[L], snums[R]])
						while L < R && snums[R] == snums[R-1] {
							R-=1
						}
						while L < R && snums[L] == snums[L+1] {
							L+=1
						}
						L+=1
						R-=1
					}
					else if sum > target {
						R-=1
					}
					else if sum < target {
						L+=1
					}
				}
			}
		}
		return re
	}
	
	// 19
	// 2次遍历
	//	func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
	//		if head == nil {
	//			return nil
	//		}
	//		var dummy = ListNode(0)
	//		dummy.next = head
	//		var first = head
	//		var count = 0
	//		while first != nil {
	//			count+=1
	//			first = first?.next
	//		}
	//		if n > count {
	//			return nil
	//		}
	//		var pre = dummy
	//		first = dummy.next
	//		for _ in 0..<(count - n) {
	//			pre = first!
	//			first = first?.next
	//		}
	//		pre.next = first?.next
	//		return dummy.next
	//    }
	func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
		if head == nil {
			return nil
		}
		var first = head
		for _ in 0..<n {
			first = first?.next
		}
		if first == nil {
			return head?.next
		}
		var pre = head
		var L = head
		while first != nil {
			pre = L
			L = L?.next
			first = first?.next
		}
		pre?.next = L?.next
		return head
	}
	
	// 22
	//MARK: 我自己做的回溯法
	//	var generes: Array<String> = []
	//	func generateParenthesis(_ n: Int) -> [String] {
	//		generateBack(str: "", nums: [], cuStr: "(", deep: 0, totalDeep: 2*n)
	//		return generes
	//    }
	//
	//	func generateBack(str: String, nums: Array<Int>, cuStr: String, deep: Int, totalDeep: Int) {
	//		var newStr = str
	//		var newnums = Array<Int>()
	//		var ndeep = deep
	//		newnums.append(contentsOf: nums)
	//		if cuStr == "(" {
	//			newnums.append(1)
	//		}
	//		else {
	//			newnums.append(-1)
	//		}
	//		let re = newnums.reduce(0, +)
	//		if re < 0 {
	//			return
	//		}
	//		else if deep+1 > totalDeep/2 && re > deep+1 {
	//			return
	//		}
	//		else if deep + 1 > totalDeep/2 && re < -(deep + 1) {
	//			return
	//		}
	//		else {
	//			newStr+=cuStr
	//		}
	//		ndeep+=1
	//		if ndeep == totalDeep {
	//			if re == 0 {
	//				generes.append(newStr)
	//			}
	//			return
	//		}
	//		for i in 0..<2 {
	//			generateBack(str: newStr, nums: newnums, cuStr: i == 0 ? "(" : ")", deep: ndeep, totalDeep: totalDeep)
	//		}
	//	}
	
	func generateParenthesis(_ n: Int) -> [String] {
		var res = Array<String>()
		generateBack(res: &res, cuStr: "", left: 0, right: 0, max: n)
		return res
	}
	
	func generateBack(res: inout Array<String>, cuStr: String, left: Int, right: Int, max: Int) {
		if left == max && right == max {
			res.append(cuStr)
			return
		}
		if left < max {
			let nstr = cuStr+"("
			generateBack(res: &res, cuStr: nstr, left: left+1, right: right, max: max)
		}
		if right < left {
			let nstr = cuStr+")"
			generateBack(res: &res, cuStr: nstr, left: left, right: right+1, max: max)
		}
	}
	
	//	func generateParenthesis(_ n: Int) -> Int {
	//		if n == 1 {
	//			return 1
	//		}
	//		if n == 2 {
	//			return 2
	//		}
	//		var map = [1,2]
	//		var count = 0
	//		for i in 3..<(n-3) {
	//			count = map[i-1] + map[i-2] * (i - 2) * 2 + 1
	//			map.append(count)
	//		}
	//		return count
	//	}
	
	// 24
	func swapPairs(_ head: ListNode?) -> ListNode? {
		if head == nil {
			return head
		}
		var temp: ListNode? = nil
		var node = head
		var pre: ListNode? = nil
		let first = head?.next == nil ? head : head?.next
		while node != nil {
			temp = node?.next?.next
			let t = node?.next
			t?.next = node
			node?.next = temp
			pre?.next = (t == nil ? node : t)
			pre = node
			node = node?.next
		}
		return first
	}
	
	// 29
	// 超出时间限制
	//	func divide(_ dividend: Int, _ divisor: Int) -> Int {
	//		if dividend == 0 {
	//			return 0
	//		}
	//        var div = abs(dividend)
	//		let sor = abs(divisor)
	//		var c = 0
	//		while div > 0 {
	//			div = div - sor
	//			if div >= 0 {
	//				c+=1
	//			}
	//		}
	//		if (dividend > 0 && divisor > 0) || (dividend < 0 && divisor < 0) {
	//
	//		}
	//		else {
	//			c = -c
	//		}
	//		return c
	//    }
	
	//	func divide(_ dividend: Int, _ divisor: Int) -> Int {
	//
	//	}
	
	// 31
	func nextPermutation(_ nums: inout [Int]) {
		if nums.count == 0 {
			return
		}
		var i = nums.count - 2
		while i >= 0 && nums[i+1] <= nums[i] {
			i-=1
		}
		if i >= 0 {
			var j = nums.count - 1
			while j >= 0 && nums[j] <= nums[i] {
				j-=1
			}
			nums.swapAt(i, j)
		}
		reverse31(nums: &nums, start: i+1)
	}
	
	func reverse31(nums: inout [Int], start: Int) {
		var i = start
		var j = nums.count - 1
		while i < j {
			nums.swapAt(i, j)
			i+=1
			j-=1
		}
	}
	
//	func quickSort31(nums: inout [Int], l: Int, r: Int) {
//		if l < r {
//			var i = l
//			var j = r
//			let x = nums[i]
//			while i < j {
//				while i < j && nums[j] > x {
//					j-=1
//				}
//				if i < j {
//					nums[i] = nums[j]
//				}
//				while i < j && nums[i] < x {
//					i+=1
//				}
//				if i < j {
//					nums[j] = nums[i]
//				}
//			}
//			nums[i] = x
//			quickSort31(nums: &nums, l: l, r: i-1)
//			quickSort31(nums: &nums, l: i+1, r: r)
//		}
//	}
	
	func isMaxPermutation(nums: [Int]) -> Bool {
		var pre = nums[0]
		for num in nums {
			if num <= pre {
				pre = num
			}
			else {
				return false
			}
		}
		return true
	}
	
	// 100
	func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
		if p == nil || q == nil {
			return true
		}
		if p == nil || q == nil {
			return false
		}
		if p!.val != q!.val {
			return false
		}
		return isSameTree(p!.left,q!.left) && isSameTree(p!.right,q!.right)
	}
	
	// 997
	func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
		var gra = [[Int]]()
		
		return 0
	}
	
	// 34 二分查找的临界条件极难找
	func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
		if nums.count == 0 {
			return [-1,-1]
		}
		var targetRane = [-1,-1]
		let left = twoSearch(nums, target: target, isStart: true)
		if left == nums.count || nums[left] != target {
			return targetRane
		}
		targetRane[0] = left
		targetRane[1] = twoSearch(nums, target: target, isStart: false) - 1;
		return targetRane
	}
	
	private func twoSearch(_ a: [Int], target: Int, isStart: Bool) -> Int {
		var start = 0
		var end = a.count
		while start < end  {
			let mid = (start + end)/2
			if a[mid] > target || (isStart && target == a[mid]) {
				end = mid
			}
			else {
				start = mid + 1
			}
		}
		return start
	}
	
	//36
	func isValidSudoku(_ board: [[Character]]) -> Bool {
		
		// 行
		for i in 0..<9 {
			var arr = [Character]()
			for j in 0..<9 {
				let ch = board[i][j]
				if ch == "." {
					continue
				}
				else {
					if arr.contains(ch) {
						return false
					}
					else {
						arr.append(board[i][j])
					}
				}
			}
		}
		
		//列
		for i in 0..<9 {
			var arr = [Character]()
			for j in 0..<9 {
				let ch = board[j][i]
				if ch == "." {
					continue
				}
				else {
					if arr.contains(ch) {
						return false
					}
					else {
						arr.append(board[j][i])
					}
				}
			}
		}
		
		// 小宫格
		
		for i in stride(from: 0, to: 9, by: 3) {
			for j in stride(from: 0, to: 9, by: 3) {
				var arr = [Character]()
				for m in i..<(i+3) {
					for n in j..<(j+3) {
						let ch = board[m][n]
						if ch == "." {
							continue
						}
						else {
							if arr.contains(ch) {
								return false
							}
							else {
								arr.append(board[m][n])
							}
						}
					}
				}
			}
		}
		return true
	}
	
	func isValidSudoku1(_ board: [[Character]]) -> Bool {
		var rows = Dictionary<Int,Dictionary<Int, Int>>()
		var columns = Dictionary<Int,Dictionary<Int, Int>>()
		var boxs = Dictionary<Int,Dictionary<Int, Int>>()
		for i in 0..<9 {
			for j in 0..<9 {
				if j == 0 {
					rows[i] = [j+1:0]
					columns[i] = [j+1:0]
					boxs[i] = [j+1:0]
				}
				else {
					rows[i]![j+1] = 0
					columns[i]![j+1] = 0
					boxs[i]![j+1] = 0
				}
			}
		}
		for i in 0..<9 {
			for j in 0..<9 {
				if board[i][j] == "." {
					continue
				}
				let boxIndex = (i/3)*3 + j/3
				let c = Int(String(board[i][j]))!
				rows[i]![c]!+=1
				columns[j]![c]!+=1
				boxs[boxIndex]![c]!+=1
				if rows[i]![c]! > 1 || columns[j]![c]! > 1 || boxs[boxIndex]![c]! > 1 {
					return false
				}
			}
		}
		return true
	}
	
	// 39
	func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
		var cand = candidates.sorted {$0<$1}
		var i = cand.count - 1
		for j in 0..<cand.count {
			if cand[j] >= target {
				i = j
				break
			}
		}
		cand = Array(cand[0...i])
		var arr = [[Int]]()
		var subArr = [Int]()
		combinationSumSub(&arr, &subArr, cand: cand, target: target, index: 0)
		return arr
	}
	
	private func combinationSumSub(_ a: inout [[Int]], _ b: inout [Int], cand: [Int], target: Int, index: Int) {
		for i in index..<cand.count {
			let sum = b.reduce(0, +)
			if sum + cand[i] == target {
				var arr = Array(b)
				arr.append(cand[i])
				a.append(arr)
			}
			else if sum + cand[i] > target {
				return
			}
			else if sum + cand[i] < target {
				b.append(cand[i])
				print("-- b = \(b)")
				combinationSumSub(&a, &b, cand: cand, target: target, index: i)
				b.removeLast()
				print("b = \(b)")
			}
		}
	}
	
	// 43
	func multiply(_ num1: String, _ num2: String) -> String {
		if isAllZero(num1) || isAllZero(num2) {
			return "0"
		}
		var re: String = String()
		for i in (0..<(num1.count)).reversed() {
			var jinWei = 0
			var subString = String()
			let index = num1.index(num1.startIndex, offsetBy: i)
			let n: Int = Int(String(num1[index]))!
			for j in (0..<(num2.count)).reversed() {
				let jindex = num2.index(num2.startIndex, offsetBy: j)
				let m: Int = Int(String(num2[jindex]))!
				var ji = m*n + jinWei
				if ji >= 10 {
					jinWei = ji/10
					ji = ji%10
				}
				else {
					jinWei = 0
				}
				subString  = String(ji) + subString
			}
			if jinWei != 0 {
				subString = String(jinWei) + subString
			}
			for j in 0..<(num1.count - 1 - i) {
				subString += "0"
			}
			// 此时的substring为最终的string 将这个string 和 re 相加
			re = stringPlus(re, subString)
		}
		return re
	}
	
	private func stringPlus(_ a: String, _ b: String) -> String {
		let maxL = a.count < b.count ? b.count : a.count
		var isJinWei = false
		var subString = String()
		for m in 0..<maxL {
			var re = 0
			let aIndex = a.count - m - 1
			let bIndex = b.count - m - 1
			if m < b.count && m < a.count {
				let asIndex = a.index(a.startIndex, offsetBy: aIndex)
				let bsIndex = b.index(b.startIndex, offsetBy: bIndex)
				let z: Int = Int(String(a[asIndex]))!
				let y: Int = Int(String(b[bsIndex]))!
				re = z+y + (isJinWei ? 1 : 0)
			}
			else if m >= a.count {
				let bsIndex = b.index(b.startIndex, offsetBy: bIndex)
				let y: Int = Int(String(b[bsIndex]))!
				re = y + (isJinWei ? 1 : 0)
			}
			else if m >= b.count {
				let asIndex = a.index(a.startIndex, offsetBy: aIndex)
				let z: Int = Int(String(a[asIndex]))!
				re = z + (isJinWei ? 1 : 0)
			}
			if re >= 10 {
				re%=10
				isJinWei = true
			}
			else {
				isJinWei = false
			}
			subString = String(re) + subString
		}
		if isJinWei {
			subString = String(1) + subString
		}
		return subString
	}
	
	private func isAllZero(_ a: String) -> Bool {
		for i in 0..<(a.count) {
			let index = a.index(a.startIndex, offsetBy: i)
			let n = Int(String(a[index]))
			if n != 0 {
				return false
			}
		}
		return true
	}
	
	// 46
	func permute(_ nums: [Int]) -> [[Int]] {
		if nums.count == 1 {
			return [nums]
		}
		var re = [[Int]]()
		var arr = [Int]()
		permuteRecursion(nums, &re, &arr)
		return re
	}
	
	func permuteRecursion(_ num: [Int], _ re: inout [[Int]], _ arr: inout [Int]) {
		for i in 0..<num.count {
			if arr.contains(num[i]) {
				continue
			}
			else {
				arr.append(num[i])
				if arr.count == num.count {
					let list = Array(arr)
					re.append(list)
					arr.removeLast()
					return
				}
				else {
					permuteRecursion(num, &re, &arr)
					arr.removeLast()
				}
			}
		}
	}
	
	// 48
	func rotate1(_ matrix: inout [[Int]]) {
		if matrix.count == 1 {
			return
		}
		for i in 0..<(matrix.count/2 + matrix.count%2) {
			for j in 0..<matrix.count/2 {
				
				// i 是行 j 是列
				var oi = i
				var oj = j
				var column = matrix.count - 1 - oi
				var row = oj
				var a = 0
				var b = matrix[oi][oj]
				for _ in 0..<4 {
					a = matrix[row][column]
					matrix[row][column] = b
					b = a
					oi = row
					oj = column
					row = oj
					column = matrix.count - 1 - oi
				}
			}
		}
	}
	
	// 5
	func longestPalindrome(_ s: String) -> String {
		if s.count == 0 {
			return s
		}
		var start = 0
		var end = 0
		for i in 0..<s.count {
			let l1 = expandAroundCenter(s: s, left: i, right: i)
			let l2 = expandAroundCenter(s: s, left: i, right: i+1)
			let maxl = max(l1, l2)
			if maxl > end - start {
				start = i - (maxl - 1)/2
				end = i + maxl/2
			}
		}
		let l = s.index(s.startIndex, offsetBy: start)
		let r = s.index(s.startIndex, offsetBy: end)
		return String(s[l...r])
	}
	
	func expandAroundCenter(s: String, left: Int, right: Int) -> Int {
		var L = left
		var R = right
		while L >= 0 && R < s.count && s[s.index(s.startIndex, offsetBy: L)] == s[s.index(s.startIndex, offsetBy: R)] {
			L-=1
			R+=1
		}
		return R - L  - 1
	}
	
	// 12
	func intToRoman(_ num: Int) -> String {
		let nums = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
		let romans = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
		var s = String()
		var val = num
		for i in (0..<nums.count) {
			let a = val/nums[i]
			if a == 0 {
				
				continue
			}
			for _ in 0..<a {
				s = s + romans[i]
			}
			val-=(a*nums[i])
			if val == 0 {
				break
			}
		}
		return s
	}
	//	func intToRoman(_ num: Int) -> String {
	//		let roman = ["I","V","X","L","C","D","M"]
	//		var s = String()
	//		for i in 0..<4 {
	//			let m = nPower(num: 10, n: i)
	//			let val = (num/m)%10
	//			s =  intToRomanEx(val, t: i*2, roman: roman) + s
	//		}
	//		return s
	//	}
	//
	//	func nPower(num: Int, n: Int) -> Int {
	//		if num == 0 {
	//			return 0
	//		}
	//		if n == 0 {
	//			return 1
	//		}
	//		if n == 1 {
	//			return num
	//		}
	//		var result = num
	//		for _ in 1..<n {
	//			result*=num
	//		}
	//		return result
	//	}
	//
	//	func intToRomanEx(_ num: Int, t: Int, roman: [String]) -> String {
	//		if num == 0 {
	//			return ""
	//		}
	//
	//		var s = String()
	//
	//		let n = roman[t]
	//		let j = roman[(t+1 < roman.count ? t+1 : t)]
	//		let m = roman[(t+2 < roman.count ? t+2 : t)]
	//		if num <= 3 {
	//			for _ in 0..<num {
	//				s = s + n
	//			}
	//		}
	//		else if num == 4 {
	//			s = s + n + j
	//		}
	//		else if num >= 5  && num <= 8 {
	//			s = s + j
	//			for _ in 0..<(num - 5) {
	//				s = s + n
	//			}
	//		}
	//		else {
	//			s = s + n + m
	//		}
	//		return s
	//	}
	
	// 23
	// 分治
	func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
		if lists.count == 0 {
			return nil
		}
		if lists.count == 1 {
			return lists[0]
		}
		return mergeKListsMerge(lists, left: 0, right: lists.count - 1)
	}
	
	func mergeKListsMerge(_ lists: [ListNode?], left: Int, right: Int) -> ListNode? {
		if left == right {
			return lists[left]
		}
		let mid = (left + right)/2
		let l1 = mergeKListsMerge(lists, left: left, right: mid)
		let l2 = mergeKListsMerge(lists, left: mid+1, right: right)
		return mergeTwoListsRes(l1, l2)
	}
	// 暴力法
	//	func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
	//		if lists.count  == 0 {
	//			return nil
	//		}
	//		if lists.count == 1 {
	//			return lists[0]
	//		}
	//		var nums = [ListNode]()
	//		var root = lists[0]
	//		for i in 0..<lists.count {
	//			root = lists[i]
	//			while root != nil {
	//				nums.append(root!)
	//				root = root?.next
	//			}
	//		}
	//		mergeKListsQuickSort(&nums, L: 0, R: nums.count - 1)
	//		root = ListNode.init(0)
	//		let p = root
	//		for i in 0..<nums.count {
	//			root?.next = nums[i]
	//			root = root?.next
	//		}
	//		return p?.next
	//	}
	//
	//	func mergeKListsQuickSort(_ a: inout [ListNode], L: Int, R: Int) {
	//		if L < R {
	//			var i = L
	//			var j = R
	//			let temp = a[i]
	//			while i < j {
	//				while i < j && a[j].val >= temp.val {
	//					j-=1
	//				}
	//				//			if i < j {
	//				a[i] = a[j]
	//				//			}
	//				while i < j && a[i].val <= temp.val {
	//					i+=1
	//				}
	//				//			if i < j {
	//				a[j] = a[i]
	//				//			}
	//			}
	//			a[i] = temp
	//			mergeKListsQuickSort(&a, L: L, R: i - 1)
	//			mergeKListsQuickSort(&a, L: i+1, R: R)
	//		}
	//	}
	
	// 25 没做完
	func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
		if head == nil || k == 1 {
			return head
		}
		var len = 0
		var node = head
		while node != nil {
			len+=1
			node = node?.next
		}
		let count = len/k
		let dummy = ListNode(0)
		dummy.next = head
		var nhead = dummy
		var slow = head
		var fast = head?.next
		var tail = head
		for i in 0..<count {
			for j in 0..<k-1 {
				if j == 0 {
					tail = slow
				}
				let tmp = fast?.next
				fast?.next = slow
				slow = fast
				fast = tmp
			}
			if i == 0 {
				dummy.next = slow
			}
			nhead.next = slow
			tail?.next = fast
			nhead = tail!
			slow = fast
			fast = fast?.next
		}
		return dummy.next
	}
	

	
	// 33 二分查找   临界点
	func search(_ nums: [Int], _ target: Int) -> Int {
		var L = 0
		var R = nums.count - 1
		while L < R {
			let M = (L + R)/2
			if (nums[L] <= target && nums[M] >= target) || (nums[M] < nums[L] && (target <= nums[M] || target > nums[R])) {
				R = M
			}
			else  {
				L = M + 1
			}
		}
		return L == R && nums[L] == target ? L : -1
	}
	
	// 49
	func groupAnagrams(_ strs: [String]) -> [[String]] {
		var hashMap = Dictionary<String, [String]>()
		for str in strs {
			var cs = [Character]()
			for c in str {
				cs.append(c)
			}
			cs.sort { $0<$1 }
			let csstr = String.init(cs)
			if hashMap[csstr] == nil {
				var list = [String]()
				list.append(str)
				hashMap[csstr] = list
			}
			else {
				hashMap[csstr]?.append(str)
			}
		}
		var list = [[String]]()
		for (_, value) in hashMap {
			list.append(value)
		}
		return list
	}
	
	// 50
	func myPow(_ x: Double, _ n: Int) -> Double {
		let res = myPowMerge(x, abs(n))
		return n < 0 ? 1/res : res
	}
	
	func myPowMerge(_ x: Double, _ n: Int) -> Double {
		if n == 0 {
			return 1.0
		}
		let res = myPowMerge(x, n/2)
		if n%2 == 0 {
			return res * res
		}
		else {
			return res * res * x
		}
	}
	
	// 54
	func spiralOrder(_ matrix: [[Int]]) -> [Int] {
		if matrix.count == 0 {
			return []
		}
		if matrix.count == 1 {
			return matrix[0]
		}
		var res = [Int]()
		var left = 0
		var top = 0
		var right = matrix[0].count - 1
		var bottom = matrix.count - 1
		while true {
			for i in left...right {
				res.append(matrix[top][i])
			}
			top+=1
			if top > bottom {
				break
			}
			
			for i in top...bottom {
				res.append(matrix[i][right])
			}
			right-=1
			if right < left {
				break
			}
			
			for i in (left...right).reversed() {
				res.append(matrix[bottom][i])
			}
			bottom-=1
			if bottom < top {
				break
			}
			
			for i in (top...bottom).reversed() {
				res.append(matrix[i][left])
			}
			left+=1
			if left > right {
				break
			}
		}
		return res
	}
	
	// 55
	func canJump(_ nums: [Int]) -> Bool {
		if nums.count == 1 {
			return true
		}
		if nums.count == 0 {
			return false
		}
		var res = false
		var i = 0
		var end = nums[i]
		while i <= end {
			if i == end && nums[i] == 0 {
				break
			}
			var index = i
			while true {
				if nums[index] == 0 {
					break
				}
				index+=nums[index]
				if index >= nums.count - 1 {
					res  = true
					break
				}
			}
			if res {
				break
			}
			i+=1
			end = end > (i + nums[i]) ? end : (i + nums[i])
		}
		return res
	}
	
	func canJump1(_ nums: [Int]) -> Bool {
		var k = 0
		for i in 0..<nums.count {
			if i > k {
				return false
			}
			k = max(k, i+nums[i])
		}
		return true
	}
	
	// 56 合并区间
	// 关键是排序这一步，能想到基本上就解开了，下面的逻辑花点时间去死扣就能扣出来，只不过这个逻辑最简洁
	func merge56(_ intervals: [[Int]]) -> [[Int]] {
		if intervals.count == 0 || intervals.count == 1 {
			return intervals
		}
		var res: [[Int]] = Array.init()
		let ans = intervals.sorted { (s1, s2) -> Bool in
			return s1[0] < s2[0]
		}
		var i = 0
		while i < ans.count {
			let left = ans[i][0]
			var right = ans[i][1]
			while i < ans.count - 1 && ans[i + 1][0] <= right {
				i+=1
				right = max(right, ans[i][1])
			}
			res.append([left, right])
			i+=1
		}
		return res
	}
	
	// 58
	//	func lengthOfLastWord(_ s: String) -> Int {
	//		if s.count == 0 {
	//			return 0
	//		}
	//		var index = 0
	//		var isStart = true
	//		var lastIsW = false
	//		for char in s.unicodeScalars {
	//			let ch = Character(char)
	//			if isStart {
	//				if ch == " " {
	//					lastIsW = true
	//				}
	//				else {
	//					index+=1
	//				}
	//				isStart = false
	//			}
	//			else {
	//				if ch == " " {
	//					lastIsW = true
	//				}
	//				else {
	//					if lastIsW {
	//						index = 0
	//					}
	//					lastIsW = false
	//					index+=1
	//				}
	//			}
	//		}
	//		return index
	//    }
	
	func lengthOfLastWord(_ s: String) -> Int {
		if s.count == 0 {
			return 0
		}
		var end = s.count - 1
		while end >= 0 && s[end] == " " {
			end-=1
		}
		if end < 0 {
			return 0
		}
		var start = end
		while start >= 0 && s[start] != " " {
			start-=1
		}
		return end - start
	}
	
	// 60
	private var used: [Bool] = Array.init()
	private var factorial: [Int] = [Int]()
	private var n: Int = 0
	private var k: Int = 0
	private var path: [Int] = [Int]()
	func getPermutation(_ n: Int, _ k: Int) -> String {
		self.n = n
		self.k = k
		for _ in 0...n {
			used.append(false)
			factorial.append(1)
		}
		for i in 1...n {
			factorial[i] = factorial[i-1]*i
		}
		dfs60(0)
		var str = String()
		for n in path {
			str = str+String(n)
		}
		return str
	}
	
	func dfs60(_ index: Int) {
		if index == n {
			return ;
		}
		let cnt = factorial[n - 1 - index]
		for i in 1...n {
			if used[i] {
				continue
			}
			if cnt < k {
				k-=cnt
				continue
			}
			used[i] = true
			path.append(i)
			dfs60(index+1)
		}
	}
	
	// 61
	func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
		if head == nil {
			return head
		}
		var count = 0
		var node = head
		while node != nil {
			node = node?.next
			count+=1
		}
		let n = k%count
		if n == 0 {
			return head
		}
		node = head
		for _ in 0..<(count-n-1) {
			node = node?.next
		}
		let nhead = node?.next
		node?.next = nil
		node = nhead
		while node?.next != nil {
			node = node?.next
		}
		node?.next = head
		return nhead
	}
	
	// 62
	func uniquePaths(_ m: Int, _ n: Int) -> Int {
		if m == 1 || n == 1 {
			return 1
		}
		// 填充数组
		var ans = [[Int]]()
		for _ in 0..<m {
			var  tem = [Int]()
			for _ in 0..<n {
				tem.append(1)
			}
			ans.append(tem)
		}
		for i in 1..<m {
			for j in 1..<n {
				ans[i][j] = ans[i-1][j] + ans[i][j-1]
			}
		}
		return ans[m - 1][n - 1]
	}
	
	// 63
	func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
		var res = Array.init(obstacleGrid)
		let m = res.count // 行
		let n = res[0].count // 列
		if res[0][0] == 1 || res[m-1][n-1] == 1 {
			return 0
		}
		res[0][0] = 1
		// 在这里，res[i][j] == 0 时为不能通过，和下面的是相反的，这里注意一下
		for i in 1..<m {
			res[i][0] = (res[i][0] == 0 && res[i-1][0] == 1) ? 1 : 0
		}
		for j in 1..<n {
			res[0][j] = (res[0][j] == 0 && res[0][j-1] == 1) ? 1: 0
		}
		// 从1开始,所以res[i][j] == 1时为有障碍
		for i in 1..<m {
			for j in 1..<n {
				if res[i][j] == 0 {
					res[i][j] = res[i][j-1] + res[i-1][j]
				}
				else {
					res[i][j] = 0
				}
			}
		}
		return res[m-1][n-1]
	}
	
	//73
	func setZeroes(_ matrix: inout [[Int]]) {
		if matrix.count == 0 {
			return
		}
		let m = matrix.count
		let n = matrix[0].count
		var ms = [Int]()
		var ns = [Int]()
		for i in 0..<m {
			for j in 0..<n {
				if matrix[i][j] == 0 {
					if !ms.contains(i) {
						ms.append(i)
					}
					if !ns.contains(j) {
						ns.append(j)
					}
				}
			}
		}
		for num in ms {
			for i in 0..<n {
				matrix[num][i] = 0
			}
		}
		for num in ns {
			for i in 0..<m {
				matrix[i][num] = 0
			}
		}
	}
	
	// 74
	func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
		if matrix.count == 0 {
			return false
		}
		if matrix[0][0] == target {
			return true
		}
		var left = 0
		var right = matrix.count*matrix[0].count - 1
		var mid = 0
		while left < right {
			mid = (left + right)/2
			let m = mid/matrix[0].count
			let n = mid%matrix[0].count
			if matrix[m][n] == target {
				return true
			}
			else if matrix[m][n] > target {
				right = mid - 1
			}
			else {
				left = mid + 1
			}
		}
		return false
	}
	
	// 75
	//	func sortColors(_ nums: inout [Int]) {
	//        var ans = [Int]()
	//		for _ in 0..<3 {
	//			ans.append(0)
	//		}
	//		for num in nums {
	//			ans[num]+=1
	//		}
	//		nums.removeAll()
	//		for i in 0..<3 {
	//			while ans[i] != 0 {
	//				nums.append(i)
	//				ans[i]-=1
	//			}
	//		}
	//    }
	
	func sortColors(_ nums: inout [Int]) {
		var p0 = 0
		var p1 = nums.count - 1
		var i = 0
		while i <= p1 {
			if nums[i] == 0 {
				nums.swapAt(i, p0)
				p0+=1
				i+=1
			}
			else if nums[i] == 2 {
				nums.swapAt(i, p1)
				p1-=1
				// 这里不能i+=1，因为p1和i交换之后，并不能确定i的值（有可能是0，1，2），所以下次循环还要对i位置上的元素做一个判断
			}
			else {
				i+=1
			}
		}
	}
	
	// 77
	func combine(_ n: Int, _ k: Int) -> [[Int]] {
		var res = [[Int]]()
		var ans = [Int]()
		backtrack77(ans: &ans, res: &res, n: n, k: k, index: 1)
		return res
	}
	
	func backtrack77(ans: inout [Int], res: inout [[Int]], n: Int, k: Int, index: Int) {
		if ans.count == k {
			res.append(Array.init(ans))
			print(ans)
			return
		}
		for i in index..<(n+1) {
			ans.append(i)
			backtrack77(ans: &ans, res: &res, n: n, k: k, index: i+1)
			ans.removeLast()
		}
	}
	
	// 78
	func subsets(_ nums: [Int]) -> [[Int]] {
		if nums.count == 1 {
			return [nums,[]]
		}
		let n = nums.count
		var res = [[Int]]()
		var ans = [Int]()
		for i in 0...n {
			backtranck78(ans: &ans, res: &res, arr: nums, n: n, k: i, index: 0)
			ans.removeAll()
		}
		return res
	}
	
	func backtranck78(ans: inout [Int], res: inout [[Int]], arr: [Int], n: Int, k: Int, index: Int) {
		if ans.count == k {
			res.append(Array.init(ans))
			return ;
		}
		for i in index..<n {
			ans.append(arr[i])
			backtranck78(ans: &ans, res: &res, arr: arr, n: n, k: k, index: i+1)
			ans.removeLast()
		}
	}
	
	// 79
	var m79 = 0
	var n79 = 0
	var used79 = [[Bool]]()
	var board79 = [[Character]]()
	var word79 = String()
	var direction79 = [[1,0],[-1,0],[0,1],[0,-1]]
	func exist(_ board: [[Character]], _ word: String) -> Bool {
		board79 = board
		word79 = word
		m79 = board.count
		n79 = board[0].count
		for _ in 0..<board.count {
			var ans = [Bool]()
			for _ in 0..<board[0].count {
				ans.append(false)
			}
			used79.append(ans)
		}
		for i in 0..<board.count {
			for j in 0..<board[0].count {
				if dfs79(i: i, j: j, start: 0) {
					return true
				}
			}
		}
		return false
	}
	
	func inArea79(x: Int, y: Int) -> Bool {
		if x >= 0 && x < m79 && y >= 0 && y < n79 {
			return true
		}
		return false
	}
	
	func dfs79(i: Int, j: Int, start: Int) -> Bool {
		if start == word79.count - 1 {
			return board79[i][j] == word79[start]
		}
		if board79[i][j] == word79[start] {
			used79[i][j] = true
			for m in 0..<4 {
				let x = i + direction79[m][0]
				let y = j + direction79[m][1]
				if inArea79(x: x, y: y) && used79[x][y] == false {
					if dfs79(i: x, j: y, start: start + 1) {
						return true
					}
				}
			}
			used79[i][j] = false
		}
		return false
	}
	
	// 80
	func removeDuplicates80(_ nums: inout [Int]) -> Int {
		if nums.count == 0 {
			return 0
		}
		var n = nums[0]
		var count = 1
		var index = 1
		while index < nums.count {
			if n == nums[index] {
				if count == 2  {
					nums.remove(at: index)
				}
				else {
					count+=1
					index+=1
				}
			}
			else {
				n = nums[index]
				count = 1
				index+=1
			}
		}
		return nums.count
	}
	
	func search(_ nums: [Int], _ target: Int) -> Bool {
		var left = 0
		var right = nums.count - 1
		while left <= right {
			let mid = (left + right)/2
			if nums[mid] == target {
				return true
			}
			if nums[left] == nums[mid] {
				left+=1
				continue
			}
			if nums[left] < nums[mid] {
				// 前半部分有序
				if nums[mid] > target && nums[left] <= target {
					right = mid - 1
				}
				else {
					left = mid + 1
				}
			}
			else {
				// 后半部分有序
				if nums[mid] < target && nums[right] >= target {
					left = mid + 1
				}
				else {
					right = mid - 1
				}
			}
		}
		return false
	}
	
	// 82
	func deleteDuplicates82(_ head: ListNode?) -> ListNode? {
		let dummy = ListNode.init(0)
		dummy.next = head
		var slow = dummy
		var fast = dummy.next
		var flag = false
		while fast != nil {
			while fast?.next != nil && fast?.val == fast?.next?.val {
				fast = fast?.next
				flag = true
			}
			if !flag {
				slow = slow.next!
			}
			else {
				slow.next = fast?.next
			}
			fast = fast?.next
			flag = false
		}
		return dummy.next
	}
	
	// 86
	func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
		let dummy = ListNode.init(0)
		dummy.next = head
		var slow = dummy
		var fast = slow.next
		var new: ListNode?
		var p = new
		while fast != nil {
			if fast!.val < x {
				if new == nil {
					p = fast
				}
				new?.next = fast
				new = fast
				fast = fast?.next
				slow.next = fast
			}
			else {
				slow = fast!
				fast = fast?.next
			}
		}
		new?.next = dummy.next
		return p == nil ? head : p
	}
	
	// 89
	func grayCode(_ n: Int) -> [Int] {
		var res = [Int]()
		res.append(0)
		for i in 0..<n {
			let add = 1 << i
			for j in (0..<res.count).reversed() {
				res.append(res[j]+add)
			}
		}
		return res
	}
	
	// 90
	var res90 = [[Int]]()
	func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
		var ans = [Int]()
		let ns = nums.sorted {$0<$1}
		for i in 0...ns.count {
			backtrack90(k: i, ans: &ans,nums: ns, index: 0)
		}
		return res90
	}
	
	func backtrack90(k: Int, ans: inout [Int], nums: [Int], index: Int) {
		if ans.count == k {
			res90.append(ans)
			return
		}
		for i in index..<nums.count {
			// 横向剪枝
			if i > index && nums[i] == nums[i-1] {
				continue
			}
			ans.append(nums[i])
			backtrack90(k: k, ans: &ans, nums: nums, index: i+1)
			ans.removeLast()
		}
	}
	
	// 91
	func numDecodings(_ s: String) -> Int {
		if s.count == 0 {
			return s.count
		}
		var nums = [Int]()
		for n in s {
			nums.append(Int(String(n))!)
		}
		if nums[0] == 0 {
			return 0
		}
		var pre = 1
		var cur = 1
		for i in 1..<nums.count {
			let tmp = cur
			if nums[i] == 0 {
				if nums[i-1] == 1 || nums[i-1] == 2 {
					//FIXME:- nums[i] == 0 dp[i] = dp[i-2] ??? 不太懂
					cur = pre
				}
				else {
					return 0
				}
			}
			else {
				if (nums[i-1] == 2 && nums[i] <= 6) || nums[i-1] == 1 {
					cur = cur + pre
				}
			}
			pre = tmp
		}
		return cur
	}
	
	// 92
	func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
		if m == 1 {
			return reverseN(head, n: n)
		}
		head?.next = reverseBetween(head?.next, m - 1, n - 1)
		return head
	}
	
	var succsor92: ListNode?
	func reverseN(_ head: ListNode?, n: Int) -> ListNode? {
		if n == 1 {
			succsor92 = head?.next
			return head
		}
		let p = reverseN(head?.next, n: n-1)
		head?.next?.next = head
		head?.next = succsor92
		return p
	}
	
	//	func rescuir92(node: ListNode?, k: Int, m: Int) -> ListNode? {
	//		if m == k {
	//			return node
	//		}
	//		let p = rescuir92(node: node?.next, k: k+1, m: m)
	//		node?.next?.next = p
	//		node?.next = nil
	//		return p
	//	}
	
	// 93
	func restoreIpAddresses(_ s: String) -> [String] {
		if s.count < 4 || s.count > 12 {
			return []
		}
		var res = [String]()
		var ans = [String]()
		dfs93(k: 0, begin: 0, res: &res, ans: &ans, s: s)
		return res
	}
	
	func dfs93(k: Int, begin: Int, res: inout [String], ans: inout [String], s: String) {
		if begin == s.count {
			if k == 4 {
				let str = ans[0] + "." + ans[1] + "." + ans[2] + "." + ans[3]
				res.append(str)
				return
			}
		}
		// 4 - k 表示剩余的ip段的个数，如果当前剩下的字符小于4-k则不可以
		// 3 * (4 - k)代表假如剩下的字符都是3个，最多也只需要3*(4-k)个数，如果剩余的字符大于这个值，也不可以
		if s.count - begin < 4 - k || s.count - begin > 3 * (4 - k) {
			return ;
		}
		for i in 0..<3 {
			// 因为循环是3次，最大值可以取到2，但是单个字符串的长度并不是每个都是3
			if begin + i >= s.count {
				break
			}
			let flag = judgeIsIpSegment(begin: begin, end: begin + i, s: s)
			if flag {
				let startIndex = s.index(s.startIndex, offsetBy: begin)
				let endIndex = s.index(s.startIndex, offsetBy: begin+i)
				let str = String(s[startIndex...endIndex])
				ans.append(str)
				dfs93(k: k+1, begin: begin + i + 1, res: &res, ans: &ans, s: s)
				ans.removeLast()
			}
		}
	}
	
	func judgeIsIpSegment(begin: Int, end: Int, s: String) ->Bool {
		let len = end - begin + 1
		if len > 1 && s[begin] == Character("0") {
			return false
		}
		var res = 0
		for i in 0..<len {
			res = res * 10 + Int(String(s[begin+i]!))!
		}
		return res >= 0 && res <= 255
	}
	
	// 94
	//	func inorderTraversal(_ root: TreeNode?) -> [Int] {
	//        var res = [Int]()
	//		inorder_tree(root, res: &res)
	//		return res
	//    }
	//
	//	func inorder_tree(_ root: TreeNode?, res: inout [Int]) {
	//		if root == nil {
	//			return
	//		}
	//		inorder_tree(root?.left, res: &res)
	//		res.append(root!.val)
	//		inorder_tree(root?.right, res: &res)
	//	}
	
	func inorderTraversal(_ root: TreeNode?) -> [Int] {
		var res = [Int]()
		var stack = Stack<TreeNode>()
		var r = root
		while r != nil || stack.cout() != 0 {
			while r != nil {
				stack.push(e: r)
				r = r?.left
			}
			r = stack.peek()
			stack.pop()
			res.append(r!.val)
			r = r?.right
		}
		return res
	}
	
	func preorderTraversal(_ root: TreeNode?) -> [Int] {
		var res = [Int]()
		var stack = Stack<TreeNode>()
		var p = root
		while p != nil || stack.cout() != 0 {
			while p != nil {
				res.append(p!.val)
				stack.push(e: p?.right)
				p = p?.left
			}
			p = stack.pop()
		}
		return res
	}
	
	// 95
	
	func generateTrees(_ n: Int) -> [TreeNode?] {
		if n == 0 {
			return []
		}
		return getAns(start: 1, end: n)
	}
	
	func getAns(start: Int, end: Int) ->[TreeNode?] {
		var ans = [TreeNode?]()
		if start > end {
			ans.append(nil)
			return ans
		}
		if start == end {
			let tree = TreeNode.init(start)
			ans.append(tree)
			return ans
		}
		for i in start...end {
			let leftTrees = getAns(start: start, end: i-1)
			let rightTrees = getAns(start: i+1, end: end)
			for leftTree in leftTrees {
				for rightTree in rightTrees {
					let root = TreeNode.init(i)
					root.left = leftTree
					root.right = rightTree
					ans.append(root)
				}
			}
		}
		return ans
	}
	
	//96
	func numTrees(_ n: Int) -> Int {
		var dp = [Int]()
		for _ in 0...n {
			dp.append(0)
		}
		dp[0] = 1
		dp[1] = 1
		for i in 2...n {
			for j in 1...i {
				dp[i] = dp[i] + dp[j-1]*dp[i-j]
			}
		}
		return dp[n]
	}
	//	func numTrees(_ n: Int) -> Int {
	//		if n == 1 {
	//			return 1
	//		}
	//		return getAns96(start: 1, end: n)
	//    }
	
	func getAns96(start: Int, end: Int) -> Int {
		var count = 0
		if start > end {
			return 1
		}
		if start == end {
			return 1
		}
		for i in start...end {
			let leftCount = getAns96(start: start, end: i-1)
			let rightCount = getAns96(start: i+1, end: end)
			count+=(leftCount*rightCount)
		}
		return count
	}
	
	// 98
	func isValidBST(_ root: TreeNode?) -> Bool {
		return backtrack98(root, lower: nil, upper: nil)
	}
	
	func backtrack98(_ root: TreeNode?, lower: Int?, upper: Int?) -> Bool {
		if root == nil {
			// 到头了
			return true
		}
		let val = root!.val
		if lower != nil && val <= lower! {
			return false
		}
		if upper != nil && val >= upper! {
			return false
		}
		if !backtrack98(root?.left, lower: lower, upper: val) {
			return false
		}
		if !backtrack98(root?.right, lower: val, upper: upper) {
			return false
		}
		return true
	}
	
	// 101
	//	func isSymmetric(_ root: TreeNode?) -> Bool {
	//        return isMirror101(root, root)
	//    }
	//
	//	func isMirror101(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
	//		if left == nil && right == nil {
	//			// 到底部了
	//			return true
	//		}
	//		if left == nil || right == nil {
	//			return false
	//		}
	//		return left!.val == right?.val && isMirror101(left!.left, right!.right) && isMirror101(left!.right, right!.left)
	//	}
	func isSymmetric(_ root: TreeNode?) -> Bool {
		var ans = [TreeNode?]()
		ans.append(root)
		while ans.count != 0 {
			var tmp = [TreeNode?]()
			var nilCount = 0
			for i in 0..<ans.count {
				let len = ans.count
				let l = ans[i]
				let r = ans[len-i-1]
				if l == nil && r == nil {
					nilCount+=1
				}
				else if l != nil || r != nil {
					return false
				}
				else {
					if l!.val == r!.val {
					}
					else {
						return false
					}
				}
				tmp.append(ans[i]?.left)
				tmp.append(ans[i]?.right)
			}
			if nilCount == ans.count {
				return false
			}
			ans.removeAll()
			ans.append(contentsOf: tmp)
		}
		return true
	}
	
	// 102
	func levelOrder(_ root: TreeNode?) -> [[Int]] {
		if root == nil {
			return []
		}
        var res = [[Int]]()
		var ts = [TreeNode]()
		ts.append(root!)
		while ts.count != 0 {
			var ans = [Int]()
			var tmp = [TreeNode]()
			for tree in ts {
				ans.append(tree.val)
				if tree.left != nil {
					tmp.append(tree.left!)
				}
				if tree.right != nil {
					tmp.append(tree.right!)
				}
			}
			ts = tmp
			res.append(ans)
		}
		return res
    }
	
	// 103
	func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
		if root == nil {
			return []
		}
        var res = [[Int]]()
		var ts = [TreeNode]()
		ts.append(root!)
		var flag = true
		while ts.count != 0 {
			var ans = [Int]()
			var tmp = [TreeNode]()
			for i in 0..<ts.count {
				if flag {
					let tree = ts[i]
					ans.append(tree.val)
					if tree.left != nil {
						tmp.append(tree.left!)
					}
					if tree.right != nil {
						tmp.append(tree.right!)
					}
				}
				else {
					let tree = ts[ts.count - i - 1]
					ans.append(tree.val)
					if tree.right != nil {
						tmp.insert(tree.right!, at: 0)
					}
					if tree.left != nil {
						tmp.insert(tree.left!, at: 0)
					}
				}
			}
			ts = tmp
			res.append(ans)
			flag = flag ? false : true
		}
		return res
    }
	
	// 104
	var maxd104 = 0
	func maxDepth(_ root: TreeNode?) -> Int {
		let depth = 0
        preorder104(root, depth: depth)
		return maxd104
    }
	
	func preorder104(_ root: TreeNode?, depth: Int) {
		if root == nil {
			maxd104 = depth > maxd104 ? depth : maxd104
			return
		}
		let d = depth + 1
		preorder104(root?.left, depth: d)
		preorder104(root?.right, depth: d)
	}
	
	// 105
	// 前序遍历的根节点为0index，再根据中序遍历中的序列，找到根节点的下标，小于下标为左子树，大于下标为右子树，再从前序遍历中找到下标为1的节点index，再按照上述的方法递归下去，就可以定位所有节点的位置
	// 分治思想
	var pre_index105 = 0
	var inorder_val = [Int: Int]()
	func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
		for (index, n) in inorder.enumerated() {
			inorder_val[n] = index
		}
		return buildTreeHelper105(left: 0, right: inorder.count, preorder: preorder, inorder: inorder)
    }
	
	func buildTreeHelper105(left: Int, right: Int, preorder: [Int], inorder: [Int]) -> TreeNode? {
		if left == right {
			return nil // 到头了
		}
		let root_val = preorder[pre_index105]
		let root = TreeNode(root_val)
		let index = inorder_val[root_val]
		pre_index105+=1
		root.left = buildTreeHelper105(left: left, right: index!, preorder: preorder, inorder: inorder)
		root.right = buildTreeHelper105(left: index! + 1, right: right, preorder: preorder, inorder: inorder)
		return root
	}
	
	// 106
	var pre_idx106 = 0
	var inorder_val106 = [Int: Int]()
	func buildTree106(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
		pre_idx106 = inorder.count - 1
		for (index, n) in inorder.enumerated() {
			inorder_val106[n] = index
		}
		return buildTreeHelper106(left: 0, right: inorder.count, inorder: inorder, postorder: postorder)
    }
	
	func buildTreeHelper106(left: Int, right: Int, inorder: [Int], postorder: [Int]) -> TreeNode? {
		if left == right {
			return nil
		}
		let val = postorder[pre_idx106]
		let root = TreeNode.init(val)
		let index = inorder_val106[val]
		pre_idx106-=1
		root.right = buildTreeHelper106(left: index!+1, right: right, inorder: inorder, postorder: postorder)
		root.left = buildTreeHelper106(left: left, right: index!, inorder: inorder, postorder: postorder)
		return root
	}
	
	// 107
	func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
		dfs107(root: root, res: &res, depth: 0)
		return res
    }
	
	func dfs107(root: TreeNode?, res: inout [[Int]], depth: Int) {
		if root == nil {
			return ;
		}
		if res.count <= depth {
			res.insert([Int](), at: 0)
		}
		res[res.count - 1 - depth].append(root!.val)
		dfs107(root: root?.left, res: &res, depth: depth+1)
		dfs107(root: root?.right, res: &res, depth: depth+1)
	}
	
	// 108 有序数组，通过分治且每次左右节点的值选取当前下标左右节点的值即可
	func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
		return dfs108(left: 0, right: nums.count - 1, ans: nums)
    }
	
	func dfs108(left: Int, right: Int, ans: [Int]) -> TreeNode? {
		if left > right {
			return nil
		}
		let index = (left + right)/2
		let root = TreeNode.init(ans[index])
		root.left = dfs108(left: left, right: index-1, ans: ans)
		root.right = dfs108(left: index + 1, right: right, ans: ans)
		return root
	}
	
	// 109
	func sortedListToBST(_ head: ListNode?) -> TreeNode? {
		if head == nil {
			return nil
		}
		let mid = findMid109(head)
		let node = TreeNode.init(mid!.val)
		if head!.val == mid!.val {
			return node
		}
		node.left = sortedListToBST(head)
		node.right = sortedListToBST(mid?.next)
		return node
    }
	
	func findMid109(_ head: ListNode?) -> ListNode? {
		var pre: ListNode? = nil
		var slow = head
		var fast = head
		while fast != nil && fast?.next != nil {
			pre = slow
			slow = slow?.next
			fast = fast?.next?.next
		}
		// 断开链表
		if pre != nil {
			pre?.next = nil
		}
		return slow
	}
	
	// 110
//	var max_h110 = 0
//	var min_h110 = 0
//	func isBalanced(_ root: TreeNode?) -> Bool {
//		return dfs110(root, depth: 1)
//    }
//
//	func dfs110(_ root: TreeNode?, depth: Int) -> Bool {
//		if root == nil {
//			max_h110 = depth - 1 > max_h110 ? depth - 1 : max_h110
//			if min_h110 == 0 {
//				min_h110 = depth - 1
//			}
//			else {
//				min_h110 = depth - 1 < min_h110 ? depth - 1 : min_h110
//			}
//			if abs(max_h110 - min_h110) > 1 {
//				return false
//			}
//            else {
//                return true
//            }
//		}
//		if dfs110(root?.left, depth: depth+1) == false {
//			return false
//		}
//		if dfs110(root?.right, depth: depth+1) == false {
//			return false
//		}
//		return true
//	}
//	func isBalanced(_ root: TreeNode?) -> Bool {
//		return abs(height(root?.left) - height(root?.right)) <= 1 && isBalanced(root?.left) && isBalanced(root?.right)
//	}
//
//	func height(_ root: TreeNode?) -> Int {
//		if root == nil {
//			return 0
//		}
//		return max(height(root?.left), height(root?.right)) + 1
//	}
	
	func isBalanced(_ root: TreeNode?) -> Bool {
		return dfs110(root) != -1
	}
	
	func dfs110(_ root: TreeNode?) -> Int {
		if root == nil {
			return 0
		}
		let l = dfs110(root?.left)
		if l == -1 {
			return -1
		}
		let r = dfs110(root?.right)
		if r == -1 {
			return -1
		}
		return abs(l-r) > 1 ? -1 : max(l, r) + 1
	}
	
	// 111
	func minDepth(_ root: TreeNode?) -> Int {
		if root == nil {
			return 0
		}
		let m1 = minDepth(root?.left)
		let m2 = minDepth(root?.right)
		return (root?.left == nil || root?.right == nil) ? m1 + m2 + 1 : min(m1, m2) + 1
	}
	
	// 112
//	func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
//		if root == nil {
//			return false
//		}
//		let s = sum - root!.val
//		if root?.left == nil && root?.right == nil {
//			return s == 0
//		}
//		return hasPathSum(root?.left, s) || hasPathSum(root?.right, s)
//	}
	
	
	func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
		return dfs112(root, target: sum, sum: 0)
	}
	
	func dfs112(_ root: TreeNode?, target: Int, sum: Int) -> Bool {
		if root == nil {
			return false
		}
		//提升位置
		if root?.left == nil && root?.right == nil {
			return target == sum+root!.val
		}
		if dfs112(root?.left, target: target, sum: sum+root!.val) {
			return true
		}
		if dfs112(root?.right, target: target, sum: sum+root!.val) {
			return true
		}
		return false
	}
	
	// 113
	func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var ans = [Int]()
		var res = [[Int]]()
		dfs113(root, target: sum, sum: 0, ans: &ans, res: &res)
		return res
    }
	
	func dfs113(_ root: TreeNode?, target: Int, sum: Int, ans: inout [Int], res: inout [[Int]]) {
		if root == nil {
			return
		}
		ans.append(root!.val)
		if root?.left == nil && root?.right == nil {
			if sum+root!.val == target {
				res.append(Array.init(ans))
			}
			return
		}
		if root?.left != nil {
			dfs113(root?.left, target: target, sum: sum+root!.val, ans: &ans, res: &res)
			ans.removeLast()
		}
		if root?.right != nil {
			dfs113(root?.right, target: target, sum: sum+root!.val, ans: &ans, res: &res)
			ans.removeLast()
		}
	}
	
	// 114
	func flatten(_ root: TreeNode?) {
		var ans = [TreeNode]()
		preorder114(root, ans: &ans)
		var index = 0
		while index + 1 < ans.count {
			ans[index].left = nil
			ans[index].right = ans[index+1]
			ans[index+1].left = nil
			index+=1
		}
    }
	
	func preorder114(_ root: TreeNode?, ans: inout [TreeNode]) {
		if root == nil {
			return
		}
		ans.append(root!)
		preorder114(root?.left, ans: &ans)
		preorder114(root?.right, ans: &ans)
	}
	
	// 116
//	func connect(_ root: Node1?) -> Node1? {
//		if root == nil {
//			return root
//		}
//        var ans = [Node1]()
//		ans.append(root!)
//		while ans.count != 0 {
//			var tmp = [Node1]()
//			var pre = Node1.init(0)
//			var cur = ans[0]
//			for n in ans {
//				cur = n
//				pre.next = cur
//				pre = cur
//				if n.left != nil {
//					tmp.append(n.left!)
//					tmp.append(n.right!)
//				}
//			}
//			ans = tmp
//		}
//		return root
//    }
	func connect(_ root: Node1?) -> Node1? {
		if root == nil {
			return root
		}
		// 把每一行看做是一个链表
		var start = root
		var cur: Node1? = nil
		while start!.left != nil {
			cur = start
			while cur != nil {
				cur?.left?.next = cur?.right
				if cur?.next != nil {
					cur?.right?.next = cur?.next?.left
				}
				cur = cur?.next
			}
			start = start?.left
		}
		return root
	}
	
	//117
	func connect117(_ root: Node1?) -> Node1? {
		if root == nil {
			return root
		}
		// 把每一行看做是一个链表
		var start = root
		var cur: Node1? = nil
		while start != nil {
			cur = start
			var dummy: Node1? = Node1.init(0)
			let n = dummy
			while cur != nil {
				if cur?.left != nil || cur?.right != nil {
					if cur?.left != nil {
						dummy?.next = cur?.left
						dummy = dummy?.next
					}
					if cur?.right != nil {
						dummy?.next = cur?.right
						dummy = dummy?.next
					}
				}
				cur = cur?.next
			}
			start = n?.next
		}
		return root
    }
	
	// 118
	func generate(_ numRows: Int) -> [[Int]] {
        var res = [[Int]]()
		var ans = [Int]()
		for _ in 0..<numRows {
			if ans.count == 0 || ans.count == 1 {
				ans.append(1)
				res.append(Array.init(ans))
				continue
			}
			var tmp = [Int]()
			let count = ans.count
			for i in 1..<count {
				tmp.append(ans[i]+ans[i-1])
			}
			tmp.append(1)
			tmp.insert(1, at: 0)
			res.append(Array.init(tmp))
			ans = tmp
		}
		return res
    }
	
	// 119
	func getRow(_ rowIndex: Int) -> [Int] {
        var res = [Int]()
		for i in 0..<(rowIndex+1) {
			res.append(1)
			if i == 0 {
				continue
			}
			for j in (1..<i).reversed() {
				res[j]+=res[j-1]
			}
		}
		return res
    }
	
	// 120
	
	func minimumTotal(_ triangle: [[Int]]) -> Int {
		let row = triangle.count
		var minlen = [Int]()
		for _ in 0...row {
			minlen.append(0)
		}
		for i in (0...row-1).reversed() {
			for j in 0...i {
				minlen[j] = min(minlen[j], minlen[j+1]) + triangle[i][j]
			}
		}
		return minlen[0]
    }
	
	// 121
//	func maxProfit(_ prices: [Int]) -> Int {
//        var last = 0
//		var profit = 0
//		for i in 0..<prices.count - 1 {
//			last = max(0, last + prices[i+1] - prices[i])
//			profit = max(profit, last)
//		}
//		return profit
//    }
	func maxProfit(_ prices: [Int]) -> Int {
        var diff = [Int]()
		for i in 0..<prices.count - 1 {
			diff.append(prices[i+1] - prices[i])
		}
		var dp = [Int]()
		for _ in 0..<prices.count {
			dp.append(0)
		}
		dp[0] = max(0, diff[0])
		var profit = dp[0]
		for i in 1..<diff.count {
			dp[i] = max(0, dp[i-1]+diff[i])
			profit = max(profit, dp[i])
		}
		return profit
    }
	
	// 122
	// 贪心算法
//	func maxProfit122(_ prices: [Int]) -> Int {
//		if prices.count <= 1 {
//			return 0
//		}
//        var profit = 0
//		for i in 1..<prices.count {
//			let tmp = prices[i] - prices[i-1]
//			profit = tmp > 0 ? profit + tmp : profit
//		}
//		return profit
//    }
	func maxProfit122(_ prices: [Int]) -> Int {
		if prices.count <= 1 {
			return 0
		}
		var dp = [[Int]]()
		for _ in 0..<prices.count {
			var ans = [Int]()
			for _ in 0...1 {
				ans.append(0)
			}
			dp.append(ans)
		}
		// 0 持有现金，1 持有股票
		dp[0][0] = 0
		dp[0][1] = -prices[0]
		for i in 1..<prices.count {
			dp[i][0] = max(dp[i-1][0], dp[i-1][1]+prices[i])
			dp[i][1] = max(dp[i-1][1], dp[i-1][0]-prices[i])
		}
		return dp[prices.count-1][0]
    }
	
	// 127
//	var min_127 = Int.max
//	func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
//		if !wordList.contains(endWord) {
//			return 0
//		}
//		dfs127(beginWord, endWord, wordList, depth: 1)
//		return min_127 == Int.max ? 0 : min_127
//    }
//
//	func dfs127(_ beginWord: String, _ endWord: String, _ wordList: [String], depth: Int) {
//		if wordList.count == 0 {
//			return
//		}
//		let len = wordList.count
//		for i in 0..<len {
//			let flag = haveOneCh127(a: beginWord, b: wordList[i])
//			if flag {
//				if endWord == wordList[i] {
//					min_127 = min_127 < depth + 1 ? min_127 : depth + 1
//					return
//				}
//				else {
//					var arr = Array.init(wordList)
//					arr.remove(at: i)
// 					dfs127(wordList[i], endWord, arr, depth: depth+1)
//				}
//			}
//		}
//	}
	
	func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
		if !wordList.contains(endWord) {
			return 0
		}
		var queue = [String]()
		queue.append(beginWord)
		var visited = [Bool]()
		for _ in wordList {
			visited.append(false)
		}
		let i = wordList.index(of: beginWord)
		if i != nil {
			visited[i!] = true
		}
		var count = 0
		while !queue.isEmpty {
			var size = queue.count
			count+=1
			while size > 0 {
				let first = queue.remove(at: 0)
				for i in 0..<wordList.count {
					if visited[i] {
						continue
					}
					if !haveOneCh127(a: first, b: wordList[i]) {
						continue
					}
					if wordList[i] == endWord {
						return count+1
					}
					visited[i] = true
					queue.append(wordList[i])
				}
				size-=1
			}
		}
		return 0
	}
	
	func haveOneCh127(a: String, b: String) -> Bool {
		var count = 0
		for i in 0..<a.count {
			if a[i] != b[i] {
				count+=1
				if count > 1 {
					return false
				}
			}
		}
		return count == 1
	}
	
	// 129
	var sum_129 = 0
	func sumNumbers(_ root: TreeNode?) -> Int {
		dfs129(root, val: 0)
		return sum_129
    }
	
	func dfs129(_ root: TreeNode?, val: Int) {
		if root == nil {
			return
		}
		if root?.left == nil && root?.right == nil {
			sum_129 = sum_129 + val*10 + root!.val
			return
		}
		let v = val*10 + root!.val
		dfs129(root?.left, val: v)
		dfs129(root?.right, val: v)
	}
	
	// 130
	func solve(_ board: inout [[Character]]) {
		if board.count <= 2 {
			return
		}
		if board.count > 0 && board[0].count <= 2 {
			return
		}
		for i in 0..<board.count {
			for j in 0..<board[0].count {
				if board[i][j] == Character("O") && isEdge(i: i, j: j, board: board) {
					bfs130(i: i, j: j, board: &board)
				}
			}
		}
		for i in 0..<board.count {
			for j in 0..<board[0].count {
				if board[i][j] == Character("O") {
					board[i][j] = "X"
				}
				if board[i][j] == Character("*") {
					board[i][j] = "O"
				}
			}
		}
    }
	
	// 是 O 且不在边界
	func isEdge(i: Int, j: Int, board: [[Character]]) -> Bool {
		let m = board.count // hang
		let n = board[0].count // lie
		// 在边界
		if i - 1 < 0 || j - 1 < 0 || i + 1 >= m || j + 1 >= n {
			return true
		}
		return false
	}
	
	func bfs130(i: Int, j: Int, board: inout [[Character]]) {
		var curO = [(Int, Int)]()
		curO.append((i, j))
		board[i][j] = "*"
		while !curO.isEmpty {
			let item = curO.remove(at: 0)
			// 左边
			if item.1-1 >= 0 && board[item.0][item.1-1] == Character("O") {
				curO.append((item.0, item.1-1))
				board[item.0][item.1-1] = Character("*")
			}
			//上边
			if item.0-1 >= 0 && board[item.0-1][item.1] == Character("O") {
				curO.append((item.0-1, item.1))
				board[item.0-1][item.1] = Character("*")
			}
			//右边
			if item.1+1 < board[0].count && board[item.0][item.1+1] == Character("O") {
				curO.append((item.0, item.1+1))
				board[item.0][item.1+1] = Character("*")
			}
			//下边
			if item.0+1 < board.count && board[item.0+1][item.1] == Character("O") {
				curO.append((item.0+1, item.1))
				board[item.0+1][item.1] = Character("*")
			}
		}
	}
	
	// 134
//	func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
//		var tmp = [Int]()
//		for i in 0..<gas.count {
//			if gas[i] >= cost[i] {
//				tmp.append(i)
//			}
//		}
//		for i in tmp {
//			if dfs134(gas, cost, index: i, remain: 0, depth: 1) {
//				return i
//			}
//		}
//		return -1
//    }
//
//	func dfs134(_ gas: [Int], _ cost: [Int], index: Int, remain: Int, depth: Int) -> Bool {
//		if remain + gas[index] < cost[index] {
//			return false
//		}
//		if depth >= gas.count {
//			if remain + gas[index] >= cost[index] {
//				return true
//			}
//			else {
//				return false
//			}
//		}
//		let i = index == gas.count-1 ? 0 : index+1
//		let r = remain + gas[index] - cost[index]
//		let re = dfs134(gas, cost, index: i, remain: r, depth: depth+1)
//		if re {
//			return true
//		}
//		else {
//			return false
//		}
//	}
	func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
		var total = 0
		var index = 0
		var remain = 0
		for i in 0..<gas.count {
			total+=(gas[i] - cost[i])
			remain+=(gas[i] - cost[i])
			// remain小于0的话，上一次置0的加油站到当前加油站之间的任何一个加油也到达不了当前加油站
			if remain < 0 {
				remain = 0
				index = i + 1
			}
		}
		return total < 0 ? -1 : index
    }
	
	// 137
	func singleNumber137(_ nums: [Int]) -> Int {
		var ans = 0
		for i in 0..<32 {
			var count = 0
			for j in 0..<nums.count {
				if nums[j] < 0 {
					let lsb = Int.max + nums[j] + 1
					if (lsb >> i & 1) == 1 {
						count+=1
					}
				}
				else {
					if (nums[j] >> i & 1) == 1 {
						count+=1
					}
				}
			}
			if count % 3 != 0 {
				ans = ans | 1 << i
			}
		}
		return ans
    }
	
	// 138
//	func copyRandomList(_ head: Node2?) -> Node2? {
//		if head == nil {
//			return nil
//		}
//		var node = head
//		while node != nil {
//			let newNode = Node2.init(node!.val)
//			newNode.next = node?.next
//			node?.next = newNode
//			node = newNode.next
//		}
//		node = head
//		while node != nil {
//			node?.next?.random = node?.random?.next
//			node = node?.next?.next
//		}
//		let newHead = head?.next
//		var old_list = head
//		var new_list = head?.next
//		while new_list != nil {
//			old_list?.next = new_list?.next
//			new_list?.next = new_list?.next?.next
//			new_list = new_list?.next
//			old_list = old_list?.next
//		}
//		return newHead
//    }
	
	var visited138 = [Node2 : Node2]()
	func copyRandomList(_ head: Node2?) -> Node2? {
		if head == nil {
			return nil
		}
		if visited138.keys.contains(head!) {
			return visited138[head!]
		}
		let node = Node2.init(head!.val)
		node.next = copyRandomList(head?.next)
		node.random = copyRandomList(head?.random)
		return node
	}
	
	// 139
	func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
		var visited: [Bool?] = Array.init(repeating: nil, count: s.count)
		return dfs139(s, wordDict, visited: &visited, start: 0)
    }
	
	func dfs139(_ s: String, _ wordDict: [String], visited: inout [Bool?], start: Int) -> Bool {
		if start == s.count {
			return true
		}
		if visited[start] != nil {
			return visited[start]!
		}
		for i in (start+1)...s.count {
			if wordDict.contains(String(s[start..<i])) && dfs139(s, wordDict, visited: &visited, start: i) {
				visited[start] = true
				return true
			}
		}
		visited[start] = false
		return false
	}
	
	// 143
//	func reorderList(_ head: ListNode?) {
//		var v = [Int : ListNode]()
//		var node = head
//		var count = 0
//		while node != nil {
//			v[count] = node!
//			count+=1
//			node = node?.next
//		}
//		let n =  count/2
//		node = head
//		for i in 0..<n {
//			let tmp = node?.next
//			node?.next = v[count-i-1]
//			v[count-i-1]?.next = tmp
//			node = tmp
//		}
//		node?.next = nil
//    }
	
	func reorderList(_ head: ListNode?) {
		if head == nil || head?.next == nil || head?.next?.next == nil {
			return
		}
		var len = 0
		var node = head
		while node != nil {
			len+=1
			node = node?.next
		}
		recursive143(head, len: len)
	}
	
	@discardableResult
	func recursive143(_ head: ListNode?, len: Int) -> ListNode? {
		if len == 1 {
			//奇数
			let node = head?.next
			head?.next = nil
			return node
		}
		if len == 2 {
			//偶数
			let node = head?.next?.next
			head?.next?.next = nil
			return node
		}
		let tail = recursive143(head?.next, len: len-2)
		let tmp = tail?.next
		tail?.next = head?.next
		head?.next = tail
		return tmp
	}
	
	// 144
	func preorderTraversal144(_ root: TreeNode?) -> [Int] {
		if root == nil {
			return []
		}
		var res = [Int]()
		var ans = [TreeNode]()
		var t = root
		while !ans.isEmpty || t != nil {
			while t != nil {
				res.append(t!.val)
				ans.append(t!)
				t = t?.left
			}
			t = ans.removeLast().right
		}
		return res
    }
	
	func inorderTraversal1(_ root: TreeNode?) -> [Int] {
		if root == nil {
			return []
		}
		var res = [Int]()
		var ans = [TreeNode]()
		var p = root
		while p != nil || !ans.isEmpty {
			while p != nil {
				ans.append(p!)
				p = p?.left
			}
			// 这一步是要省略的，按照中序遍历（左上右），正常来说要先添加左边的值，但是在这里，左边的值一定是nil，所以省略掉
//			if p != nil {
//				res.append(p!.val)
//			}
			p = ans.removeLast()
			res.append(p!.val)
			p = p?.right
		}
		return res
	}
	

//	func postorderTraversal1(_ root: TreeNode?) -> [Int] {
//		if root == nil {
//			return []
//		}
//		var res = [Int]()
//		var stack = Array.init(repeating: root!, count: 1)
//		var set = Set<TreeNode>()
//		var cur = root
//		while cur != nil || !stack.isEmpty {
//			while cur != nil && !set.cont {
//				stack.append(cur!)
//				cur = cur?.left
//			}
//			cur = stack.last
//
//		}
//	}
	
	func insertionSortList(_ head: ListNode?) -> ListNode? {
		if head == nil || head?.next == nil {
			return head
		}
		let dummy = ListNode.init(-1)
		dummy.next = head
		var pre = head
		var node = head?.next
		while node != nil {
			if node!.val < pre!.val {
				var tmp = dummy
				while tmp.next!.val < node!.val {
					tmp = tmp.next!
				}
				pre?.next = node?.next
				node?.next = tmp.next
				tmp.next = node
				node = pre?.next
			}
			else {
				// 后一个值大于等于前一个值，往前走
				pre = pre?.next
				node = node?.next
			}
		}
		return dummy.next
    }
	
	func sortList(_ head: ListNode?) -> ListNode? {
		let dummy = ListNode(0)
		dummy.next = head
		var len = 0
		var p = head
		while p != nil {
			len+=1
			p = p?.next
		}
		var size = 1
		while size < len {
			var cur = dummy.next
			var tail = dummy
			while cur != nil {
				var first = cur
				var second = cut148(a: first, n: size)
				cur = cut148(a: second, n: size)
				tail.next = merge148(a: first, b: second)
				while tail.next != nil {
					tail = tail.next!
				}
			}
			size <<= 1
		}
		return dummy.next
	}
	
	func cut148(a: ListNode?, n: Int) -> ListNode? {
		var l = a
		var k = n-1
		while k != 0 && l != nil {
			k-=1
			l = l?.next
		}
		if l == nil {
			return nil
		}
		let p = l?.next
		l?.next = nil
		return p
	}
	
	func merge148(a: ListNode?, b: ListNode?) -> ListNode? {
		var l1 = a
		var l2 = b
		let dummy = ListNode(0)
		var p = dummy
		while l1 != nil && l2 != nil {
			if l1!.val < l2!.val {
				p.next = l1
				p = l1!
				l1 = l1?.next
			}
			else {
				p.next = l2
				p = l2!
				l2 = l2?.next
			}
		}
		p.next = l1 == nil ? l2 : l1
		return dummy.next
	}
	
	// 149
	func maxPoints(_ points: [[Int]]) -> Int {
		if points.count <= 2 {
			return points.count
		}
		var max = 2
		var len = 2
		for i in 0..<points.count - 2 {
			var first = points[i]
			for j in (i+1)..<points.count - 1 {
				len = 2
				let second = points[j]
				
				for k in (j+1)..<points.count {
					let flag = isSameLine(first: first, second: second, next: points[k])
					if flag {
						len += 1
						max = max > len ? max : len
						if first == second {
							first = points[k]
						}
					}
				}
			}
		}
		return max
    }
	
	func isSameLine(first: [Int], second: [Int], next: [Int]) -> Bool {
		let xd1 = abs(first[0] - second[0])
		let xd2 = abs(second[0] - next[0])
		let yd1 = abs(first[1] - second[1])
		let yd2 = abs(second[1] - next[1])
		return xd1 * yd2 == xd2 * yd1
	}
	
	public func isSameArray(a: [[Int]]) {
		var count = 0
		for i in 0..<a.count - 1 {
			for j in (i+1)..<a.count {
				if a[i][0] == a[j][0] && a[i][1] == a[j][1] {
					count+=1
					break
				}
			}
		}
	}
	
	// 4
	func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
		let m = nums1.count
		let n = nums2.count
		let l = (m+n + 1)/2
		let r = (m+n+2)/2
		return Double((getKth(num1: nums1, start1: 0, end1: m-1, num2: nums2, start2: 0, end2: n-1, k: l) + getKth(num1: nums1, start1: 0, end1: m-1, num2: nums2, start2: 0, end2: n-1, k: r)))/2.0
    }
	
	func getKth(num1: [Int], start1: Int, end1: Int, num2: [Int], start2: Int, end2: Int, k: Int) -> Int {
		let l1 = end1 - start1 + 1
		let l2 = end2 - start2 + 1
		if l1 > l2 {
			return getKth(num1: num2, start1: start2, end1: end2, num2: num1, start2: start1, end2: end1, k: k)
		}
		if l1 == 0 {
			return num2[start2 + k - 1]
		}
		if k == 1 {
			return min(num1[start1], num2[start2])
		}
		let i = start1 + min(l1, k/2) - 1
		let j = start2 + min(l2, k/2) - 1
		if num1[i] > num2[j] {
			return getKth(num1: num1, start1: start1, end1: end1, num2: num2, start2: j+1, end2: end2, k: k - min(l2, k/2))
		}
		else {
			return getKth(num1: num1, start1: i+1, end1: end1, num2: num2, start2: start2, end2: end2, k: k - min(l1, k/2))
		}
	}
	// 10
	func isMatch(_ s: String, _ p: String) -> Bool {
		var dp = Array.init(repeating: Array.init(repeating: false, count: p.count + 1), count: s.count+1)
		dp[0][0] = true
		for i in 0..<p.count {
			if p[i] == Character("*") && dp[0][i - 1] {
				dp[0][i+1] = true
			}
		}
		for i in 0..<s.count {
			for j in 0..<p.count {
				if p[j] == s[i] || p[j] == Character(".") {
					dp[i+1][j+1] = dp[i][j]
				}
				if p[j] == Character("*") {
					if p[j-1] != s[i] && p[j-1] != Character(".") {
						dp[i+1][j+1] = dp[i+1][j-1]
					}
					else {
						dp[i+1][j+1] = dp[i+1][j] || dp[i][j+1] || dp[i+1][j-1]
					}
				}
			}
		}
		return dp[s.count][p.count]
    }
	
	// 30
	func findSubstring(_ s: String, _ words: [String]) -> [Int] {
		if s.count == 0 || words.count == 0 {
			return []
		}
		var allwords = [String : Int]()
		for i in words {
			if allwords[i] == nil {
				allwords[i] = 1
			}
			else {
				allwords[i]!+=1
			}
		}
		var res = [Int]()
		let wordLen = words[0].count
		for i in 0..<(s.count - wordLen*words.count + 1) {
			var haswords = [String : Int]()
			var index = 0
			while index < words.count {
				let start = index*wordLen + i
				let end = (index + 1)*wordLen + i
				let sword = String(s[start..<end])
				if allwords.keys.contains(sword) {
					if haswords[sword] == nil {
						haswords[sword] = 1
					}
					else {
						haswords[sword]!+=1
					}
					if haswords[sword]! > allwords[sword]! {
						break
					}
				}
				else {
					break
				}
				index+=1
			}
			if index >= words.count {
				res.append(i)
			}
		}
		return res
    }
	
	// 32
//	func longestValidParentheses(_ s: String) -> Int {
//		let left = Character("(")
//		var leftVal = 0
//		var rightVal = 0
//		var max = 0
//		for c in s {
//			if c == left {
//				leftVal+=1
//			}
//			else {
//				rightVal+=1
//			}
//			if leftVal == rightVal {
//				max = max > leftVal*2 ? max : leftVal*2
//			}
//			else if rightVal > leftVal {
//				rightVal = 0
//				leftVal = 0
//			}
//		}
//		leftVal = 0
//		rightVal = 0
//		for i in (0..<s.count).reversed() {
//			if s[i] == left {
//				leftVal+=1
//			}
//			else {
//				rightVal+=1
//			}
//			if leftVal == rightVal {
//				max = max > leftVal*2 ? max : leftVal*2
//			}
//			else if leftVal > rightVal {
//				leftVal = 0
//				rightVal = 0
//			}
//		}
//		return max
//    }
	
	func longestValidParentheses(_ s: String) -> Int {
		var i = 0
		let left = Character("(")
		var stack = [Int]()
		stack.append(-1)
		var maxLen = 0
		for c in s {
			if c == left {
				stack.append(1)
			}
			else {
				stack.removeLast()
				if stack.isEmpty {
					stack.append(i)
				}
				else {
					maxLen = max(maxLen, i-stack.last!)
				}
			}
			i+=1
		}
		return maxLen
	}
	
	func countAndSay(_ n: Int) -> String {
		var dp = Array.init(repeating: "", count: n+2)
		dp[1] = "1"
		dp[2] = "11"
		if n < 3 {
			return dp[n]
		}
		for i in 3...n {
			let str = dp[i-1]
			var lastc = str[0]
			var count = 0
			var newStr = ""
			for c in str {
				if c == lastc {
					count+=1
				}
				else {
					newStr = newStr+"\(count)"+String(lastc!)
					count=1
					lastc = c
				}
			}
			newStr = newStr+"\(count)"+String(lastc!)
			dp[i] = newStr
		}
		return dp[n]
    }
	
	// 41 时间复杂度最差情况为n的平方
	func firstMissingPositive(_ nums: [Int]) -> Int {
		var minPN = Int.max
		for n in nums {
			if n > 0 && n < minPN {
				minPN = n
			}
		}
		//1. 所有值都小于0
		if minPN == Int.max {
			return 1
		}
		if minPN > 1 {
			return 1
		}
		else {
			var val = 1
			while nums.contains(val) {
				val+=1
			}
			return val
		}
    }
	
	// 42 时间复杂度为n，空间复杂度可以优化到1（双指针）
//	func trap(_ height: [Int]) -> Int {
//		if height.count == 0 {
//			return 0
//		}
//        var ans = [Int]()
//		var max = 0
//		var val = 0
//		for i in 0..<height.count {
//			if max == 0 && height[i] == 0 {
//				continue
//			}
//			if max == 0 {
//				max = height[i]
//				ans.append(max)
//				continue
//			}
//
//			if height[i] >= max {
//				ans.append(max)
//				var v = ans.count*max
//				for n in ans {
//					v-=n
//				}
//				val+=v
//				ans.removeAll()
//				ans.append(height[i])
//				max = height[i]
//			}
//			else {
//				ans.append(height[i])
//			}
//		}
//		let lastMax = max
//		max = 0
//		ans.removeAll()
//		for i in (0..<height.count).reversed() {
//			if height[i] == lastMax {
//				ans.append(max)
//				var v = (ans.count)*max
//				for n in ans {
//					v-=n
//				}
//				val+=v
//				break
//			}
//			if max == 0 && height[i] == 0 {
//				continue
//			}
//			if max == 0 {
//				max = height[i]
//				ans.append(max)
//				continue
//			}
//			if height[i] >= max {
//				ans.append(max)
//				var v = (ans.count)*max
//				for n in ans {
//					v-=n
//				}
//				val+=v
//				ans.removeAll()
//				ans.append(height[i])
//				max = height[i]
//			}
//			else {
//				ans.append(height[i])
//			}
//		}
//		return val
//    }
	func trap(_ height: [Int]) -> Int {
		var sum = 0
		var maxLeft = Array.init(repeating: 0, count: height.count)
		var maxRight = Array.init(repeating: 0, count: height.count)
		for i in 1..<height.count {
			maxLeft[i] = max(maxLeft[i-1], height[i-1])
		}
		for i in (0..<height.count-1).reversed() {
			maxRight[i] = max(maxRight[i+1], height[i+1])
		}
		for i in 1..<height.count-1 {
			let val = min(maxLeft[i], maxRight[i])
			if val > height[i] {
				sum+=(val-height[i])
			}
		}
		return sum
	}
	
	func jump(_ nums: [Int]) -> Int {
		var end = 0
		var maxPostion = 0
		var steps = 0
		for i in 0..<nums.count - 1 {
			maxPostion = max(maxPostion, nums[i]+i)
			if i == end {
				end = maxPostion
				steps+=1
			}
		}
		return steps
    }
	
	// 47
	func permuteUnique(_ nums: [Int]) -> [[Int]] {
		var res = [[Int]]()
		var ans = Array.init(nums)
		var used = Array.init(repeating: false, count: nums.count)
		let n = nums.sorted { $1 > $0 }
		dfs47(ans: &ans, len: nums.count, depth: 0, nums: n, used: &used, res: &res)
		return res
    }
	
	func dfs47(ans: inout [Int], len: Int, depth: Int, nums: [Int], used: inout [Bool], res: inout [[Int]]) {
		if len == depth {
			res.append(Array.init(ans))
			return
		}
		for i in 0..<nums.count {
			if used[i] {
				continue
			}
			// 因为上面是排序数组,所有相同的值都是相邻的
			if i > 0 && nums[i] == nums[i-1] && !used[i-1] {
				continue
			}
			ans.append(nums[i])
			used[i] = true
			dfs47(ans: &ans, len: len, depth: depth+1, nums: nums, used: &used, res: &res)
			used[i] = false
			ans.removeLast()
		}
	}
	
	// 51
//	func solveNQueens(_ n: Int) -> [[String]] {
//		var board = Array.init(repeating: String.init(Array.init(repeating: ".", count: n)), count: n)
//		var res = [[String]]()
//		dfs51(board: &board, res: &res, row: 0)
//		return res
//    }
//
//	func dfs51(board: inout [String], res: inout [[String]], row: Int) {
//		if row == board.count {
//			res.append(Array.init(board))
//			return
//		}
//		for col in 0..<board[row].count {
//			if !isValid51(board: board, row: row, col: col) {
//				continue
//			}
//			var str = board[row]
//			str[col] = Character("Q")
//			dfs51(board: &board, res: &res, row: row+1)
//
//		}
//	}
//
//	func isValid51(board: [String], row: Int, col: Int) -> Bool {
//		let q = Character("Q")
//		let str = board[row]
//		for i in 0..<str.count {
//			if i != col && board[i][col] == q {
//				return false
//			}
//		}
//		var j = col > row ? 0 : row - col // 行
//		var i = col > row ? col - row : 0 // 列
//		while i < board[0].count {
//			while j < board.count {
//				if (i != col && j != row) && board[j][i] == q {
//					return false
//				}
//			}
//			i+=1
//			j+=1
//		}
//		j = board[0].count - col + 1 > row ? 0 : row - (board[0].count - col + 1)
//		i = board[0].count - col + 1 > row ? board[0].count - col + 1 - row : board[0].count - 1
//		while i < board[0].count {
//			while j < board.count {
//				if (i != col && j != row) && board[j][i] == q {
//					return false
//				}
//			}
//			i-=1
//			j+=1
//		}
//		return true
//	}
	// 52
//	func totalNQueens(_ n: Int) -> Int {
//		if n <= 1 {
//			return n
//		}
//		var ans = Array.init(repeating: 0, count: n)
//		var sum = 0
//		backtrack52(ans: &ans, n: n, sum: &sum, row: 0)
//		return sum
//    }
//
//	func backtrack52(ans: inout [Int], n: Int, sum: inout Int, row: Int) {
//		if row == n {
//			sum+=1
//			return
//		}
//		for i in 0..<n {
//			var flag = true
//			for j in 0..<row {
//				if ans[j] == i || abs(ans[j] - i) == abs(j - row) {
//					flag = false
//					break
//				}
//			}
//			if flag {
//				ans[row] = i
//				backtrack52(ans: &ans, n: n, sum: &sum, row: row+1)
//			}
//		}
//	}
	func totalNQueens(_ n: Int) -> Int {
		if n <= 1 {
			return n
		}
//		var banCols = Array.init(repeating: 0, count: n)
		var banRows = Array.init(repeating: 0, count: n)
		var sum = 0
//		backtrack52(banRows: &banRows, n: n, sum: &sum, row: 0, left: -1, right: -1)
		return sum
    }
	
//	func backtrack52(ans: inout [Int], n: Int, sum: inout Int, row: Int) {
//		if row == n {
//			sum+=1
//			return
//		}
//		for col in 0..<n {
//			if ans[row] {
//
//			}
//			ans[row] = col
//			backtrack52(ans: &ans, n: n, sum: &sum, row: row+1)
//		}
//	}
	
	// 57
	func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
		if intervals.count == 0 {
			return [newInterval]
		}
		if newInterval.count == 0 {
			return intervals
		}
		var i = 1
		var vals = Array.init(intervals)
		vals.insert(newInterval, at: 0)
		var last = newInterval
		while i < vals.count {
			if !isContained57(a: last, b: vals[i]) {
				if isBigger71(a: last, b: vals[i]) {
					vals.swapAt(i, i-1)
				}
				i+=1
				continue
			}
			let v = [min(last[0], vals[i][0]), max(last[1], vals[i][1])]
			vals[i-1] = v
			vals.remove(at: i)
			last = v
		}
		return vals
    }
	
	func isContained57(a: [Int], b: [Int]) -> Bool {
		if a[0] <= b[0] && a[1] >= b[0] && b[1] >= a[1] {
			return true
		}
		else if a[0] <= b[1] && a[1] >= b[1] && b[0] <= a[1]{
			return true
		}
		else if a[0] >= b[0] && a[1] <= b[1] {
			return true
		}
		else if a[0] <= b[0] && a[1] >= b[1] {
			return true
		}
		return false
	}
	
	func isBigger71(a: [Int], b: [Int]) -> Bool {
		if a[0] > b[1] {
			return true
		}
		else if a[1] < b[0] {
			return false
		}
		return true
	}
	
	// 64
	func minPathSum(_ grid: [[Int]]) -> Int {
		if grid.count == 0 || grid[0].count == 0 {
			return 0
		}
		let m = grid.count
		let n = grid[0].count
		var dp = Array.init(repeating: Array.init(repeating: 0, count: n), count: m)
		for i in 0..<m {
			for j in 0..<n {
				if i == 0 {
					dp[i][j] = dp[i][j == 0 ? 0 : j - 1] + grid[i][j]
				}
				else if j == 0 {
					dp[i][j] = dp[i-1][j] + grid[i][j]
				}
				else {
					dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j]
				}
			}
		}
		return dp[m-1][n-1]
    }
	
	// 65
	func isNumber(_ s: String) -> Bool {
		/**
		1、只能有一个小数点
		2、只能有一个E
		3、E后面不能有小数点
		4、不可以以E结尾
		5、+-号只能在开头或者在E的后面
		*/
		let v = s.trimmingCharacters(in: .whitespaces)
		var numberSeen = false
		var afterE = false
		var eSeen = false
		var pSeen = false
		for i in 0..<v.count {
			let c = v[i]
			if asciiIsNumber(a: c!) {
				// 数字
				numberSeen = true
				afterE = false
			}
			else if c == Character(".") {
				if eSeen || pSeen {
					return false
				}
				pSeen = true
			}
			else if c == Character("e") {
				if eSeen || !numberSeen {
					return false
				}
				eSeen = true
				afterE = true
			}
			else if c == Character("+") || c == Character("-") {
				if i != 0 && v[i-1] != Character("e") {
					return false
				}
			}
			else {
				return false
			}
		}
		return numberSeen && !afterE
    }
	
	func isSymbol(a: Character) -> Bool {
		return a == Character("+") || a == Character("-")
	}
	
	func asciiIsNumber(a: Character) -> Bool {
		let v = a.asciiValue!
		return v >= 48 && v <= 57
	}
	
	// 68
	func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
		if words.count == 0 {
			return []
		}
        var ans = [Int]()
		for i in words {
			ans.append(i.count)
		}
		var res = [String]()
		var len = 0
		var tmp = [String]()
		for i in 0..<words.count {
			let cl = len + ans[i]
			if cl < maxWidth {
				tmp.append(words[i])
				len+=(ans[i]+1)
			}
			else if cl == maxWidth {
				tmp.append(words[i])
				var s = String()
				for w in tmp {
					s.append(w+" ")
				}
				s = s.trimmingCharacters(in: .whitespaces)
				res.append(s)
				tmp.removeAll()
				len = 0
			}
			else {
				if tmp.count == 1 {
					var s = String.init(tmp[0]+" ")
					if tmp[0].count == maxWidth {
						s = tmp[0]
					}
					else {
						for _ in 0..<maxWidth - len {
							s.append(" ")
						}
					}
					res.append(s)
					tmp.removeAll()
					tmp.append(words[i])
					len = ans[i]+1
					continue
				}
//				let remain = maxWidth - len + 1 //最后一个贴边
				var a = (maxWidth - len + 1)%(tmp.count - 1)
				let b = (maxWidth - len + 1)/(tmp.count - 1)
				var s = String()
				for j in 0..<(tmp.count-1) {
					let w = tmp[j]
					s.append(w+" ")
					for _ in 0..<b {
						s.append(" ")
					}
					if a != 0 {
						s.append(" ")
						a-=1
					}
				}
				s.append(tmp.last!)
				res.append(s)
				tmp.removeAll()
				tmp.append(words[i])
				len = ans[i]+1
			}
		}
		if tmp.count == 1 {
			var s = tmp[0]
			for _ in 0..<maxWidth-s.count {
				s.append(" ")
			}
			res.append(s)
		}
		else {
			if tmp.count != 0 {
				var s = String()
				for w in tmp {
					s.append(w+" ")
				}
				for _ in 0..<maxWidth-s.count {
					s.append(" ")
				}
				res.append(s)
			}
		}
		return res
    }
	
	// 72
	func minDistance(_ word1: String, _ word2: String) -> Int {
		if word2.count == 0 {
			return word1.count
		}
		if word1.count == 0 {
			return word2.count
		}
		var n1 = word1.count
		var n2 = word2.count
		var dp = Array.init(repeating: Array.init(repeating: 0, count: n2+1), count: n1+1)
		for i in 1...n2 {
			dp[0][i] = dp[0][i-1] + 1
		}
		for i in 1...n1 {
			dp[i][0] = dp[i-1][0] + 1
		}
		for i in 1...n1 {
			for j in 1...n2 {
				if word1[i-1] == word2[j-1] {
					dp[i][j] = dp[i-1][j-1]
				}
				else {
					dp[i][j] = min(dp[i-1][j-1], dp[i-1][j], dp[i][j-1]) + 1
				}
			}
		}
		return dp[n1][n2]
    }
	
	// 76
	func minWindow(_ s: String, _ t: String) -> String {
		if s.count == 0 || t.count == 0 || t.count > s.count {
			return ""
		}
		if t.count == 1 {
			return s.contains(find: t) ? t : ""
		}
		var window = [Character : Int]()
		var need = [Character : Int]()
		for c in t {
			if need[c] == nil {
				need[c] = 1
			}
			else {
				need[c]!+=1
			}
			window[c] = 0
		}
		var valid = 0
		var start = 0
		var len = Int.max
		var left = 0
		var right = 0
		while right < s.count {
			let c = s[right]!
			right+=1
			if need.keys.contains(c) {
				window[c]!+=1
				if need[c] == window[c] {
					valid+=1
				}
			}
			while valid == need.count {
				if right - left < len {
					start = left
					len = right - left
				}
				let d = s[left]!
				left+=1
				if need.keys.contains(d) {
					if need[d] == window[d] {
						valid-=1
					}
					window[d]!-=1
				}
			}
		}
		return len == Int.max ? "" : String(s[start..<(start+len)])
    }
	
	// 84
	func largestRectangleArea(_ heights: [Int]) -> Int {
		if heights.count == 0 {
			return 0
		}
		if heights.count == 1 {
			return heights[0]
		}
		var newHeights = Array.init(heights)
		newHeights.insert(0, at: 0)
		newHeights.append(0)
		var stack = [Int]()
		stack.append(0)
		var res = 0
		for i in 1..<newHeights.count {
			while newHeights[i] < newHeights[stack.last!] {
				let curHeight = newHeights[stack.removeLast()]
				let curWidth = i - stack.last! - 1
				res = max(res, curWidth * curHeight)
				// 若数组中有相同元素，会一直循环，知道最后一个元素，这个时候的res会是最大值
			}
			stack.append(i)
		}
		return res
    }
	
//	func maximalRectangle(_ matrix: [[Character]]) -> Int {
//
//    }
	
	// 87
	func isScramble(_ s1: String, _ s2: String) -> Bool {
		if s1.count != s2.count {
			return false
		}
		if s1 == s2 {
			return true
		}
		var letters = Array.init(repeating: 0, count: 26)
		let aasciv = Character("a").asciiValue!
		for i in 0..<s1.count {
			let a = s1[i]!
			let b = s2[i]!
			letters[Int(a.asciiValue!-aasciv)]+=1
			letters[Int(b.asciiValue!-aasciv)]-=1
		}
		for j in 0..<letters.count {
			if letters[j] != 0 {
				return false
			}
		}
		for i in 1..<s1.count {
			if isScramble(String(s1[0..<i]), String(s2[0..<i])) && isScramble(String(s1[i..<s1.count]), String(s2[i..<s2.count])) {
				return true
			}
			if isScramble(String(s1[i..<s1.count]), String(s2[0..<s2.count-i])) && isScramble(String(s1[0..<i]), String(s2[s2.count-i..<s2.count])) {
				return true
			}
		}
		return false
    }
	
	//97
//	var flag97 = false
//	func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
//		if s1.count + s2.count != s3.count {
//			return false
//		}
//		backtrack97(s1, s2, s3, i1: 0, i2: 0, i3: 0)
//		return flag97
//    }
//
//	func backtrack97(_ s1: String, _ s2: String, _ s3: String, i1: Int, i2: Int, i3: Int) {
//		if s3.count == i3 {
//			flag97 = true
//			return
//		}
//		if i1 == s1.count {
//			flag97 = String(s2[i2..<s2.count]) == String(s3[i3..<s3.count])
//			return
//		}
//		if i2 == s2.count {
//			flag97 = String(s1[i1..<s1.count]) == String(s3[i3..<s3.count])
//			return
//		}
//		if s1[i1] == s3[i3] {
//			backtrack97(s1, s2, s3, i1: i1+1, i2: i2, i3: i3+1)
//		}
//		if flag97 {
//			return
//		}
//		if s2[i2] == s3[i3] {
//			backtrack97(s1, s2, s3, i1: i1, i2: i2+1, i3: i3+1)
//		}
//	}
	func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
		if s1.count + s2.count != s3.count {
			return false
		}
		var dp = Array.init(repeating: Array.init(repeating: false, count: s2.count + 1), count: s1.count + 1)
		for i in 0...s1.count {
			for j in 0...s2.count {
				if i == 0 && j == 0 {
					dp[i][j] = true
				}
				else if i == 0 {
					dp[i][j] = dp[i][j-1] && s2[j-1] == s3[i+j-1]
				}
				else if j == 0 {
					dp[i][j] = dp[i-1][j] && s1[i-1] == s3[i+j-1]
				}
				else {
					dp[i][j] = (dp[i-1][j] && s1[i-1] == s3[i+j-1]) || (dp[i][j-1] && s2[j-1] == s3[i+j-1])
				}
			}
		}
		return dp[s1.count][s2.count]
	}
	
	// 99
	var first99: TreeNode? = nil
	var second99: TreeNode? = nil
	var pre99 = TreeNode.init(Int.min)
	func recoverTree(_ root: TreeNode?) {
        inOrder99(root)
		if first99 == nil {
			return
		}
		let tmp = first99!.val
		first99!.val = second99!.val
		second99!.val = tmp
    }
	
	func inOrder99(_ root: TreeNode?) {
		if root == nil {
			return ;
		}
		inOrder99(root?.left)
		if first99 == nil && pre99.val > root!.val {
			first99 = pre99
		}
		if first99 != nil && pre99.val > root!.val {
			second99 = root
		}
		pre99 = root!
		inOrder99(root?.right)
	}
	
	// 115
//	var count115 = 0
//	func numDistinct(_ s: String, _ t: String) -> Int {
//        backtrack115(s: s, t: t, d: String(), i: 0)
//		return count115
//    }
//
//	func backtrack115(s: String, t: String, d: String, i: Int) {
//		if d.count == t.count {
//			if d == t {
//				count115 += 1
//			}
//			return
//		}
//		if d.count != 0 && !t.contains(find: d) {
//			return
//		}
//
//		if d.count + s.count - i < t.count {
//			return
//		}
//		for i in i..<s.count {
//			backtrack115(s: s, t: t, d: d+String(s[i]!), i: i+1)
//		}
//	}
	
	func numDistinct(_ s: String, _ t: String) -> Int {
		var dp = Array.init(repeating:Array.init(repeating: 0, count: s.count+1) , count: t.count+1)
		for j in 0...s.count {
			dp[0][j] = 1
		}
		for i in 1...t.count {
			for j in 1...s.count {
				if t[i-1] == s[j-1] {
					dp[i][j] = dp[i-1][j-1] + dp[i][j-1]
				}
				else {
					dp[i][j] = dp[i][j-1]
				}
			}
		}
		return dp[t.count][s.count]
	}
	
	func maxProfit123(_ prices: [Int]) -> Int {
		if prices.count <= 1 {
			return 0
		}
		let max_k = 2
		var dp = Array.init(repeating: Array.init(repeating: Array.init(repeating: 0, count: 2), count: max_k+1), count: prices.count)
		for i in 0..<prices.count {
			for k in (1...max_k).reversed() {
				if i == 0 {
					dp[i][k][0] = 0
					dp[i][k][1] = -prices[0]
					continue
				}
				dp[i][k][0] = max(dp[i-1][k][0], dp[i-1][k][1] + prices[i])
				dp[i][k][1] = max(dp[i-1][k][1], dp[i-1][k-1][0] - prices[i])
			}
		}
		return dp[prices.count-1][max_k][0]
    }
	
	// 124
	
	func maxPathSum(_ root: TreeNode?) -> Int {
		var val = Int.min
		backtrack_124(root, val: &val)
		return val
    }

	@discardableResult
	func backtrack_124(_ root: TreeNode?, val: inout Int) -> Int {
		if root == nil {
			return 0
		}
		let left = backtrack_124(root?.left, val: &val)
		let right = backtrack_124(root?.right, val: &val)
		let lmr = root!.val + max(0, left) + max(0, right)
		let ret = root!.val + max(0, max(left, right))
		val = max(val, max(lmr, ret))
		// 不能返回lmr因为lmr已经形成了一个闭环，不能与父节点形成最大连接
		return ret
	}
	
//	func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
//		if wordList.count == 0 {
//			return [[]]
//		}
//
//    }
	

}

class LRUNode {
	var val: Int
	var key: Int
	var next: LRUNode?
	var pre: LRUNode?
	init(_ key: Int, _ val: Int) {
		self.key = key
		self.val = val
		self.next = nil
		self.pre = nil
	}
	
	
}

class LRUList {
	var head: LRUNode?
	var tail: LRUNode?
	var size = 0
	init() {
		head = LRUNode(0,0)
		tail = LRUNode(0,0)
	}
	
	
	func addFirst(x: LRUNode) {
		x.next = head?.next
		x.pre = head
		head?.next?.pre = x
		head?.next = x
		size+=1
	}
	
	func remove(x: LRUNode) {
		x.pre?.next = x.next
		x.next?.pre = x.pre
		size-=1
	}
	
	
}

class LRUCache {
	
	private var capacity: Int
	private var head: LRUNode?
	private var len = 0

    init(_ capacity: Int) {
		self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
		if head == nil {
			return -1
		}
		var node = head
		var isContained = false
		while node != nil {
			if node!.key == key {
				isContained = true
				break
			}
			node = node?.next
		}
		if !isContained {
			return -1
		}
		if node!.key == head!.key {
			return node!.val
		}
		let tmp = node?.pre
		node?.pre?.next = node?.next
		node?.next?.pre = tmp
		node?.next = head
		node?.pre = nil
		head?.pre = node
		head = node
		return node!.val
    }
    
    func put(_ key: Int, _ value: Int) {
		if capacity < 1 {
			return
		}
		if head == nil {
			head = LRUNode(key, value)
			len+=1
			return
		}
		var node = head
		var last = head
		while node != nil {
			if node!.key == key {
				node?.val = value
				break
			}
			last = node
			node = node?.next
		}
		if node == nil {
			// 不包含这个值
			let n = LRUNode(key,value)
			n.next = head
			head?.pre = n
			head = n
			if len+1 <= capacity {
				// 未越界
				len+=1
			}
			else {
				// 越界
				last?.pre?.next = nil
			}
		}
		else {
			let tmp = node?.pre
			node?.pre?.next = node?.next
			node?.next?.pre = tmp
			
			node?.next = head
			node?.pre = nil
			head?.pre = node
			head = node
		}
    }
}

extension String {
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}

extension String {
	func getRemainString(b: String) -> String {
		let range = self.range(of: b)
		if range!.lowerBound == self.startIndex  {
			return String(self[range!.upperBound..<self.endIndex])
		}
		else if range!.upperBound == self.endIndex {
			return String(self[self.startIndex..<range!.lowerBound])
		}
		else {
			return String(self[self.startIndex..<range!.lowerBound]) + String(self[range!.upperBound..<self.endIndex])
		}
	}
}

//extension Character {
//	func toInt() -> Int {
//		var intFromCharacter:Int = 0
//		for scalar in String(self).unicodeScalars {
//			intFromCharacter = Int(scalar.value)
//		}
//		return intFromCharacter
//	}
//}
//
//extension String {
//	subscript (index: Int) -> Character? {
//		let charIndex = self.index(self.startIndex, offsetBy: index)
//		return self[charIndex]
//	}
//}
//
//extension String {
//	subscript (range: Range<Int>) -> Substring {
//		let startIndex = self.index(self.startIndex, offsetBy: range.startIndex)
//		let stopIndex = self.index(self.startIndex, offsetBy: range.startIndex + range.count)
//		return self[startIndex..<stopIndex]
//	}
//}
