//
//  Concentration.swift
//  Concentration
//
//  Created by Volodymyr Klymenko on 2018-08-30.
//  Copyright © 2018 Volodymyr Klymenko. All rights reserved.
//

import Foundation

class Concentration {
	var cards = [Card]()
	
	var indexOfTheOnlyFacedUpCard: Int?
	
	func chooseCard(at index: Int){
		if !cards[index].isMatched{
			if let matchIndex = indexOfTheOnlyFacedUpCard, matchIndex != index {
				if cards[matchIndex].id == cards[index].id {
					cards[index].isMatched = true
					cards[matchIndex].isMatched = true
				}
				cards[index].isFacedUp = true
				indexOfTheOnlyFacedUpCard = nil
			} else{
				//either 2 cards or no cards are faced up
				for flipDownIndex in cards.indices{
					cards[flipDownIndex].isFacedUp = false
				}
				cards[index].isFacedUp = true
				indexOfTheOnlyFacedUpCard = index
			}
		}
	}
	
	init(numberOfPairsOfCards: Int){
		for _ in 1...numberOfPairsOfCards{
			let card = Card()
			// add pair of cards to array
			cards += [card, card]
		}
		//TODO: shuffle the cards
	}
}
