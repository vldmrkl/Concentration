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
	
	var indexOfTheOnlyFacedUpCard: Int? {
		get{
			var foundIndex: Int?
			for index in cards.indices{
				if cards[index].isFacedUp {
					if foundIndex == nil{
					foundIndex = index
					}
				 else{
					return nil
				}
			}
			}
			return foundIndex
		}
		set{
			for index in cards.indices {
				cards[index].isFacedUp = (index == newValue)
			}
		}
	}
	
	func chooseCard(at index: Int){
		if !cards[index].isMatched{
			if let matchIndex = indexOfTheOnlyFacedUpCard, matchIndex != index {
				if cards[matchIndex].id == cards[index].id {
					cards[index].isMatched = true
					cards[matchIndex].isMatched = true
				}
				cards[index].isFacedUp = true
			} else{
				indexOfTheOnlyFacedUpCard = index
			}
		}
	}
	
	func shuffleCards(){
		var shuffledCards = [Card]()
		while !cards.isEmpty {
			let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
			let card = cards.remove(at: randomIndex)
			shuffledCards.append(card)
		}
		cards = shuffledCards
	}
	
	init(numberOfPairsOfCards: Int){
		for _ in 1...numberOfPairsOfCards{
			let card = Card()
			// add pair of cards to array
			cards += [card, card]
		}
		
		shuffleCards()
	}
}
