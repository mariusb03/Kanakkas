//
//  MultiplayerSelectionView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//


import SwiftUI

struct MultiplayerSelectionView: View {
    @State private var showSettings = false
    
    var body: some View {
        ZStack {
            HomeBackground()

            VStack {
                HStack {
                    CustomBackButton()
                    
                    Spacer()
                    
                    MultiplayerSelectionTitleCard()
                    
                    Spacer()
                    
                    CustomSettingsButton {
                        showSettings.toggle()
                    }
                }
                
                // 🏠 Host a Lobby
                NavigationLink(destination: HostLobbyView()) {
                    SelectionButton(title: "Opprett Lobby")
                }
                .navigationBarBackButtonHidden(true)
                
                // 🔗 Join a Lobby
                NavigationLink(destination: JoinLobbyView()) {
                    SelectionButton(title: "Bli med i Lobby")
                }
                .navigationBarBackButtonHidden(true)
                
                Spacer()
            }
            .padding(.top, 50)
        }
        .overlay(
            TableEdge()
        )
        .sheet(isPresented: $showSettings) {
                    SettingsView() // Open settings menu
                }
        .navigationBarBackButtonHidden(true)
    }
    
}

// 🛠 Preview
struct MultiplayerSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplayerSelectionView()
    }
}
