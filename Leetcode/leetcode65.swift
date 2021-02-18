//
//  leetcode65.swift
//  Leetcode
//
//  Created by 未可知 on 2020/5/12.
//  Copyright © 2020 com.septnet.business. All rights reserved.
//

import Foundation

// 责任链
protocol NumberValidate {
	func validate(s: String) -> Bool
}

class NumberValidateTemplate: NumberValidate {
	func validate(s: String) -> Bool {
		if checkStringEmpty(s: s) {
			return false
		}
		let v = checkAndProcessHeader(s: s)
		if v.count == 0 {
			return false
		}
		return doValidate(s: v)
	}
	
	func checkStringEmpty(s: String) -> Bool {
		if s == "" {
			return true
		}
		return false
	}
	
	func checkAndProcessHeader(s: String) -> String {
		var v = s.trimmingCharacters(in: .whitespaces)
		if v.starts(with: "+") || v.starts(with: "-") {
			v = String(v[1..<v.count])
		}
		return v
	}
	
	func doValidate(s: String) -> Bool {
		return true
	}
}

// 数字
class IntegerValidate: NumberValidateTemplate {
	override func doValidate(s: String) -> Bool {
		for c in s {
			if !c.isDigit() {
				return false
			}
		}
		return true
	}
}

// 指数
class SienceFormatValidate: NumberValidateTemplate {
	override func doValidate(s: String) -> Bool {
		let v = s.lowercased()
		let pos = v.index(of: Character("e"))
		if pos == nil {
			return false
		}
		if v.count == 1 {
			return false
		}
		let first = String(v[..<pos!])
		let second = String(v[v.index(after: pos!)..<v.endIndex])
		if !validatePartBeforeE(first: first) || !validatePartAfterE(second: second) {
			return false
		}
		return true
	}
	
	private func validatePartBeforeE(first: String) -> Bool {
		if first == "" {
			return false
		}
		if !checkHeadAndEndForSpace(part: first) {
			return false
		}
		let integerValidate = IntegerValidate()
		let floatValidate = FloatValidate()
		if integerValidate.validate(s: first) == false && floatValidate.validate(s: first) {
			return false
		}
		return true
	}
	
	private func validatePartAfterE(second: String) -> Bool {
		if second == "" {
			return false
		}
		if !checkHeadAndEndForSpace(part: second) {
			return false
		}
		let integerValidate = IntegerValidate()
		if !integerValidate.validate(s: second) {
			return false
		}
		return true
	}
	
	private func checkHeadAndEndForSpace(part: String) -> Bool {
		if part.starts(with: " ") || part.last == Character(" ") {
			return false
		}
		return true
	}
}

// 小数点
class FloatValidate: NumberValidateTemplate {
	override func doValidate(s: String) -> Bool {
		let pos = s.index(of: Character("."))
		if pos == nil {
			return false
		}
		if s.count == 0 {
			return false
		}
		let first = String(s[..<pos!])
		let second = String(s[s.index(after: pos!)..<s.endIndex])
		if checkFirstPart(first: first) && checkFirstPart(first: second) {
			return true
		}
		return false
	}
	
	private func checkFirstPart(first: String) -> Bool {
		if first != "" && !checkPart(part: first) {
			return false
		}
		return true
	}
	
	private func checkPart(part: String) -> Bool {
		// 小数点的前一个数和后一个数必须为整数
		if !part[0]!.isDigit() || !part[part.count-1]!.isDigit(){
			return false
		}
		let nv = IntegerValidate()
		if !nv.validate(s: part) {
			return false
		}
		return true
	}

}

class NumberValidator: NumberValidate {
	private var validators = [NumberValidate]()
	init() {
		addValidators()
	}
	
	private func addValidators(){
		
		// 这里分成3种情况，1、全是整数的。2、有小数点的。3、有科学计数法的
		// 每次做validate都会先去除正负号
		validators.append(IntegerValidate())
		
		validators.append(FloatValidate())
		
		validators.append(SienceFormatValidate())
		
	}
	
	func validate(s: String) -> Bool {
		for nv in validators {
			if nv.validate(s: s) == true {
				return true
			}
		}
		return false
	}
}

class Solution {
	func isNumber(s: String) -> Bool {
		let nv = NumberValidator()
		return nv.validate(s: s)
	}
}


extension Character {
	func isDigit() -> Bool {
		let v = self.asciiValue!
		return v >= 48 && v <= 57
	}
}
