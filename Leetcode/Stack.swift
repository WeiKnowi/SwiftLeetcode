//
//  Stack.swift
//  Leetcode
//
//  Created by 未可知 on 2019/8/24.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import Foundation

struct Stack<T> {
	
	var array: Array<T> = []
	
	func cout() -> Int {
		return array.count
	}
	
	func peek() -> T? {
		if array.count == 0 {
			return nil
		}
		return array.last
	}
	
	@discardableResult
	mutating func pop() -> T? {
		if array.count == 0 {
			return nil
		}
		return array.removeLast()
	}
	
	mutating func push(e: T?) {
		if e == nil {
			return
		}
		array.append(e!)
	}
	
}
