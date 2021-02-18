//
//  BubbleSort.swift
//  Leetcode
//
//  Created by 未可知 on 2019/1/19.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import UIKit

class BubbleSort: NSObject {
	override init() {
		super.init();
		var a = [1,5,7,4,3,2,6]
		print("sort before \(a) \n");
		sort(&a)
		print("sort after \(a)")
	}
	
	func sort(_ a : inout Array<Int>) -> Void {
		for i in 0..<a.count {
			for j in 0..<(a.count - i - 1) {
				if a[j] > a[j + 1] {
					a.swapAt(j, j+1)
				}
			}
			print("\(a)")
		}
	}
	
	func bubbleSort(_ a : inout Array<Int>) -> Void {
		/*
		*5,4,3,2,1
		*4,3,2,1,5
		*3,2,1,4,5
		*2,1,3,4,5
		*1,2,3,4,5
		*/
		for i in (0..<a.count).reversed() {
			for j in 0..<i {
				if a[j] > a[j+1] {
					a.swapAt(j, j+1)
				}
			}
			print("\(a) \n");
		}
	}
	
	
	func sort1(_ a: inout [Int]) {
		for i in (0..<a.count).reversed() {
			for j in 0..<i {
				if a[j] > a[j+1] {
					a.swapAt(j, j+1)
				}
			}
		}
	}
	
	func sort2(_ a: inout [Int]) {
		for i in (0..<a.count).reversed() {
			for j in 0..<i {
				if a[j] > a[j+1] {
					a.swapAt(j, j+1)
				}
			}
		}
	}
	
	// 这是啥排序？选择排序
	func whatSort(_ a : inout Array<Int>) -> Void {
		//MARK:每次都把最小的数放到最前面
		/*
		* 5,4,3,2,1
		*1,5,4,3,2
		*1,2,5,4,3
		*1,2,3,5,4
		*1,2,3,4,5
		*/
		for i in 0..<a.count {
			for j in (i+1)..<a.count {
				if a[j] < a[i] {
					let x = a[i];
					a[i] = a[j];
					a[j] = x;
				}
			}
		}
	}
}
