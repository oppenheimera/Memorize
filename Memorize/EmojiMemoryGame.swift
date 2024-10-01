//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ari Oppenheimer on 8/29/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
  public static let emojis = ["🌮", "🌯", "🌭", "🥗", "🍕", "🧁", "🍦", "🥑", "🥐", "🌶️"]
  public static let halloween = ["👻", "🎃", "🧙", "🏚️", "😈", "🕷️", "💀", "🥧", "🕸️"]
  public static let beach = ["🌊","👙", "🏖️", "☀️", "🐚", "⛱️", "🏝️", "🩱", "🩳"]
  public static let vehicles = ["🚗", "🚙", "🏎️", "🚃", "🚖", "🚔", "🚢", "🚎", "🚍"]
  public static let food = ["🌮", "🌯", "🌭", "🥗", "🍕", "🧁", "🍦", "🥑", "🥐", "🌶️"]
  
  public init(model: MemoryGame<String> = createMemoryGame(), selectedTheme: Theme? = EmojiMemoryGame.Theme.beach) {
    self.model = model
    self.selectedTheme = selectedTheme ?? EmojiMemoryGame.Theme.food
  }
  
  private static func createMemoryGame() -> MemoryGame<String> {
    return MemoryGame(numberOfPairsOfCards: 10) { pairIndex in
      if emojis.indices.contains(pairIndex) {
        return emojis[pairIndex]
      } else {
        return "🙊"
      }
    }
  }
  
  @Published private var model = createMemoryGame()
  
  enum Theme: String, CaseIterable, Identifiable {
    case halloween, beach, vehicles, food
    var id: Self { self }
  }
  @State var selectedTheme: Theme
  
  var color: Color {
    .orange
  }
  
  var cards: Array<MemoryGame<String>.Card> {
    return model.cards
  }
  
  // MARK: - Intents
  
  func shuffle() {
    model.shuffle()
  }
  
  func newGame(){
    model = EmojiMemoryGame.createMemoryGame()
  }
  
  func choose(_ card: MemoryGame<String>.Card) {
    model.choose(card)
  }
}
