//
//  ContentView.swift
//  Memorize
//
//  Created by Ari Oppenheimer on 8/8/24.
//

import SwiftUI

let halloween: [String] = ["👻", "🎃", "🧙", "🏚️", "😈", "🕷️", "💀", "🥧", "🕸️", "👻", "🎃", "🧙", "🏚️", "😈", "🕷️", "💀", "🥧", "🕸️"]
let beach: [String] = ["🌊","👙", "🏖️", "☀️", "🐚", "⛱️", "🏝️", "🩱", "🩳", "🌊","👙", "🏖️", "☀️", "🐚", "⛱️", "🏝️", "🩱", "🩳"]
let vehicles: [String] = ["🚗", "🚙", "🏎️", "🚃", "🚖", "🚔", "🚢", "🚎", "🚍", "🚗", "🚙", "🏎️", "🚃", "🚖", "🚔", "🚢", "🚎", "🚍"]
let food: [String] = ["🌮", "🌯", "🌭", "🥗", "🍕", "🧁", "🍦", "🥑", "🥐", "🌶️", "🌮", "🌯", "🌭", "🥗", "🍕", "🧁", "🍦", "🥑", "🥐", "🌶️"]

struct ContentView: View {
  @State var emojis = halloween
  
  var body: some View {
    VStack{
      Text("Memorize!").bold().font(.system(size: 32))
      ScrollView {
        drawCards()
      }
      Spacer()
      themeAdjusters
    }
    .padding()
  }
  
  func drawCards() -> some View {
    emojis.shuffle()
    return LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
      ForEach(0..<emojis.count, id: \.self) { index in
        CardView(content: emojis[index])
          .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
      }
    }.foregroundColor(.orange)
  }

  var themeAdjusters: some View {
    HStack{
      themeChooser(emoji: beach, themeName: "Beach", symbol: "beach.umbrella")
      Spacer()
      themeChooser(emoji: vehicles,themeName: "Vehicles", symbol: "car")
      Spacer()
      themeChooser(emoji: food, themeName: "Food", symbol: "fork.knife")
      Spacer()
      themeChooser(emoji: halloween, themeName: "Halloween", symbol: "moon")
    }
  }

  func themeChooser(emoji: [String], themeName: String, symbol: String) -> some View {
    Button(action: {
      emojis = emoji
      drawCards()
    }, label: {
      VStack {
        Image(systemName: symbol).imageScale(.large)
        Text(themeName)
      }.foregroundColor(.orange)
    })
  }
}

struct CardView: View {
  let content: String
  @State var isFaceUp: Bool = false
  
  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: 12)
      Group {
        base.fill(.white)
        base.strokeBorder(lineWidth: 2)
        Text(content).font(.largeTitle)
      }
      .opacity(isFaceUp ? 1 : 0)
      base.fill().opacity(isFaceUp ? 0 : 1)
    }
    .onTapGesture {
      isFaceUp.toggle()
    }
  }
}

#Preview {
    ContentView()
}
