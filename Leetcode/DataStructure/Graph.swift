//
//  Graph.swift
//  Leetcode
//
//  Created by 未可知 on 2020/1/9.
//  Copyright © 2020 com.septnet.business. All rights reserved.
//

import Foundation

class Edge {
	var vertex: Int?
	var otherVertex: Int?
	var priority: Int
	
	init(priority: Int, vertex: Int?, otherVertex: Int?) {
		self.priority = priority
		self.vertex = vertex
		self.otherVertex = otherVertex
	}
	
}
