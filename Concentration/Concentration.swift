//
//  Concentration.swift
//  Concentration
//
//  Created by Volodymyr Klymenko on 2018-08-30.
//  Copyright © 2018 Volodymyr Klymenko. All rights reserved.
//

import Foundation

struct Concentration {
	private(set) var cards = [Card]()
	
	private var indexOfTheOnlyFacedUpCard: Int? {
		get{
			return cards.indices.filter({ cards[$0].isFacedUp}).oneAndOnly
		}
		set{
			for index in cards.indices {
				cards[index].isFacedUp = (index == newValue)
			}
		}
	}
	
	mutating func chooseCard(at index: Int){
		assert(cards.indices.contains(index), "chooseCard(at: \(index)): index is out of bounds")
		if !cards[index].isMatched{
			if let matchIndex = indexOfTheOnlyFacedUpCard, matchIndex != index {
				if cards[matchIndex] == cards[index] {
					cards[index].isMatched = true
					cards[matchIndex].isMatched = true
				}
				cards[index].isFacedUp = true
			} else{
				indexOfTheOnlyFacedUpCard = index
			}
		}
	}
	
	mutating func shuffleCards(){
		var shuffledCards = [Card]()
		while !cards.isEmpty {
			let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
			let card = cards.remove(at: randomIndex)
			shuffledCards.append(card)
		}
		cards = shuffledCards
	}
	
	init(numberOfPairsOfCards: Int){
		assert(numberOfPairsOfCards > 0, "numberOfPairsOfCards is <= 0")
		for _ in 1...numberOfPairsOfCards{
			let card = Card()
			// add pair of cards to array
			cards += [card, card]
		}
		
		shuffleCards()
	}
}

extension Collection{
	var oneAndOnly: Element? {
		return count == 1 ? first : nil
	}
}
