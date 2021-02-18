//
//  SwordOffer1.swift
//  Leetcode
//
//  Created by 未可知 on 2020/1/6.
//  Copyright © 2020 com.septnet.business. All rights reserved.
//

import Foundation
class SwordOffer1 {
	
	//
	func findGreatestSumOfSubArray(_ arr: [Int]) -> Int {
		if arr.count == 0 {
			return 0
		}
		var sum = 0
		var maxSum = Int.min
		for i in arr {
			if sum <= 0 {
				sum = i
			}
			else {
				sum+=i
			}
			if sum > maxSum {
				maxSum = sum
			}
		}
		return maxSum
	}
	
	
}
