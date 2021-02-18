//
//  MaxPQ.swift
//  Leetcode
//
//  Created by 未可知 on 2020/1/9.
//  Copyright © 2020 com.septnet.business. All rights reserved.
//

import Foundation

//MARK: - 优先级队列
class MaxPQ <T: Comparable> {
	var pq = [T]()
	init() {
	}
	
	func insert(val: T) {
		
	}
	
	func max() -> T? {
		if pq.count == 0 {
			return nil
		}
		return pq.first
	}
	
//	func delMax() -> T {
//
//	}
	
	func isEmpty() -> Bool {
		return pq.isEmpty
	}
	
	func size() -> Int {
		return pq.count
	}
	
	private func swim(val: T) {
		
	}
	
	private func sink(val: T) {
		
	}
}
