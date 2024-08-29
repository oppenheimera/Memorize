//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Ari Oppenheimer on 8/29/24.
//

import Foundation

struct MemoryGame<CardContent> {
  var cards: Array<Card>
  
  func choose(card: Card) {
    
  }
  
  struct Card {
    var isFaceUp: Bool
    var isMatched: Bool
    var content: CardContent
  }
}
