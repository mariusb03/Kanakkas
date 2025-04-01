//
//  KanakkasModePickerView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 23/03/2025.
//

import SwiftUI

struct KanakkasModePickerView: View {
    let players: [String]
    @State private var showSettings = false
    @State private var selectedGame: KanakkasModeGame? = nil
    @Namespace private var animation

    // Track expanded state for sections
    @State private var showKanakkasModeFreeGames = true
    @State private var showKanakkasModePaidGames = true

    var body: some View {
        ZStack {
            HomeBackground()
            
            if let selectedGame = selectedGame {
                KanakkasModeGameDetailView(kanakkasModeGame: selectedGame, animation: animation, onClose: {
                    withAnimation(.spring()) {
                        self.selectedGame = nil
                    }
                }, players: players)
            } else {
                
                    VStack {
                        HStack {
                            CustomBackButton()
                            Spacer()
                            KanakkasModePickerTitleCard()
                            Spacer()
                            CustomSettingsButton {
                                showSettings.toggle()
                            }
                        }
                        .padding(.top, 20)
                        
                        Spacer()
                        
                        HStack {
                            ForEach(kanakkasModeFreeGames, id: \.id) { game in
                                KanakkasModeGameButton(game: game, selectedGame: $selectedGame, animation: animation)
                            }
                            
                            ForEach(kanakkasModePaidGames, id: \.id) { game in
                                KanakkasModeGameButton(game: game, selectedGame: $selectedGame, animation: animation)
                            }
                        }
                        
                        Spacer()
                        
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
struct KanakkasModePickerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            KanakkasModePickerView(players: ["Spiller 1", "Spiller 2"])
        }
    }
}
