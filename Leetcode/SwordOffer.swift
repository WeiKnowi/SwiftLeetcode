//
//  SwordOffer.swift
//  Leetcode
//
//  Created by 未可知 on 2019/8/24.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import Foundation

struct SomeStruct {
	
}

class SwordOffer: NSObject {
	
	// 面试题9：用两个栈实现队列
	var stack1 = Stack<SomeStruct>()
	var stack2 = Stack<SomeStruct>()
	
	func appendTail(e: SomeStruct)  {
		if stack1.peek() == nil {
			stack1.push(e: e)
		}
		else {
			stack2.push(e: e)
		}
	}
	
	func deleteHead() {
		var stack = stack1.peek() == nil ? stack2 : stack1;
		var nilStack = stack1.peek() == nil ? stack1 : stack2;
		while stack.peek() == nil {
			nilStack.push(e: stack.pop())
		}
		nilStack.pop()
	}
	
	
	// 面试题 10 斐波那锲数列求和问题
	
	func Fibonacci(n: Int) -> Int {
		if n < 2 {
			return n
		}
		var one = 0, two = 1, re = 0
		for _ in 2...n {
			re = one + two
			one = two
			two = re
		}
		return re
	}
	
	// 面试题11
	func mins(nums: Array<Int>) -> Int {
		if nums.count == 0 {
			return 0
		}
		// 二分法
		var start = 0;
		var end = nums.count - 1
		var mid = (start + end)/2
		//MARK: end 不可能等于 mid ，因为（start + end）/ 2，的值总是小于等于（start + end)/2
		while start != mid {
			if nums[mid] > nums[start] {
				start = mid;
			}
			else if nums[mid] < nums[start] {
				end = mid;
			}
			mid = (start + end)/2
		}
		return nums[start] > nums[end] ? nums[end] : nums[start];
	}
	
	// 面试题 31
	func isPopOrder(push: [Int], pop: [Int]) -> Bool {
		var flag = true
		while flag {
			
		}
		return flag
	}
	

	
}
