//
//  ViewController.swift
//  Concentration
//
//  Created by Volodymyr Klymenko on 2018-08-28.
//  Copyright © 2018 Volodymyr Klymenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
	
	var flipCount = 0 {
		didSet {
			flipCountLabel.text = "Flips: \(flipCount)"
		}
	}

	@IBOutlet var cardButtons: [UIButton]!
	@IBOutlet weak var flipCountLabel: UILabel!
	
	@IBAction func touchCard(_ sender: UIButton) {
		flipCount += 1
		if let cardIndex = cardButtons.index(of: sender) {
			game.chooseCard(at: cardIndex)
			updateViewFromModel()
		} else {
			print("Clicked button which is not in button array.")
		}
		
	}
	
	func updateViewFromModel(){
		for index in cardButtons.indices{
			let button = cardButtons[index]
			let card = game.cards[index]
			if card.isFacedUp {
				button.setTitle(emoji(for: card), for: UIControlState.normal)
				button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
			} else {
				button.setTitle("", for: UIControlState.normal)
				button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.4506722689, blue: 0.8753119111, alpha: 1)
			}
		}
	}
	
	var emojiChoices = ["🦉", "🐙", "🙊", "🐼", "🐯", "🐲", "🍔", "🍕", "🍟"]
	var emoji = [Int:String]()
	
	func emoji(for card: Card) -> String {
		if emoji[card.id] == nil{
			if emojiChoices.count > 0{
				let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
				emoji[card.id] = emojiChoices.remove(at: randomIndex)
			}
		}
		return emoji[card.id] ?? "?"
	}
	
}

