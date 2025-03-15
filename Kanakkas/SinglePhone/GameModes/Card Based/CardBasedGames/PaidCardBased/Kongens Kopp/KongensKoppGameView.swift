//
//  KongensKoppGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 15/03/2025.
//

import SwiftUI

struct KongensKoppGameView: View {
    @StateObject private var deck = InfiniteDeck()
    @State private var topCard: Card
    @State private var previousCard: Card? = nil
    @State private var showInfo = false
    @State private var drawnRulesMessage: String = ""
    @State private var showPopup = false
    @State private var kingCount = 0

    init() {
        let initialCard = InfiniteDeck().drawCard()
        _topCard = State(initialValue: initialCard)
    }

    var body: some View {
        ZStack {
            // 🏡 Background
            HomeBackground()
            
            VStack {
                HStack {
                    
                    CustomBackButton()
                        .padding(.top, 20)
                    Spacer()
                    
                    ZStack {
                        Text("Kongens Kopp!")
                            .font(Font.custom("LuckiestGuy-Regular", size: 42))
                            .foregroundColor(.red)
                            .bold()
                            .shadow(color: .red, radius: 5)
                        
                        Text("Kongens Kopp!")
                            .font(Font.custom("LuckiestGuy-Regular", size: 40))
                            .foregroundColor(.white)
                            .bold()
                            .shadow(color: .red, radius: 5)
                        
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    KongensKoppInfoButton {
                        showInfo = true
                    }
                    .padding(.top, 20)
                }
                
                Spacer()
                
                VStack {
                    CardGameView(updatePreviousCard: { newCard in
                        handleCardDraw(newCard)
                    })
                    .shadow(radius: 5)
                    .padding(.bottom, 20)
                }
                Spacer()
            }
            
        
            
            // ℹ️ Info Overlay
            if showInfo {
                KongensKoppInfoView {
                    showInfo = false
                }
                .transition(.opacity)
            }
            
            // 🍺 Rule Pop-up
            if showPopup {
                RulePopupView(message: drawnRulesMessage)
            }
        }
        .overlay(TableEdge())
        .animation(.easeInOut(duration: 0.5), value: showInfo)
        .onTapGesture {
            if showPopup {
                showPopup = false
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    // 🎴 Handle the drawn card and fetch the correct rule
    private func handleCardDraw(_ card: Card) {
        DispatchQueue.main.async {
            print("🃏 New card drawn: Rank = '\(card.rank)', Suit = '\(card.suit)'")

            // ✅ Immediately update `topCard` to match the displayed UI
            self.previousCard = self.topCard
            self.topCard = card

            // ✅ Fetch the rule AFTER `topCard` is updated
            self.drawnRulesMessage = self.getRuleForCard(card)

            // ✅ Display the pop-up with the correct rule
            self.showPopup = true
        }
    }
    
    // 📜 Get the rule for the drawn card
    private func getRuleForCard(_ newCard: Card) -> String {
        let rank = newCard.rank.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        print("🔎 Checking rule for rank: '\(rank)'")

        switch rank {
        case "A": return "Ess – FOSS! Alle begynner å drikke, personen til høyre må fortsette til venstre stopper!"
        case "2": return "2 – Velg noen til å drikke."
        case "3": return "3 – Personen som trakk kortet drikker."
        case "4": return "4 – Alle må ta på gulvet, den siste personen drikker."
        case "5": return "5 – Alle gutta drikker."
        case "6": return "6 – Alle jentene drikker."
        case "7": return "7 – Alle peker opp mot himmelen, den siste personen drikker."
        case "8": return "8 – Velg en 'mate'. Når du drikker, må de også drikke."
        case "9": return "9 – RIM! Velg et ord, og alle må si et som rimer. Den som feiler, drikker."
        case "10": return "10 – KATEGORIER! Velg en kategori, alle må si noe som passer. Feiler du, drikk!"
        case "J", "JACK": return "JACK – LAG EN REGEL! Alle må følge regelen gjennom spillet."
        case "Q", "QUEEN": return "Dronning – SPØRSMÅL! Still et spørsmål, de må svare med et nytt spørsmål. Feiler du, drikk!"
        case "K", "KING":
            kingCount += 1
            if kingCount == 4 {
                return "👑 Den FJERDE KONGEN er trukket! Du må drikke hele koppen i midten! 🍺"
            } else {
                return "👑 Kong! Hell litt av drikken din i koppen i midten."
            }
        default:
            print("⚠️ Unknown rank received: '\(rank)'")
            return "Ukjent kort – Finn på din egen regel!"
        }
    }
}

// 🎭 Custom Rule Pop-up
struct RulePopupView: View {
    let message: String

    var body: some View {
        VStack {
            Text(message)
                .font(Font.custom("LuckiestGuy-Regular", size: 22))
                .foregroundColor(.yellow)
                .padding()
                .background(Color.red.opacity(0.8))
                .cornerRadius(15)
                .shadow(radius: 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.5))
        .transition(.opacity)
    }
}

// MARK: - Preview
struct KongensKoppGameView_Previews: PreviewProvider {
    static var previews: some View {
        KongensKoppGameView()
    }
}
