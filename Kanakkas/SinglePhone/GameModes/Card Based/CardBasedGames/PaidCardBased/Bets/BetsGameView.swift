//
//  BetsGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 16/03/2025.
//

import SwiftUI

enum BetsGameState {
    case placingBets
    case cardsFaceDown
    case cardsRevealed
    case preparingNextRound
}

struct BetsGameView: View {
    let players: [String]
    @State private var player1: String
    @State private var player2: String
    @State private var player1Bet: Int = 1
    @State private var player2Bet: Int = 1
    @StateObject private var deck = InfiniteDeck()
    @State private var player1Card: Card?
    @State private var player2Card: Card?
    @State private var showInfo = false
    @State private var gameState: BetsGameState = .placingBets
    @State private var resultMessage: String = ""
    @State private var showPopup = false
    @State private var lastNewPlayer: String? = nil

    init(players: [String]) {
        self.players = players
        let randomPair = players.shuffled().prefix(2)
        _player1 = State(initialValue: randomPair.first ?? "Player 1")
        _player2 = State(initialValue: randomPair.last ?? "Player 2")
    }

    var body: some View {
        ZStack {
            HomeBackground()

            VStack {
                Spacer()
                HStack {
                    CustomBackButton()
                    Spacer()
                    ZStack {
                        Text("Bets")
                            .font(Font.custom("LuckiestGuy-Regular", size: 53))
                            .foregroundColor(.red)
                            .bold()
                            .shadow(color: .red, radius: 5)
                        
                        Text("Bets")
                            .font(Font.custom("LuckiestGuy-Regular", size: 50))
                            .foregroundColor(.white)
                            .bold()
                            .shadow(color: .red, radius: 5)
                    }
                    .padding(.top)
                    Spacer()
                    BetsInfoButton {
                        showInfo = true
                    }
                }

                HStack {
                    VStack {
                        Text(player1)
                            .font(Font.custom("LuckiestGuy-Regular", size: 30))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 2)

                        if gameState == .placingBets {
                            Stepper("Bet: \(player1Bet) sips", value: $player1Bet, in: 1...10)
                                .font(.title3)
                                .padding()
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                    Spacer()
                    Text("VS")
                        .font(Font.custom("LuckiestGuy-Regular", size: 35))
                        .foregroundColor(.white)
                        .bold()
                        .shadow(color: .black, radius: 3)
                    Spacer()
                    VStack {
                        Text(player2)
                            .font(Font.custom("LuckiestGuy-Regular", size: 30))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 2)

                        if gameState == .placingBets {
                            Stepper("Bet: \(player2Bet) sips", value: $player2Bet, in: 1...10)
                                .font(.title3)
                                .padding()
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal, 30)

                HStack {
                    VStack {
                        if gameState != .placingBets {
                            if gameState == .cardsFaceDown {
                                CardPlaceholder().rotationEffect(.degrees(90))
                                    .padding(.leading, 50) // ✅ Added padding to move card inward
                            } else if let card = player1Card {
                                CardView(card: card).rotationEffect(.degrees(90))
                                    .padding(.leading, 50) // ✅ Keep spacing consistent
                            }
                        }
                    }

                    Spacer()

                    if gameState == .placingBets {
                        Button("Start \n Round") {
                            gameState = .cardsFaceDown
                        }
                        .buttonStyle(BoldButtonStyle())
                        .padding()
                    }

                    Spacer()

                    VStack {
                        if gameState != .placingBets {
                            if gameState == .cardsFaceDown {
                                CardPlaceholder().rotationEffect(.degrees(-90))
                                    .padding(.trailing, 50) // ✅ Added padding to move card inward
                            } else if let card = player2Card {
                                CardView(card: card).rotationEffect(.degrees(-90))
                                    .padding(.trailing, 50) // ✅ Keep spacing consistent
                            }
                        }
                    }
                }
                .padding(.horizontal, 40) // ✅ Ensures additional spacing

                Spacer()
            }

            if showInfo {
                BetsInfoView { showInfo = false }
                    .transition(.opacity)
            }

            if showPopup {
                BetsResultPopupView(message: resultMessage)
                    .transition(.opacity)
                    
            }
        }
        .overlay(TableEdge())
        .navigationBarBackButtonHidden(true)
        .onTapGesture { handleTap() }
    }
    
    private func handleTap() {
        switch gameState {
        case .cardsFaceDown:
            playRound()
            gameState = .cardsRevealed
            showPopup = true

        case .cardsRevealed:
            showPopup = false
            gameState = .preparingNextRound
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if let winner = determineWinner() {
                    replacePlayer(winner: winner)
                }
                resetGame()
                gameState = .placingBets
            }

        case .placingBets, .preparingNextRound:
            break
        }
    }

    private func playRound() {
        let newCard1 = deck.drawCard()
        let newCard2 = deck.drawCard()
        
        player1Card = newCard1
        player2Card = newCard2

        let winner = determineWinner()
        if winner == player1 {
            resultMessage = "\(player1) vant! \(player2) drikker \(player2Bet) super. \(player1) gir ut \(player1Bet) super! \n \(player2) Fortsetter!"
        } else {
            resultMessage = "\(player2) vant! \(player1) drikker \(player1Bet) super. \(player2) gir ut \(player2Bet) super! \n \(player1) Fortsetter!."
        }

        showPopup = true
    }

    private func determineWinner() -> String? {
        let rankOrder: [String: Int] = ["2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 10, "J": 11, "Q": 12, "K": 13, "A": 14]
        guard let card1 = player1Card, let card2 = player2Card else { return nil }
        
        let value1 = rankOrder[card1.rank] ?? 0
        let value2 = rankOrder[card2.rank] ?? 0
        return value1 > value2 ? player1 : player2
    }

    private func replacePlayer(winner: String) {
        let newPlayer = players.filter { $0 != winner && $0 != lastNewPlayer }.randomElement() ?? winner
        lastNewPlayer = newPlayer
        if player1 == winner {
            player1 = newPlayer
        } else {
            player2 = newPlayer
        }
    }

    private func resetGame() {
        player1Card = nil
        player2Card = nil
        player1Bet = 1
        player2Bet = 1
    }
}

// 🎭 Custom Rule Pop-up
struct BetsResultPopupView: View {
    let message: String

    var body: some View {
        VStack {
            Text(message)
                .font(Font.custom("LuckiestGuy-Regular", size: 22))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.red.opacity(0.8))
                .cornerRadius(15)
                .shadow(radius: 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .transition(.opacity)
    }
}

// 🔴 Card Placeholder UI
struct BetsCardPlaceholder: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.red)
            .frame(width: 200, height: 320)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 4))
            .shadow(radius: 5)
            .frame(width: 200, height: 200)
    }
}

struct BoldButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Font.custom("LuckiestGuy-Regular", size: 26))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
            .frame(width: 150, height: 100)
            .background(configuration.isPressed ? Color.red.opacity(0.7) : Color.red)
            .cornerRadius(12)
            .shadow(radius: 5)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

// MARK: - Preview
struct BetsGameView_Previews: PreviewProvider {
    static var previews: some View {
        BetsGameView(players: ["Marius", "Sara", "Jonas", "Nruh", "Lukas"])
            .previewInterfaceOrientation(.landscapeRight) // ✅ Landscape mode
    }
}
