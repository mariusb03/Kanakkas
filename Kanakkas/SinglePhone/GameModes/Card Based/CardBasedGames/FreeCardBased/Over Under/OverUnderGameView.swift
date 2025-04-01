//
//  OverUnderGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 12/03/2025.
//

import SwiftUI

struct OverUnderGameView: View {
    @StateObject private var deck = InfiniteDeck()
    @State private var previousCard: Card? = nil
    @State private var currentCard: Card
    @State private var showResult = false
    @State private var resultMessage = ""
    @State private var showInfo = false
    @State private var loserPot = 2

    init() {
        let firstCard = InfiniteDeck().drawCard()
        _currentCard = State(initialValue: firstCard)
    }

    var body: some View {
        ZStack {
            HomeBackground()

            VStack() {
                
                HStack {
                    CustomBackButton()
                    
                    Spacer()
                    
                    VStack {
                        ZStack {
                            Text("Over/Under!")
                                .font(Font.custom("LuckiestGuy-Regular", size: 44))
                                .foregroundColor(.red)
                                .shadow(color: .red, radius: 5)
                            
                            Text("Over/Under!")
                                .font(Font.custom("LuckiestGuy-Regular", size: 42))
                                .foregroundColor(.white)
                                .shadow(color: .red, radius: 5)
                        }
                        
                        Text("Taperpotten: \(loserPot) slurker!")
                            .font(Font.custom("LuckiestGuy-Regular", size: 24))
                            .foregroundColor(.white)
                            .shadow(color: .red, radius: 5)
                            .shadow(color: .red, radius: 5)
                            
                    }
                    
                    Spacer()
                    
                    OverUnderInfoButton {
                        showInfo = true
                    }
                }
                .padding(.top, 20)

                Spacer()
                // 🔙 Previous Card
                HStack {
                    
                    Spacer()
                    
                    Button(action: { handleGuess(isHigher: false) }) {
                        Text("Lavere")
                            .font(Font.custom("LuckiestGuy-Regular", size: 34))
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    
                    .padding(.horizontal)
                    
                    VStack {
                        Text("Forrige kort")
                            .font(Font.custom("LuckiestGuy-Regular", size: 20))
                            .foregroundColor(.white)
                        
                        if let prev = previousCard {
                            CardView(card: prev)
                                .scaleEffect(0.6)
                                .opacity(0.8)
                        } else {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.4))
                                .frame(width: 100, height: 140)
                                .overlay(Text("?").font(.largeTitle))
                        }
                    }
                    
                    Spacer()
                    
                    
                    // 🃏 Current Card
                    CardView(card: currentCard)
                        .frame(width: 150, height: 220)
                        .shadow(radius: 5)
                    
                    Spacer()
                    Spacer()
                    
                    Button(action: { handleGuess(isHigher: true) }) {
                        Text("Høyere")
                            .font(Font.custom("LuckiestGuy-Regular", size: 34))
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        
                    }
                    
                    Spacer()
                }

                Spacer()
                
            }

            // 🎉 Result Popup
            if showResult {
                VStack {
                    Text(resultMessage)
                        .font(Font.custom("LuckiestGuy-Regular", size: 28))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding()

                    Button("Neste kort") {
                        
                        showResult = false
                        drawNextCard()
                    }
                    .font(Font.custom("LuckiestGuy-Regular", size: 28))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .frame(width: 400)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.red.opacity(0.8)))
                .shadow(radius: 10)
                .transition(.scale)
            }
        }
        .overlay (
            TableEdge()
        )
        .animation(.easeInOut, value: showResult)
        .navigationBarBackButtonHidden()
    }

    // MARK: - Game Logic
    private func handleGuess(isHigher: Bool) {
        let nextCard = deck.drawCard()

        let currentValue = rankValue(for: currentCard.rank)
        let nextValue = rankValue(for: nextCard.rank)

        let isCorrect = isHigher ? nextValue > currentValue : nextValue < currentValue

        if isCorrect {
            loserPot += 1
            resultMessage = "Riktig! \n Legg til 1 slurker i taperpotten, gi ut 2 slurker og gi mobilen videre!"
        } else {
            resultMessage = "Feil! \n Drikk \(loserPot) slurker fra taperpotten og prøv på nytt!"
            loserPot = 2
        }

        previousCard = currentCard
        currentCard = nextCard
        showResult = true
    }

    private func drawNextCard() {
        // Logic already handled in handleGuess()
    }
}


func rankValue(for rank: String) -> Int {
    // Only keep the rank part (e.g., remove suit symbols if any)
    let cleaned = rank
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .filter { "23456789JQKA10".contains($0) } // keeps rank only

    switch cleaned {
    case "2": return 2
    case "3": return 3
    case "4": return 4
    case "5": return 5
    case "6": return 6
    case "7": return 7
    case "8": return 8
    case "9": return 9
    case "10": return 10
    case "J": return 11
    case "Q": return 12
    case "K": return 13
    case "A": return 14
    default: return 0
    }
}

// MARK: - Preview
struct OverUnderGameView_Previews: PreviewProvider {
    static var previews: some View {
        OverUnderGameView()
    }
}
