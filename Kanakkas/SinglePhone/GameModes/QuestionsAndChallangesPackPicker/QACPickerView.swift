//
//  QACPickerView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 07/03/2025.
//

import SwiftUI

struct QACPickerView: View {
    let players: [String]
    @State private var showSettings = false
    @State private var selectedPack: QACPack? = nil
    @Namespace private var animation

    let packs = [
        QACPack(title: "Vorset        Starter!", color: .red, description: "Den perfekte starten på vorset!"),
        QACPack(title: "All-In gutta!", color: .blue, description: "For gutta som liker å kjøre på!"),
        QACPack(title: "Damenes         aften!", color: .pink, description: "Jentene setter stemningen!"),
        QACPack(title: "Er det varmt her?", color: .orange, description: "Spill for de som liker det varmt!"),
        QACPack(title: "Nach!", color: .purple, description: "For de som aldri gir seg!"),
        QACPack(title: "Dag 2!", color: .yellow, description: "Vorset fortsetter! Starter rolig men blir mer og mer intenst")
    ]

    var body: some View {
        ZStack {
            // Background
            HomeBackground()
            
            if let selectedPack = selectedPack {
                // Expanded View for Selected Pack
                QACPackDetailView(qacPack: selectedPack, animation: animation, onClose:  {
                    withAnimation(.spring()) {
                        self.selectedPack = nil
                    }
                }, players: players)
            } else {
                VStack {
                    HStack {
                        CustomBackButton()
                        
                        Spacer()
                        
                        QACPickerTitleCard()
                        
                        Spacer()
                        
                        CustomSettingsButton {
                            showSettings.toggle()
                        }
                    }
                    .padding(.top, 20)
                    
                    // 📜 Pack Selection (2x3 Grid)
                    VStack {
                        HStack {
                            Spacer()
                            QACPackButton(pack: packs[0], selectedPack: $selectedPack, animation: animation)
                            Spacer()
                            QACPackButton(pack: packs[1], selectedPack: $selectedPack, animation: animation)
                            Spacer()
                            QACPackButton(pack: packs[2], selectedPack: $selectedPack, animation: animation)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            QACPackButton(pack: packs[3], selectedPack: $selectedPack, animation: animation)
                            Spacer()
                            QACPackButton(pack: packs[4], selectedPack: $selectedPack, animation: animation)
                            Spacer()
                            QACPackButton(pack: packs[5], selectedPack: $selectedPack, animation: animation)
                            Spacer()
                        }
                    }
                }
            }
        }
        .overlay(TableEdge()) // Keeps the table aesthetic
        .sheet(isPresented: $showSettings) {
            SettingsView() // Open settings menu
        }
        .navigationBarBackButtonHidden(true)
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
                    .font(Font.custom("LuckiestGuy-Regular", size: 25))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 350, height: 150)
                
                if qacPack.title == "Vorset        Starter!" {
                    NavigationLink(destination: VorsetStarterGameView(players: players)) {
                        GameModeActionButton(title: "Spill")
                    }
                } else {
                    // Navigate to QACGameView
                    Button(action: {
                        print("Start game with: \(qacPack.title)")
                    }) {
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

// MARK: - Preview
struct QACPickerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            QACPickerView(players: ["Spiller 1", "Spiller 2"])
        }
    }
}
