//
//  ViewController.swift
//  Concentration
//
//  Created by Volodymyr Klymenko on 2018-08-28.
//  Copyright © 2018 Volodymyr Klymenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var flipCount = 0 {
		didSet {
			flipCountLabel.text = "Flips: \(flipCount)"
		}
	}
	@IBOutlet var cardButtons: [UIButton]!
	@IBOutlet weak var flipCountLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	let emojiChoices = ["🦉", "🐅", "🦉", "🐅"]
	
	@IBAction func touchCard(_ sender: UIButton) {
		if let cardIndex = cardButtons.index(of: sender) {
			flipCount += 1
			flipCard(withEmoji: emojiChoices[cardIndex], on: sender)
		} else {
			print("Clicked button in not in button array.")
		}
		
	}
	
	func flipCard(withEmoji emoji: String, on button: UIButton) {
		if button.currentTitle == emoji {
			button.setTitle("", for: UIControlState.normal)
			button.backgroundColor = #colorLiteral(red: 0, green: 0.4506722689, blue: 0.8753119111, alpha: 1)
		} else{
			button.setTitle(emoji, for: UIControlState.normal)
			button.backgroundColor = #colorLiteral(red: 0.1146613732, green: 0.6848543286, blue: 1, alpha: 1)
		}
	}
	

}
