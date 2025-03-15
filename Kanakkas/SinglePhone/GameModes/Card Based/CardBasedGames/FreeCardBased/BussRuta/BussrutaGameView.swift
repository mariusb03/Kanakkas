//
//  BussrutaGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 14/03/2025.
//

import SwiftUI

// MARK: - Bussruta Game View
struct BussrutaGameView: View {
    let rowSizes = [5, 4, 3, 2, 1] // Pyramid starts wide at bottom
    @State private var flippedCards: [[Bool]]
    @State private var pyramid: [[Card]]
    @State private var currentRow = 0
    @State private var showDrinkScreen = false // ✅ Replaces alert
    @State private var showWinScreen = false
    @State private var drinkMessage = ""
    @State private var shouldResetGame = false
    @State private var currentPlayerIndex = 0
    @State private var showInfo = false
    
    let players: [String]
    let cardWidth: CGFloat = UIScreen.main.bounds.width / 10
    let cardHeight: CGFloat = UIScreen.main.bounds.height / 3
    
    init(players: [String]) {
        self.players = players
        let newPyramid = BussrutaGameView.generatePyramid(rowSizes: rowSizes)
        _flippedCards = State(initialValue: rowSizes.map { Array(repeating: false, count: $0) })
        _pyramid = State(initialValue: newPyramid)
    }
    
    var body: some View {
        ZStack {
            HomeBackground()
            VStack {
                if showWinScreen {
                    CongratulationsView(
                        playerName: players[currentPlayerIndex],
                        onNext: switchToNextPlayer
                    )
                } else if showDrinkScreen {
                    DrinkingMessageView(
                        message: drinkMessage,
                        onDismiss: {
                            showDrinkScreen = false
                            if shouldResetGame {
                                resetPlayer()
                            }
                        }
                    )
                } else {
                    HStack {
                        CustomBackButton()
                        Spacer()
                        ZStack {
                            Text("Bussruta")
                                .font(Font.custom("LuckiestGuy-Regular", size: 52))
                                .foregroundStyle(.red)
                                .padding(.top, 50)
                                .shadow(color: .red, radius: 5)
                            
                            Text("Bussruta")
                                .font(Font.custom("LuckiestGuy-Regular", size: 50))
                                .foregroundStyle(.white)
                                .padding(.top, 50)
                        }
                        Spacer()
                        BussrutaInfoButton {
                            showInfo = true // 
                            }
                    }
                    
                    ZStack {
                        Text("Spiller: \(players[currentPlayerIndex])")
                            .font(Font.custom("LuckiestGuy-Regular", size: 32))
                            .foregroundStyle(.red)
                            .padding(.bottom, 10)
                            .shadow(color: .red, radius: 5)
                        
                        Text("Spiller: \(players[currentPlayerIndex])")
                            .font(Font.custom("LuckiestGuy-Regular", size: 30))
                            .foregroundStyle(.white)
                            .padding(.bottom, 10)
                    }
                    
                    Spacer()
                    
                    ScrollViewReader { proxy in
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 10) {
                                ForEach((0..<rowSizes.count).reversed(), id: \.self) { row in
                                    if row <= currentRow {
                                        HStack(spacing: 5) {
                                            ForEach(0..<rowSizes[row], id: \.self) { col in
                                                BussrutaCardView(
                                                    isFlipped: $flippedCards[row][col],
                                                    card: pyramid[row][col],
                                                    isEnabled: row == currentRow,
                                                    cardWidth: cardWidth,
                                                    cardHeight: cardHeight,
                                                    onFlip: {
                                                        handleCardFlip(row: row, col: col, proxy: proxy)
                                                    }
                                                )
                                            }
                                        }
                                        .id(row) // ✅ Each row has an ID for scrolling
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    
                    Spacer()
                }
            }
            if showInfo {
                BussrutaInfoView {
                    showInfo = false // Dismiss overlay
                }
                .transition(.opacity) // Smooth fade-in effect
            }
        }
        .overlay(
            TableEdge()
        )
        .navigationBarBackButtonHidden(true)
    }
    
    // ✅ Handle Card Flip Logic + Auto-Scroll to Next Row
    private func handleCardFlip(row: Int, col: Int, proxy: ScrollViewProxy) {
        let pyramidCard = pyramid[row][col]
        
        if ["A", "J", "Q", "K"].contains(pyramidCard.rank) {
            drinkMessage = getDrinkMessage(for: row)
            showDrinkScreen = true // ✅ Show the new drinking message view
            shouldResetGame = true
        } else {
            flippedCards[row][col] = true
            if currentRow + 1 < rowSizes.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        currentRow += 1
                        proxy.scrollTo(currentRow, anchor: .center)
                    }
                }
            } else {
                showWinScreen = true
            }
        }
    }
    
