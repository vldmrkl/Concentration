//
//  Card.swift
//  Concentration
//
//  Created by Volodymyr Klymenko on 2018-08-30.
//  Copyright © 2018 Volodymyr Klymenko. All rights reserved.
//

import Foundation

struct Card{
	var isFacedUp = false
	var isMatched = false
	var id: Int
	
	private static var idFactory = 0;
	private static func generateUniqueCardId() -> Int{
		Card.idFactory += 1
		return Card.idFactory
	}
	
	init(){
		self.id = Card.generateUniqueCardId()
	}
}
