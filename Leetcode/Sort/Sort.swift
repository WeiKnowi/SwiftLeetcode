//
//  Sort.swift
//  Leetcode
//
//  Created by 未可知 on 2019/12/26.
//  Copyright © 2019 com.septnet.business. All rights reserved.
//

import Foundation

protocol SortProtocol {
	func sort(_ a: inout Array<Int>)
	var originList: Array<Int> { get set }
}

class Sort: NSObject, SortProtocol {
	var originList: Array<Int>
	
	override init() {
		originList = Array<Int>()
		super.init()
		addNum(&originList, count: 20)
		print("sort before: \(originList)")
		sort(&originList)
		print("after before: \(originList)")
	}
	
	func addNum(_ a: inout Array<Int>, count: Int = 1000) -> Void {
		for _ in 0..<count {
			let temp:Int = Int(arc4random()%1000)+1
			a.append(temp)
		}
	}
	
	func sort(_ a: inout Array<Int>) {
		print("Subclass Override")
	}
}