    // ✅ Move to Next Player (Only after win screen)
    private func switchToNextPlayer() {
        showWinScreen = false
        if currentPlayerIndex + 1 < players.count {
            currentPlayerIndex += 1
        } else {
            currentPlayerIndex = 0
        }
        resetGame()
    }
    
    // ✅ Reset Player (When they hit a picture card)
    private func resetPlayer() {
        let newPyramid = BussrutaGameView.generatePyramid(rowSizes: rowSizes)
        flippedCards = rowSizes.map { Array(repeating: false, count: $0) }
        pyramid = newPyramid
        currentRow = 0
        shouldResetGame = false
    }
    
    // ✅ Reset Game for the Next Player
    private func resetGame() {
        let newPyramid = BussrutaGameView.generatePyramid(rowSizes: rowSizes)
        flippedCards = rowSizes.map { Array(repeating: false, count: $0) }
        pyramid = newPyramid
        currentRow = 0
        shouldResetGame = false
    }
    
    // ✅ Generate Pyramid
    private static func generatePyramid(rowSizes: [Int]) -> [[Card]] {
        let deck = InfiniteDeck()
        return rowSizes.map { rowSize in
            (0..<rowSize).map { _ in deck.drawCard() }
        }
    }
    
    // ✅ Get Drink Message
    private func getDrinkMessage(for row: Int) -> String {
        switch row {
        case 0: return "2 slurker 🍺"
        case 1: return "4 slurker 🍺🍺"
        case 2: return "6 slurker 🍺🍺🍺"
        case 3: return "8 slurker 🍺🍺🍺🍺"
        case 4: return "SHOT eller CHUG! 🔥"
        default: return "Drikk!"
        }
    }
}

// MARK: - 🎉 Drinking Message View (New)
struct DrinkingMessageView: View {
    let message: String
    let onDismiss: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("🎉 Drikk! 🎉")
                .font(Font.custom("LuckiestGuy-Regular", size: 32))
                .foregroundStyle(.white)
                .bold()
                .multilineTextAlignment(.center)

            Text(message)
                .font(Font.custom("LuckiestGuy-Regular", size: 32))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)

            Button(action: onDismiss) {
                Text("Ok!")
                    .font(Font.custom("LuckiestGuy-Regular", size: 32))
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.red).shadow(radius: 10))
        
    }
}

// MARK: - Bussruta Card View
struct BussrutaCardView: View {
    @Binding var isFlipped: Bool
    let card: Card
    let isEnabled: Bool
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    let onFlip: () -> Void

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(isFlipped ? Color.white : Color.red)
            .frame(width: cardWidth, height: cardHeight)
            .overlay(isFlipped ? CardRepresentation(card: card) : nil)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 4))
            .opacity(isEnabled ? 1.0 : 0.9)
            .onTapGesture {
                if isEnabled && !isFlipped {
                    isFlipped = true
                    onFlip()
                }
            }
    }
}

// MARK: - Card Representation
struct CardRepresentation: View {
    let card: Card

    var body: some View {
        VStack {
            Text(card.rank)
                .font(.system(size: 18))
                .foregroundColor(getSuitColor(card.suit))
            Text(card.suit)
                .font(.system(size: 22))
        }
    }

    private func getSuitColor(_ suit: String) -> Color {
        return (suit == "♥️" || suit == "♦️") ? .red : .black
    }
}

struct CongratulationsView: View {
    let playerName: String
    let onNext: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("🎉 Gratulerer, \(playerName)! 🎉")
                .font(Font.custom("LuckiestGuy-Regular", size: 32))
                .foregroundStyle(.white)
                .bold()
                .multilineTextAlignment(.center)

            Text("🚍 Du har fullført Bussruta! 🚍")
                .font(Font.custom("LuckiestGuy-Regular", size: 32))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)

            Button(action: onNext) {
                Text("Neste spiller")
                    .font(Font.custom("LuckiestGuy-Regular", size: 32))
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.red).shadow(radius: 10))
        
    }
}

// MARK: - Preview
struct BussrutaGameView_Previews: PreviewProvider {
    static var previews: some View {
        BussrutaGameView(players: ["Marius", "Sara", "Jonas"])
    }
}
