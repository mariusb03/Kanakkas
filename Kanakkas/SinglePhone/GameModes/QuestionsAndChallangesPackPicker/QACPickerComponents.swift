//
//  QACPickerComponents.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 07/03/2025.
//

import SwiftUI

// MARK: Title Card
struct QACPickerTitleCard: View {
    @State private var isTapped = false
    @State private var offsetY: CGFloat = -300
    
    var body: some View {
            ZStack {
                Text("Velg pakke!")
                    .font(Font.custom("LuckiestGuy-Regular", size: 43))
                    .foregroundColor(.red)
                    .shadow(color: .red, radius: 10)
                
                Text("Velg Pakke!")
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
struct QACPackButton: View {
    let pack: QACPack
    @Binding var selectedPack: QACPack?
    let animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedPack = pack
            }
        }) {
            ZStack {
                Text(pack.title)
                    .font(Font.custom("LuckiestGuy-Regular", size: 33))
                    .foregroundColor(.red)
                    .shadow(color: .red, radius: 5)
                    .multilineTextAlignment(.center)
                    .frame(width: 250, height: 100)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .matchedGeometryEffect(id: pack.title, in: animation)
                
                Text(pack.title)
                    .font(Font.custom("LuckiestGuy-Regular", size: 30))
                    .foregroundColor(.white)
                    .shadow(color: .red, radius: 5)
                    .multilineTextAlignment(.center)
                    .frame(width: 250, height: 100)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .matchedGeometryEffect(id: pack.title, in: animation)
            }
        }
    }
}

// MARK: - QACPackDetailView (Expanded View)
struct QACPackDetailView: View {
    let qacPack: QACPack
    let animation: Namespace.ID
    let onClose: () -> Void
    let players: [String]
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                ZStack {
                    Text(qacPack.title)
                        .font(Font.custom("LuckiestGuy-Regular", size: 32))
                        .foregroundColor(.white)
                        .shadow(color: .red, radius: 5)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 300, height: 100)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        .matchedGeometryEffect(id: qacPack.title, in: animation)
                    
                    Text(qacPack.title)
                        .font(Font.custom("LuckiestGuy-Regular", size: 32))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .shadow(color: .red, radius: 5)
                        .padding()
                        .frame(width: 300, height: 100)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        .matchedGeometryEffect(id: qacPack.title, in: animation)
                }
                
                Text(qacPack.description)
                    .font(Font.custom("LuckiestGuy-Regular", size: 20))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 550, height: 150)
                
                if qacPack.title == "Vorset          Starter!" {
                    NavigationLink(destination: VorsetStarterGameView(players: players)) {
                        GameModeActionButton(title: "Spill")
                    }
                }
                
                if qacPack.title == "Damenes        aften!" {
                    NavigationLink(destination: DamenesAftenGameView(players: players)) {
                        GameModeActionButton(title: "Spill")
                    }
                }
                
                if qacPack.title == "All-In gutta!" {
                    NavigationLink(destination: AllInGuttaGameView(players: players)) {
                        GameModeActionButton(title: "Spill")
                    }
                }
                
                if qacPack.title == "Er det varmt her?" {
                    NavigationLink(destination: ErDetVarmtHerGameView(players: players)) {
                        GameModeActionButton(title: "Spill")
                    }
                }
                
                if qacPack.title == "Nach!" {
                    NavigationLink(destination: NachGameView(players: players)) {
                        GameModeActionButton(title: "Spill")
                    }
                }
                
                if qacPack.title == "100 \n Spørsmål!" {
                    NavigationLink(destination: HundreSpørsmålGameView(players: players)) {
                        GameModeActionButton(title: "Spill")
                    }
                }
                
                
                if qacPack.title == "Dag 2!" {
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
struct QACPack: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
    let description: String
}


// MARK: Free Packs
let QACFreePacks = [
    QACPack(title: "Vorset          Starter!", color: .red, description: "Er alle klare for å få promillen opp? Pakken byr på høy flaskeføring og legger grunnlaget for kveldens hendelser!"),
    
    QACPack(title: "All-In gutta!", color: .blue, description: "Gjør dere klare boys! Denne skal kjennes dagen derpå! Knekk noen kalde, start pakken og la alkoholen flyte fortløpende gjennom spørsmål og utfordringer kun gutta tolererer!"),
    
    QACPack(title: "Damenes        aften!", color: .pink, description: "På tide å sette stemningen damer! Sprett vinflaskene og la den renne gjennom pakken som byr på høy flaske- og gossip-føring!"),
    
    QACPack(title: "Er det varmt her?", color: .orange, description: "For dere som synes temperaturen er blitt for høy og mener noen klesplagg pmå rives av!\n Stripp ned, knekk noen kalde og gjør klar for å bli både kleine og Nakne!"),
    
    QACPack(title: "Nach!", color: .purple, description: "Herlighet, fortsatt ikke klare for å legge ned flaska? Jaja, ta det som en nedtrapping da! La alkoholen renne og gjør dere klare for å dele livshistorier!"),
    
    QACPack(title: "100 \n Spørsmål!", color: .yellow, description: "En klassiker! Få festen igang med 100 spørsmål!")
]


// MARK: Paid Packs
let QACPaidPacks = [
    QACPack(title: "Dag 2", color: .gray, description: "For dere som ikke syntes 1 dag var nok, så begynner dag 2 her! Start rolig og kjør opp mer enn i går!"),
    QACPack(title: "Premium      Pack 2", color: .black, description: "Mest ekstreme utfordringer!"),
    QACPack(title: "Premium      Pack 3", color: .gold, description: "VIP-pakken for hardcore festere!")
]

// 🛠 Preview
struct QACPickerComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            QACPickerView(players: ["Hurb", "Bruh"])
        }
         
    }
}
