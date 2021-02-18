//
//  catergory.swift
//  Leetcode
//
//  Created by 未可知 on 2020/4/30.
//  Copyright © 2020 com.septnet.business. All rights reserved.
//

import Foundation

extension Int {
	
	/// 二进制字符串
	var binary: String {
		get {
			return String(self, radix: 2, uppercase: false)
		}
	}
}

extension Character {
	func toInt() -> Int {
		var intFromCharacter:Int = 0
		for scalar in String(self).unicodeScalars {
			intFromCharacter = Int(scalar.value)
		}
		return intFromCharacter
	}
}

extension String {
	subscript (index: Int) -> Character? {
		let charIndex = self.index(self.startIndex, offsetBy: index)
		return self[charIndex]
	}
}

extension String {
	subscript (range: Range<Int>) -> Substring {
		let startIndex = self.index(self.startIndex, offsetBy: range.startIndex)
		let stopIndex = self.index(self.startIndex, offsetBy: range.startIndex + range.count)
		return self[startIndex..<stopIndex]
	}
}
