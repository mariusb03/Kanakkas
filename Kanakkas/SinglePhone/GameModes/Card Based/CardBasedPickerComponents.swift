//
//  CardBasedPickerComponents.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 11/03/2025.
//

import SwiftUI

// MARK: Title Card
struct CardBasedPickerTitleCard: View {
    @State private var isTapped = false
    @State private var offsetY: CGFloat = -300
    
    var body: some View {
            ZStack {
                Text("Velg spill!")
                    .font(Font.custom("LuckiestGuy-Regular", size: 43))
                    .foregroundColor(.red)
                    .shadow(color: .red, radius: 10)
                
                Text("Velg spill!")
                    .font(Font.custom("LuckiestGuy-Regular", size: 40))
                    .foregroundColor(.white)
                    .shadow(color: .red, radius: 10)
            }
            .offset(y: offsetY) // Slide-in animation
                    .animation(.easeOut(duration: 1.0), value: offsetY)
                    .onAppear {
                        offsetY = 0 // Moves down into position
                    }
                    .scaleEffect(isTapped ? 1.2 : 1.0) // Bounce effect
                    .onTapGesture {
                        isTapped.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            isTapped = false
                        }
                    }
            .padding(.top)
    }
}

// MARK: - QACPackButton
struct CardBasedGameButton: View {
    let game: CardBasedGame
    @Binding var selectedPack: CardBasedGame?
    let animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedPack = game
            }
        }) {
            ZStack {
                Text(game.title)
                    .font(Font.custom("LuckiestGuy-Regular", size: 33))
                    .foregroundColor(.red)
                    .shadow(color: .red, radius: 5)
                    .multilineTextAlignment(.center)
                    .frame(width: 250, height: 100)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .matchedGeometryEffect(id: game.title, in: animation)
                
                Text(game.title)
                    .font(Font.custom("LuckiestGuy-Regular", size: 30))
                    .foregroundColor(.white)
                    .shadow(color: .red, radius: 5)
                    .multilineTextAlignment(.center)
                    .frame(width: 250, height: 100)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .matchedGeometryEffect(id: game.title, in: animation)
            }
        }
    }
}

// MARK: - QACPackDetailView (Expanded View)
struct CardBasedGameDetailView: View {
    let cardBasedGame: CardBasedGame
    let animation: Namespace.ID
    let onClose: () -> Void
    let players: [String]
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                ZStack {
                    Text(cardBasedGame.title)
                        .font(Font.custom("LuckiestGuy-Regular", size: 32))
                        .foregroundColor(.white)
                        .shadow(color: .red, radius: 5)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 300, height: 100)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        .matchedGeometryEffect(id: cardBasedGame.title, in: animation)
                    
                    Text(cardBasedGame.title)
                        .font(Font.custom("LuckiestGuy-Regular", size: 32))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .shadow(color: .red, radius: 5)
                        .padding()
                        .frame(width: 300, height: 100)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        .matchedGeometryEffect(id: cardBasedGame.title, in: animation)
                }
                
                Text(cardBasedGame.description)
                    .font(Font.custom("LuckiestGuy-Regular", size: 20))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 550, height: 150)
                
                if cardBasedGame.title == "Vorset          Starter!" {
                    NavigationLink(destination: VorsetStarterGameView(players: players)) {
                        GameModeActionButton(title: "Spill")
                    }
                }
                
                if cardBasedGame.title == "Damenes        aften!" {
                    NavigationLink(destination: DamenesAftenGameView(players: players)) {
                        GameModeActionButton(title: "Spill")
                    }
                }
                
                if cardBasedGame.title == "All-In gutta!" {
                    NavigationLink(destination: AllInGuttaGameView(players: players)) {
                        GameModeActionButton(title: "Spill")
                    }
                }
                
                if cardBasedGame.title == "Er det varmt her?" {
                    NavigationLink(destination: ErDetVarmtHerGameView(players: players)) {
                        GameModeActionButton(title: "Spill")
                    }
                }
                
                if cardBasedGame.title == "Nach!" {
                    NavigationLink(destination: NachGameView(players: players)) {
                        GameModeActionButton(title: "Spill")
                    }
                }
                
                if cardBasedGame.title == "Dag 2!" {
                    NavigationLink(destination: Dag2GameView(players: players)) {
                        GameModeActionButton(title: "Spill")
                    }
                }
                
                
                // "Tilbake" Button
                Button(action: onClose) {
                    GameModeActionButton(title: "Tilbake")
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        }
    }
}


// MARK: - QACPack Model
struct CardBasedGame: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
    let description: String
}


// MARK: Free Packs
let cardBasedFreeGames = [
    CardBasedGame(title: "Over/under!", color: .red, description: "!"),
    
    CardBasedGame(title: "Kongens Kopp!", color: .blue, description: "!"),
    
    CardBasedGame(title: "Buss Turen!", color: .pink, description: "!"),
    
]


// MARK: Paid Packs
let cardBasedPaidGames = [
    CardBasedGame(title: "Krig!", color: .gray, description: "!"),
    
    CardBasedGame(title: "Premium      Pack 2", color: .black, description: "!"),
    
    CardBasedGame(title: "Premium      Pack 3", color: .gold, description: "!")
]

// 🛠 Preview
struct CardBasedPickerComponents_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CardBasedPickerView(players: ["Hurb", "Bruh"])
        }
         
    }
}
