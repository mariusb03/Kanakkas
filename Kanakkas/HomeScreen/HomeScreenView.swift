//
//  HomeScreenView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//


import SwiftUI

struct HomeScreenView: View {
    @State private var offsetY: CGFloat = 200
    
    @State private var showSettings = false
    
    var body: some View {
        NavigationStack { // 📌 Enables navigation between screens
            ZStack {
                HomeBackground()
                
                VStack(spacing: 20) {
                    HStack {
                        Spacer()
                        CustomSettingsButton {
                            showSettings.toggle()
                        }
                    }
                    
                    HomeTitleCard()
                    
                    UnderTitleCard()
                    
                    HStack(spacing: 20) {
                        // 🔀 Updated Button to Navigate
                        NavigationLink(destination: PlayerSetupView()) {
                            SinglePhoneButton()
                        }
                        
                        NavigationLink(destination: MultiplayerSelectionView()) {
                            MultiplayerButton()
                        }
                    }
                }
            }
            .overlay(
                TableEdge()
            )
            .sheet(isPresented: $showSettings) {
                        SettingsView() // Open settings menu
                    }
        }
        .navigationBarBackButtonHidden(true)
    }
}

// 🛠 Preview
struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
