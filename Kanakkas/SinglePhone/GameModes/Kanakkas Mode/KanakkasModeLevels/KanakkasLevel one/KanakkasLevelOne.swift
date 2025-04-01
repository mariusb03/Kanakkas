//
//  KanakkasLevelOne.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 23/03/2025.
//

enum KanakkasGameType {
    case overUnder
    case qac
    case skillChallenge
    case spinTheWheel
    case kongensKopp
    case betRound
    case finished
}

struct KanakkasRound {
    let type: KanakkasGameType
    let data: Any? // You can pass a QAC card, wheel options, skill challenge, etc.
}

let kanakkasLevelOneRounds: [KanakkasRound] = [
    KanakkasRound(type: .overUnder, data: nil),
    
    KanakkasRound(type: .spinTheWheel, data: [
        WheelOption(text: "Drikk 2", color: .green),
        WheelOption(text: "Gi ut 3", color: .blue),
        WheelOption(text: "Shot!", color: .red),
        WheelOption(text: "Wildcard", color: .orange),
    ]),
    
    KanakkasRound(
        type: .qac,
        data: QACCard(
            title: "Flause",
            description: "Hva er det flaueste du har gjort på fylla?",
            category: "flau",
            needsPlayer: false
        )
    ),
    
    KanakkasRound(
        type: .qac,
        data: QACCard(
            title: "Bruhe",
            description: "Hva er det flaueste du har gjort på fylla?",
            category: "flau",
            needsPlayer: false
        )
    ),
    
    
    KanakkasRound(
        type: .skillChallenge,
        data: QACCard(
            title: "Korkekast",
            description: "Kast en kork i en kopp fra 2 meter – bom = 3 slurker",
            category: "challenge",
            needsPlayer: false
        )
    ),
    
    KanakkasRound(type: .kongensKopp, data: "Kongen velger noen som skal drikke!"),
    
    KanakkasRound(type: .betRound, data: ["Marius", "Sara", "Jonas", "Lukas"]),
    
    KanakkasRound(type: .finished, data: nil)
]

import SwiftUI

struct KanakkasLevelOne: View {
    @Environment(\.dismiss) private var dismiss
    @State  var currentIndex = 0
    @State  var currentRound = kanakkasLevelOneRounds[0]
    @State  var currentStepIndex = 0
    @State  var gameSteps: [KanakkasGameType] = []
    @State  var players: [String]
    @State private var showInfo = false
    
    var body: some View {
        ZStack {
            if case .qac = currentRound.type,
               let card = currentRound.data as? QACCard {
                QACPaginatedView(
                    cards: [card],
                    players: players,
                    onNextGame: goToNextRound,
                    onPreviousGame: goToPreviousRound
                )
            } else if case .skillChallenge = currentRound.type,
                      let card = currentRound.data as? QACCard {
                SkillChallengePaginatedView(cards: [card], players: players)
            } else {
                switch currentRound.type {
                case .overUnder:
                    OverUnderGameView()
                case .spinTheWheel:
                    let options = currentRound.data as! [WheelOption]
                    SpinTheWheelGameView(options: options)
                case .kongensKopp:
                    KongensKoppGameView()
                case .betRound:
                    BetsGameView(players: players)
                case .finished:
                    GameFinishedView()
                default:
                    EmptyView()
                }
            }
            

            // ⬇️ Always-present overlay with back/forward controls
            VStack {
                HStack {
                    CustomBackButton()
                        .padding(.top, 22)

                        Spacer()
                    
                    KrigInfoButton {
                        showInfo = true
                    }
                    .padding(.top, 20)
                }

                Spacer()
                
                Spacer()
                HStack {
                    Button("◀︎ ") {
                        goToPreviousRound()
                    }
                    .font(Font.custom("LuckiestGuy-Regular", size: 20))
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)

                    Button(" ▶︎") {
                        goToNextRound()
                    }
                    .font(Font.custom("LuckiestGuy-Regular", size: 20))
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)

                    Spacer()
                }
                .padding(.leading)
                .padding(.bottom)
            }
            if showInfo {
                KanakkasLevelOneInfo {
                    showInfo = false // Dismiss overlay
                }
                .transition(.opacity) // Smooth fade-in effect
            }
        }
        .overlay(TableEdge())
        .navigationBarBackButtonHidden(true)
    }

    private func goToNextRound() {
        currentIndex += 1
        if currentIndex < kanakkasLevelOneRounds.count {
            currentRound = kanakkasLevelOneRounds[currentIndex]
        } else {
            // 🎉 End of Level
        }
    }
    
    private func goToPreviousRound() {
        if currentIndex > 0 {
            currentIndex -= 1
            currentRound = kanakkasLevelOneRounds[currentIndex]
        }
    }
}


struct QACCard {
    let title: String
    let description: String
    let category: String
    let needsPlayer: Bool
}

let qacCategoryColors: [String: Color] = [
    "flau": .pink,
    "dirty": .purple,
    "deep": .blue,
    "silly": .orange,
    "challenge": .green
]

struct QACPaginatedView: View {
    @Environment(\.dismiss) private var dismiss
    let cards: [QACCard]
    let players: [String]
    let onNextGame: () -> Void
    let onPreviousGame: () -> Void

    @State private var index: Int = 0

