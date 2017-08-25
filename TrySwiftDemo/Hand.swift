//
//  Hand.swift
//  TrySwiftDemo
//
//  Created by Hongfei Zhang on 8/24/17.
//  Copyright © 2017 Deja View Concepts, Inc. All rights reserved.
//

import UIKit

struct Card {
	let rank: String
	let color: UIColor
	let suit: String
}

struct Deck {
	
	// Generate a random card
	func nextCard() -> Card {
		
		let aRandomRank = Constants.kRanks[Int(arc4random()%13)]
		
		let aRandomSuitIndex = Int(arc4random()%4)
		let aRandomSuit = Constants.kSuits[aRandomSuitIndex]
		
		let aRandomColor = (aRandomSuitIndex < 2) ? UIColor.black : UIColor.red
		
		return Card(rank: aRandomRank, color: aRandomColor, suit: aRandomSuit)
	}
	
}

protocol DataType {
	var numberOfItems: Int { get }
	
	// Whatever is conforming to the data type will return one of themselves back, so use Self
	func addNewItemAtIndex(index: Int) -> Self
	func deleteItemAtIndex(index: Int) -> Self
	func moveItem(fromIndex: Int, toIndex: Int) -> Self
}

// The hand has a deck of cards that it deals from
struct Hand: DataType {
	
	private var deck = Deck()
	private var cards = [Card]()
	
	// MARK: - Public APIs
	
	subscript(index: Int) -> Card {
		return cards[index]
	}
	
	func cardAtPosition(index: Int) -> Card {
		return cards[index]
	}
	
	// MARK: - DataType protocol methods
	
	var numberOfItems: Int {	// computed property
		return cards.count
	}
	
	func addNewItemAtIndex(index: Int) -> Hand {
		return insertCard(card: deck.nextCard(), atIndex: index)
	}
	
	func deleteItemAtIndex(index: Int) -> Hand {
		// Cannot use mutating member on immutable value: 'self' is immutable
		//cards.remove(at: index)
		
		var mutableCards = cards
		mutableCards.remove(at: index)
		return Hand(deck: deck, cards: mutableCards)
	}
	
	// functional approach
	func moveItem(fromIndex: Int, toIndex: Int) -> Hand {
		let cardToMove = cards[fromIndex]
		return deleteItemAtIndex(index: fromIndex).insertCard(card: cardToMove, atIndex: toIndex)
	}
	
	/* !!!: This one exact same with the above one.
	Here, I have this moveCard that’s going to return a new instance of Hand. It is still going to use deleteCardAtIndex and insertCard, but notice it chained them together with . – that dot means we’re going to delete the card, give us a new instance of Hand, and then ask that instance to insert a card. We’re not saving anything anywhere.
	
	Why not? deleteCardAtIndex doesn’t change our current set of cards; it creates a new hand. Our current set of cards still exists, so I create this new hand, and then I ask it, “Hey, can you insert a card?” It says, “What card?” Fortunately, we still have our set of cards, and we say, “This card.” If that doesn’t make you smile, you can go back to Ruby or Java.
	*/
	func moveCard1(fromIndex: Int, toIndex: Int) -> Hand {
		return deleteItemAtIndex(index: fromIndex).insertCard(card: cards[fromIndex], atIndex: toIndex)
	}
	
	// or non-functional way
	mutating func moveCard2(from: Int, to: Int) {
		let cardToMove = cards[from]
		_ = deleteItemAtIndex(index: from).insertCard(card: cardToMove, atIndex: to)
	}
	
	// MARK: - Private helpers
	
	// This is typical when getting rid of mutating
	private func insertCard(card: Card, atIndex index: Int) -> Hand {
		// Cannot use mutating member on immutable value: 'self' is immutable
		//cards.insert(card, at: index)
		
		var mutableCards = cards
		mutableCards.insert(card, at: index)
		return Hand(deck: deck, cards: mutableCards)
	}
	
}
