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

// MARK: - Game Selection Button
struct CardBasedGameButton: View {
    let game: CardBasedGame
    @Binding var selectedGame: CardBasedGame?
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

// MARK: - Game Detail View
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
                }
                
                Text(cardBasedGame.description)
                    .font(Font.custom("LuckiestGuy-Regular", size: 20))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 700, height: 150)
                
                NavigationLink(destination: cardBasedGame.view) {
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
struct CardBasedGame: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
    let description: String
    let view: AnyView
}


// MARK: Free Packs
let cardBasedFreeGames = [
    CardBasedGame(title: "Over/under!", color: .red, description: "Tipp om neste korter er høyere eller lavere enn forrige kort! \n Gjetter hen riktig, Fortsett til neste spiller og legg til en slurk i taperpotten!\n Gjetter hen feil, må hen ta alle slurkene i potten og dere begynner på nytt!", view: AnyView(OverUnderGameView())),
    
    CardBasedGame(title: "Kongens Kopp!", color: .blue, description: "!", view: AnyView(Text("Kongens Kopp Coming Soon!"))) ,
    
    CardBasedGame(title: "Vanlig Kortstokk!", color: .pink, description: "Her finner dere på regler selv, bare fantasisen setter grenser!",view: AnyView(DeckOfCardsGameView())) ,
    
]


// MARK: Paid Packs
let cardBasedPaidGames = [
    CardBasedGame(title: "Krig!", color: .gray, description: "Hver spiller trekker et kort, den med høyeste kortet vinner runden! \n får spillerene samme verdi, blir det krig! Her dobles mengden super for hver krig! \n lykke til!", view: AnyView(KrigGameView(players: ["Player 1", "Player 2"]))),
    
    CardBasedGame(title: "Buss ruta!", color: .black, description: "Her skal alle gjennom bussruta! \n Trykk på et kort på første rad og beveg deg gradvis oppover!", view: AnyView(BussrutaGameView(players: ["Player 1", "Player 2"]))),
    
    CardBasedGame(title: "Premium      Pack 3", color: .gold, description: "!", view: AnyView(Text("pack Coming Soon!")))
]

// 🛠 Preview
struct CardBasedPickerComponents_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CardBasedPickerView(players: ["Hurb", "Bruh"])
        }
         
    }
}
