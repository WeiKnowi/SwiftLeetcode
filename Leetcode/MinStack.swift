//
//  MinStack.swift
//  Leetcode
//
//  Created by 未可知 on 2019/10/12.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import Foundation

class MinStack {
	
	var stack = Array<Int>()
	private var helperStack = Array<Int>()
	
	init() {
	}
	
	func push(_ x: Int) {
		stack.append(x)
		if helperStack.count == 0 || x <= helperStack.last! {
			helperStack.append(x);
		}
	}
	
	func pop() {
		if stack.count == 0 {
			return
		}
		let v = stack.removeLast()
		if helperStack.count != 0 && helperStack.last! == v {
			helperStack.removeLast()
		}
	}
	
	func top() -> Int {
		if stack.count == 0 {
			return 0
		}
		return stack.last!
	}
	
	func getMin() -> Int {
		if helperStack.count == 0 {
			return 0
		}
		return helperStack.last!
	}
}
