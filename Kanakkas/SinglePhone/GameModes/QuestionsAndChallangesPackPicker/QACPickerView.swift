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

    // Track expanded state for sections
    @State private var showQACFreeGames = true
    @State private var showQACPaidGames = true

    var body: some View {
        ZStack {
            HomeBackground()
            
            if let selectedPack = selectedPack {
                QACPackDetailView(qacPack: selectedPack, animation: animation, onClose: {
                    withAnimation(.spring()) {
                        self.selectedPack = nil
                    }
                }, players: players)
            } else {
                ScrollView {
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

                        // **Free Game Packs Section**
                        DisclosureGroup(
                            isExpanded: $showQACFreeGames,
                            content: {
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                                    ForEach(QACFreePacks, id: \.id) { pack in
                                        QACPackButton(pack: pack, selectedPack: $selectedPack, animation: animation)
                                    }
                                }
                            },
                            label: {
                                HStack {
                                    Spacer()
                                    ZStack {
                                        Text("Gratis Pakker")
                                            .font(Font.custom("LuckiestGuy-Regular", size: 30))
                                            .foregroundColor(.red)
                                            .shadow(color: .red, radius: 5)
                                        
                                        Text("Gratis Pakker")
                                            .font(Font.custom("LuckiestGuy-Regular", size: 28))
                                            .foregroundColor(.white)
                                    }
                                    Spacer()
                                }
                                .padding(.horizontal)
                            }
                        )
                        .padding(.horizontal)

                        // **Paid Game Packs Section**
                        DisclosureGroup(
                            isExpanded: $showQACPaidGames,
                            content: {
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                    ForEach(QACPaidPacks, id: \.id) { pack in
                                        QACPackButton(pack: pack, selectedPack: $selectedPack, animation: animation)
                                    }
                                }
                            },
                            label: {
                                HStack {
                                    Spacer()
                                    ZStack {
                                        Text("Betalte Pakker")
                                            .font(Font.custom("LuckiestGuy-Regular", size: 30))
                                            .foregroundColor(.red)
                                            .shadow(color: .red, radius: 5)
                                        
                                        Text("Betalte Pakker")
                                            .font(Font.custom("LuckiestGuy-Regular", size: 28))
                                            .foregroundColor(.yellow)
                                       
                                    }
                                    Spacer()
                                }
                                .padding(.horizontal)
                            }
                        )
                        .padding(.horizontal)
                    }
                }
            }
            if showSettings {
                SettingsView {
                    showSettings = false
                }
                .transition(.opacity)
                
            }
        }
        .overlay(TableEdge())
        
        .navigationBarBackButtonHidden(true)
    }
}
    






// MARK: - Preview
struct QACPickerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            QACPickerView(players: ["Spiller 1", "Spiller 2"])
        }
    }
}