    var body: some View {
        let card = cards[index]

        ZStack {
            (qacCategoryColors[card.category] ?? .red)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                Text(card.title)
                    .font(Font.custom("LuckiestGuy-Regular", size: 34))
                    .foregroundColor(.white)

                Text(generateText(for: card))
                    .font(Font.custom("LuckiestGuy-Regular", size: 28))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()

                Spacer()
            }

            // 🔁 Tap zones
            HStack {
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        goToPreviousCard()
                    }

                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        goToNextCard()
                    }
            }
        }
        .overlay(TableEdge())
        .navigationBarBackButtonHidden()
    }

    // 🔁 Card Navigation Logic
    private func goToNextCard() {
        if index < cards.count - 1 {
            index += 1
        } else {
            onNextGame()
        }
    }

    private func goToPreviousCard() {
        if index > 0 {
            index -= 1
        } else {
            onPreviousGame()
        }
    }

    private func generateText(for card: QACCard) -> String {
        guard card.needsPlayer, let player = players.randomElement() else {
            return card.description
        }
        return card.description.replacingOccurrences(of: "{player}", with: player)
    }
}

let skillCategoryColors: [String: Color] = [
    "flau": .pink,
    "dirty": .purple,
    "deep": .blue,
    "silly": .orange,
    "challenge": .green
]

import SwiftUI

struct SkillChallengePaginatedView: View {
    @Environment(\.dismiss) private var dismiss
    let cards: [QACCard]
    let players: [String]

    @State private var index: Int = 0
    @State private var showInfo = false

    var body: some View {
        let card = cards[index]

        ZStack {
            (skillCategoryColors[card.category] ?? .orange)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                // 🧠 Challenge Card
                VStack(spacing: 20) {
                    Text(card.title)
                        .font(Font.custom("LuckiestGuy-Regular", size: 30))
                        .foregroundColor(.white)

                    Text(generateChallengeText(for: card))
                        .font(Font.custom("LuckiestGuy-Regular", size: 28))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.black.opacity(0.25)))
                .shadow(radius: 5)

                Spacer()
            }
            .padding()

            // ℹ️ Optional Info View (if you have one)
            if showInfo {
                HundreSpørsmålInfoView {
                    showInfo = false
                }
                .transition(.opacity)
            }
        }
        .onTapGesture {
            if index < cards.count - 1 {
                index += 1
            }
        }
        .onLongPressGesture {
            if index > 0 {
                index -= 1
            }
        }
        .overlay(TableEdge())
        .navigationBarBackButtonHidden()
    }

    private func generateChallengeText(for card: QACCard) -> String {
        guard card.needsPlayer, let player = players.randomElement() else {
            return card.description
        }
        return card.description.replacingOccurrences(of: "{player}", with: player)
    }
}

struct KongensKoppGameViewWrapper: View {
    @Environment(\.dismiss) private var dismiss
    let onNext: () -> Void

    var body: some View {
        ZStack {
            KongensKoppGameView()
            VStack {
                Spacer()
                Button("Neste spill") {
                    onNext()
                }
                .font(Font.custom("LuckiestGuy-Regular", size: 24))
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            }
        }
    }
}


// MARK: Bet View
struct BetView: View {
    @Environment(\.dismiss) private var dismiss
    let players: [String]
    let onFinish: () -> Void
    

    var body: some View {
        ZStack {
            BetsGameView(players: players)

            VStack {
                Spacer()
                Button("Neste spill") {
                    onFinish()
                }
                .font(Font.custom("LuckiestGuy-Regular", size: 24))
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            }
        }
    }
}

// MARK: Over under
struct OverUnderGameViewWrapper: View {
    @Environment(\.dismiss) private var dismiss
    let onFinish: () -> Void

    var body: some View {
        ZStack {
            OverUnderGameView()

            VStack {
                Spacer()
                Button("Neste spill") {
                    onFinish()
                }
                .font(Font.custom("LuckiestGuy-Regular", size: 24))
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            }
        }
    }
}

// MARK: Spin the wheel
struct SpinTheWheelGameViewWrapper: View {
    @Environment(\.dismiss) private var dismiss
    @State var options: [WheelOption]
    
    let onFinish: () -> Void
    
    var body: some View {
        ZStack {
            SpinTheWheelGameView(options: options)

            
            
        }
    }
}


// MARK: Game Finished
struct GameFinishedView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        
        ZStack {
            HomeBackground()
            
            Spacer()
            
            VStack {
                ZStack {
                    Text("Grattis! \n Dere er nå ferdige med runde 1!")
                        .font(Font.custom("LuckiestGuy-Regular", size: 41))
                        .foregroundStyle(.red)
                        .multilineTextAlignment(.center)
                        .shadow(color: .red, radius: 5)
                        .padding()
                    
                    Text("Grattis! \n Dere er nå ferdige med runde 1!")
                        .font(Font.custom("LuckiestGuy-Regular", size: 40))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .shadow(color: .red, radius: 5)
                        .padding()
                }
                ZStack {
                    Text("Klare for runde 2?")
                        .font(Font.custom("LuckiestGuy-Regular", size: 36))
                        .foregroundStyle(.red)
                        .multilineTextAlignment(.center)
                        .shadow(color: .red, radius: 5)
                        .padding()
                    
                    Text("Klare for runde 2?")
                        .font(Font.custom("LuckiestGuy-Regular", size: 35))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .shadow(color: .red, radius: 5)
                        .padding()
                }
            }
        }
        .overlay (
            TableEdge()
        )
        
    }
}

// MARK: - Preview
struct KanakkasLevelOne_Previews: PreviewProvider {
    static var previews: some View {
        KanakkasLevelOne(players: ["Marius", "Sara", "Jonas", "Lukas"])
    }
}
