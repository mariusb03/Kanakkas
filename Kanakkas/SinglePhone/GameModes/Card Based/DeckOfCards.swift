//
//  DeckOfCards.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 12/03/2025.
//

import SwiftUI

// MARK: - Card Model
struct Card: Identifiable, Equatable {
    let id = UUID()
    let suit: String
    let rank: String

    var description: String {
        return "\(rank) of \(suit)"
    }
    
    // ✅ Define equality check based on rank
        static func == (lhs: Card, rhs: Card) -> Bool {
            return lhs.rank == rhs.rank
        }
}

// MARK: - Infinite Deck Manager
class InfiniteDeck: ObservableObject {
    @Published private var deck: [Card] = []
    
    private let suits = ["♠️", "♥️", "♦️", "♣️"]
    private let ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

    init() {
        shuffleDeck()
    }

    // Draw a card from the deck
    func drawCard() -> Card {
        if deck.isEmpty {
            shuffleDeck()
        }
        return deck.removeFirst()
    }

    // Shuffle and recreate the deck
    private func shuffleDeck() {
        deck = suits.flatMap { suit in
            ranks.map { rank in
                Card(suit: suit, rank: rank)
            }
        }
        deck.shuffle()
    }
}

// MARK: - Card Game View (Handles Tap to Draw with Animation)
struct CardGameView: View {
    @StateObject private var deck = InfiniteDeck()
    @State private var currentCard: Card
    @State private var nextCard: Card
    @State private var cardOffset: CGFloat = 0
    @State private var cardOpacity: Double = 1.0
    @State private var isSliding = false
    @State private var showCurrentCard = true
    
    var updatePreviousCard: (Card) -> Void // Closure to update the previous card
    
    init(updatePreviousCard: @escaping (Card) -> Void) {
        let deck = InfiniteDeck() // Create deck inside init
        _currentCard = State(initialValue: deck.drawCard()) // Draw first random card
        _nextCard = State(initialValue: deck.drawCard()) // Draw second random card
        self.updatePreviousCard = updatePreviousCard
    }
    
    var body: some View {
        ZStack {
            // Fake deck background
            ForEach(0..<3, id: \.self) { index in
                CardBackView()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(index % 2 == 0 ? Color.black : Color.red, lineWidth: 3)
                    )
                    .offset(x: CGFloat(-15 + (index * 5)), y: CGFloat(15 - (index * 5)))
            }
            
            // Next card (Always underneath, ready to be revealed)
            CardView(card: nextCard)
                .opacity(cardOpacity)
            
            // Current card (only visible when not sliding off)
            if showCurrentCard {
                CardView(card: currentCard)
                    .offset(x: cardOffset) // Moves off screen
                    .animation(.easeInOut(duration: 0.4), value: cardOffset) // Smooth slide
            }
        }
        .frame(width: 200, height: 220)
        .onTapGesture {
            isSliding = true
            cardOffset = UIScreen.main.bounds.width // Slide current card off right
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                showCurrentCard = false // Hide current card once it's off-screen
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                updatePreviousCard(currentCard) // Send the current card as the previous card
                
                currentCard = nextCard // The next card becomes the current card
                nextCard = deck.drawCard() // Load a new card under the deck
                cardOffset = 0 // Reset position for the next animation
                isSliding = false
                showCurrentCard = true // Show current card again
            }
        }
        
    }
}

// MARK: - Fake Card Back View 🎴
struct CardBackView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .frame(width: 200, height: 320)
            .shadow(radius: 5)
    }
}

// MARK: - Card View
struct CardView: View {
    let card: Card

    var body: some View {
        ZStack {
            // Card Shape
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: 200, height: 320)
                .shadow(color: getSuitColor(card.suit), radius: 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(getSuitColor(card.suit), lineWidth: 3)
                )

            VStack {
                // Top-left rank & suit
                HStack {
                    VStack(alignment: .leading) {
                        Text(card.rank)
                            .font(Font.custom("LuckiestGuy-Regular", size: 32))
                            .foregroundColor(getSuitColor(card.suit))
                        Text(card.suit)
                            .font(.title)
                    }
                    .padding(.leading, 15)
                    Spacer()
                }

                Spacer()

                // Large Suit in Center
                Text(card.suit)
                    .font(.system(size: 80))
                    .shadow(color: getSuitColor(card.suit).opacity(0.8), radius: 8)

                Spacer()

                // Bottom-right rank & suit (Mirrored)
                HStack {
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(card.suit)
                            .font(.title)
                        Text(card.rank)
                            .font(Font.custom("LuckiestGuy-Regular", size: 32))
                            .foregroundColor(getSuitColor(card.suit))
                    }
                    .rotationEffect(.degrees(180)) // Flip for playing card style
                    .padding(.trailing, 5)
                }
            }
            .padding(12)
        }
        .frame(width: 200, height: 200)
    }
    

    // Suit color function (Red for Hearts & Diamonds, Black for Clubs & Spades)
    private func getSuitColor(_ suit: String) -> Color {
        return (suit == "♥️" || suit == "♦️") ? .red : .black
    }
}


// MARK: - Card View
struct KrigCardView: View {
    let card: Card

    var body: some View {
        ZStack {
            // Card Shape
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: 140, height: 220)
                .shadow(color: getSuitColor(card.suit), radius: 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(getSuitColor(card.suit), lineWidth: 3)
                )

            VStack {
                // Top-left rank & suit
                HStack {
                    VStack(alignment: .leading) {
                        Text(card.rank)
                            .font(Font.custom("LuckiestGuy-Regular", size: 32))
                            .foregroundColor(getSuitColor(card.suit))
                        Text(card.suit)
                            .font(.title)
                    }
                    .padding(.leading, 15)
                    Spacer()
                }

                Spacer()

                // Large Suit in Center
                Text(card.suit)
                    .font(.system(size: 80))
                    .shadow(color: getSuitColor(card.suit).opacity(0.8), radius: 8)

                Spacer()

                // Bottom-right rank & suit (Mirrored)
                HStack {
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(card.suit)
                            .font(.title)
                        Text(card.rank)
                            .font(Font.custom("LuckiestGuy-Regular", size: 32))
                            .foregroundColor(getSuitColor(card.suit))
                    }
                    .rotationEffect(.degrees(180)) // Flip for playing card style
                    .padding(.trailing, 5)
                }
            }
            .padding(12)
        }
        .frame(width: 140, height: 220)
    }

    // Suit color function (Red for Hearts & Diamonds, Black for Clubs & Spades)
    private func getSuitColor(_ suit: String) -> Color {
        return (suit == "♥️" || suit == "♦️") ? .red : .black
    }
}

// MARK: - Preview
struct CardGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardGameView(updatePreviousCard: { _ in })
    }
}
