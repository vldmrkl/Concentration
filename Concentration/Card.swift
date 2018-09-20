//
//  Card.swift
//  Concentration
//
//  Created by Volodymyr Klymenko on 2018-08-30.
//  Copyright © 2018 Volodymyr Klymenko. All rights reserved.
//

import Foundation

struct Card: Hashable
{
	var hashValue: Int { return id }
	static func == (lhs: Card, rhs: Card) -> Bool {
		return lhs.id == rhs.id
	}

	var isFacedUp = false
	var isMatched = false
	private var id: Int
	
	private static var idFactory = 0;
	private static func generateUniqueCardId() -> Int{
		idFactory += 1
		return idFactory
	}
	
	init(){
		self.id = Card.generateUniqueCardId()
	}
}
