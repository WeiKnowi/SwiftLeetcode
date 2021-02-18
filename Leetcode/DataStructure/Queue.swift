//
//  Queue.swift
//  Leetcode
//
//  Created by 未可知 on 2020/1/10.
//  Copyright © 2020 com.septnet.business. All rights reserved.
//

import Foundation

protocol QueueProtocol {
	associatedtype T
	func add(val: T?)
	func size() -> Int
	func isEmpty() -> Bool
	func pop() -> T?
}

class Queue<E>: QueueProtocol {
	
	typealias T = E
	
	var array = [E]()
	
	func add(val: E?) {
		if val == nil {
			return
		}
		array.append(val!)
	}
	
	func size() -> Int {
		return array.count
	}
	
	func isEmpty() -> Bool {
		return array.isEmpty
	}
	
	func pop() -> E? {
		if array.isEmpty {
			return nil
		}
		return array.removeFirst()
	}
	
	
	
	
}
