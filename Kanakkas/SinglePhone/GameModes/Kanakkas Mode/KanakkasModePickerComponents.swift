//
//  KanakkasModePickerComponents.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 23/03/2025.
//

import SwiftUI

// MARK: Title Card
struct KanakkasModePickerTitleCard: View {
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

// MARK: - Game Selection Button
struct KanakkasModeGameButton: View {
    let game: KanakkasModeGame
    @Binding var selectedGame: KanakkasModeGame?
    let animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedGame = game
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

struct KanakkasModeGameDetailView: View {
    let kanakkasModeGame: KanakkasModeGame
    let animation: Namespace.ID
    let onClose: () -> Void
    let players: [String]
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                ZStack {
                    Text(kanakkasModeGame.title)
                        .font(Font.custom("LuckiestGuy-Regular", size: 32))
                        .foregroundColor(.white)
                        .shadow(color: .red, radius: 5)
                        .multilineTextAlignment(.center)
                        
                        .frame(width: 300, height: 50)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        .matchedGeometryEffect(id: kanakkasModeGame.title, in: animation)
                }
                
                Text(kanakkasModeGame.description)
                    .font(Font.custom("LuckiestGuy-Regular", size: 20))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    
                    .shadow(color: .red, radius: 5)
                    .shadow(color: .red, radius: 5)
                    .frame(width: 700, height: 200)
                
                NavigationLink(destination: kanakkasModeGame.getView(players: players)) {
                    GameModeActionButton(title: "Spill")
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
struct KanakkasModeGame: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
    let description: String
    let viewProvider: ([String]) -> AnyView // Accepts players and returns a view
    
    func getView(players: [String]) -> AnyView {
        return viewProvider(players)
    }
}


// MARK: Free Packs
let kanakkasModeFreeGames = [
    KanakkasModeGame(
        title: "Delvis \n kanakkas!",
        color: .red,
        description: "Lett blanding \n Gjør allikevel klar do, pose og grøft, for her skal dere kjøres hardt!",
        viewProvider: { players in AnyView(KanakkasLevelOne(players: players))
            }
    )
]


// MARK: Paid Packs
let kanakkasModePaidGames = [
    KanakkasModeGame(
        title: "Mildt sagt \n kanakkas!",
        color: .gray,
        description: "Klarer alle veiene til do og fest posene rundt halsen! \n Her skal dere bli parallelle med bakken!",
        viewProvider: { players in AnyView(KrigGameView(players: players)) }
    ),
    
    KanakkasModeGame(
        title: "Helt \n kanakkas!",
        color: .black,
        description: "Ha ambulansen klar på speed dial! \n Her skal alkolen renne som nilen! \n Den mest brutale pakken Kanakkas har å by på! 😈 \n NB! pumping kan medfølge!",
        viewProvider: { players in AnyView(BussrutaGameView(players: players)) }
    )
]

// 🛠 Preview
struct KanakkasModePickerComponents_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
           KanakkasModePickerView(players: ["Hurb", "Bruh"])
        }
         
    }
}
