//
//  Untitled.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 11/03/2025.
//

import SwiftUI

struct CardBasedPickerView: View {
    let players: [String]
    @State private var showSettings = false
    @State private var selectedGame: CardBasedGame? = nil
    @Namespace private var animation

    // Track expanded state for sections
    @State private var showCardBasedFreeGames = true
    @State private var showCardBasedPaidGames = true

    var body: some View {
        ZStack {
            HomeBackground()
            
            if let selectedGame = selectedGame {
                CardBasedGameDetailView(cardBasedGame: selectedGame, animation: animation, onClose: {
                    withAnimation(.spring()) {
                        self.selectedGame = nil
                    }
                }, players: players)
            } else {
                ScrollView {
                    VStack {
                        HStack {
                            CustomBackButton()
                            Spacer()
                            CardBasedPickerTitleCard()
                            Spacer()
                            CustomSettingsButton {
                                showSettings.toggle()
                            }
                        }
                        .padding(.top, 20)

                        // **Free Game Packs Section**
                        DisclosureGroup(
                            isExpanded: $showCardBasedFreeGames,
                            content: {
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                                    ForEach(cardBasedFreeGames, id: \.id) { game in
                                        CardBasedGameButton(game: game, selectedPack: $selectedGame, animation: animation)
                                    }
                                }
                            },
                            label: {
                                HStack {
                                    Spacer()
                                    ZStack {
                                        Text("Gratis spill")
                                            .font(Font.custom("LuckiestGuy-Regular", size: 30))
                                            .foregroundColor(.red)
                                            .shadow(color: .red, radius: 5)
                                        
                                        Text("Gratis spill")
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
                            isExpanded: $showCardBasedPaidGames,
                            content: {
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                    ForEach(cardBasedPaidGames, id: \.id) { game in
                                        CardBasedGameButton(game: game, selectedPack: $selectedGame, animation: animation)
                                    }
                                }
                            },
                            label: {
                                HStack {
                                    Spacer()
                                    ZStack {
                                        Text("Betalte spill")
                                            .font(Font.custom("LuckiestGuy-Regular", size: 30))
                                            .foregroundColor(.red)
                                            .shadow(color: .red, radius: 5)
                                        
                                        Text("Betalte spill")
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
        }
        .overlay(TableEdge())
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Preview
struct CardBasedPickerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CardBasedPickerView(players: ["Spiller 1", "Spiller 2"])
        }
    }
}
