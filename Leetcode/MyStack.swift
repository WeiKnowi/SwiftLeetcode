//
//  MyStack.swift
//  Leetcode
//
//  Created by 未可知 on 2019/11/7.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import Foundation

class MyStack {
	
	var list: Array<Int>
	
	/** Initialize your data structure here. */
	init() {
		list = Array<Int>()
	}
	
	/** Push element x onto stack. */
	func push(_ x: Int) {
		list.append(x)
	}
	
	/** Removes the element on top of the stack and returns that element. */
	func pop() -> Int {
		if list.count == 0 {
			return 0;
		}
		return list.removeLast()
	}
	
	/** Get the top element. */
	func top() -> Int {
		if list.count == 0 {
			return 0
		}
		return list.last!
	}
	
	/** Returns whether the stack is empty. */
	func empty() -> Bool {
		return list.count == 0
	}
}
