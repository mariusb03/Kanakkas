//
//  HostOrJoinComponents.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 16/03/2025.
//

import SwiftUI

struct HostOrJoinTitleCard: View {
    var body: some View {
        ZStack {
            Text("Kanakkas")
                .font(Font.custom("LuckiestGuy-Regular", size: 62))
                .foregroundColor(.red)
                .shadow(color: .red, radius: 5)
            
            Text("Kanakkas")
                .font(Font.custom("LuckiestGuy-Regular", size: 60))
                .foregroundColor(.white)
                .shadow(color: .red, radius: 5)
        }
    }
}

struct PlayerRowView: View {
    var name: String
    var isHost: Bool
    
    var body: some View {
        HStack {
            Text(name)
                .font(Font.custom("LuckiestGuy-Regular", size: 20))
                .foregroundColor(.white)
                .bold()
                .padding()
                .frame(maxWidth: .infinity)
                .background(isHost ? Color.red.opacity(0.7) : Color.black.opacity(0.5))
                .cornerRadius(10)
        }
    }
}

struct CustomGameButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Font.custom("LuckiestGuy-Regular", size: 20))
                .foregroundColor(.white)
                .shadow(radius: 5)
                .padding()
                .frame(width: 200, height: 60)
                .background(Color.red)
                .cornerRadius(30)
                .shadow(color: .red, radius: 5)
                
        }
    }
}

struct PlayerLobbyView: View {
    @ObservedObject var multipeerManager: MultipeerManager
    
    var body: some View {
        VStack {
            Text("Players in Game")
                .font(.title2)
                .padding(.top)
            
            List {
                // ✅ Ensure the host is displayed from received data
                if !multipeerManager.hostNickname.isEmpty {
                    Text("\(multipeerManager.hostNickname) (Host)")
                        .fontWeight(.bold)
                }
                
                // ✅ Show all players with correct nicknames
                ForEach(multipeerManager.playerNicknames.sorted(by: { $0.key.displayName < $1.key.displayName }), id: \.key) { _, nickname in
                    Text(nickname)
                }
            }
        }
    }
}


struct GameLobbyView: View {
    @ObservedObject var multipeerManager: MultipeerManager
    @Environment(\.presentationMode) var presentationMode // Used for dismissing view
    @State private var showSettings = false // ✅ Controls settings modal visibility
    
    // 🔹 Define a two-column grid layout
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        ZStack {
            HomeBackground()
            
            VStack {
                HStack {
                    CustomBackButton()
                    
                    Spacer()
                    
                    GameLobbyTitleCard()
                    
                    Spacer()
                    
                    MultiPhoneInfoButton {
                        print("")
                    }
                }
                .padding(.top, 30)
                
                Spacer()
                
                HStack {
                    VStack {
                        Text("Spillere:")
                            .font(Font.custom("LuckiestGuy-Regular", size: 30))
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .shadow(color: .red, radius: 5)
                            .padding()
                        
                        ScrollView {
                            LazyVGrid(columns: columns) {
                                
                                // ✅ Show the host first
                                if !multipeerManager.hostNickname.isEmpty {
                                    PlayerCardView(name: "\(multipeerManager.hostNickname) (Host)")
                                }
                                
                                // ✅ Show all players in a grid
                                ForEach(multipeerManager.playerNicknames.sorted(by: { $0.key.displayName < $1.key.displayName }), id: \.key) { _, nickname in
                                    PlayerCardView(name: nickname)
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        .frame(width: 400, height: 200)
                        
                        Spacer()
                    }
                    
                    
                    
                    VStack {
                        // 🔹 Show "Start Game" button only for the host
                        if multipeerManager.isHost {
                            Button("Start Game") {
                                print("Game Started!") // Add game start logic here
                            }
                            .padding()
                            .frame(width: 250, height: 80)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .font(Font.custom("LuckiestGuy-Regular", size: 30))
                            .shadow(color: .green, radius: 5)
                        }
                        
                        // 🔹 Settings Button (Opens Settings Modal)
                        Button(action: {
                            showSettings.toggle()
                        }) {
                            HStack {
                                Image(systemName: "gearshape.fill")
                                    .font(.system(size: 24))
                                Text("Settings")
                                    .font(Font.custom("LuckiestGuy-Regular", size: 24))
                            }
                            .padding()
                            .frame(width: 200, height: 60)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(color: .blue, radius: 5)
                        }
                    }
                }
                
                Spacer()
            }
            if showSettings {
                SettingsView {
                    showSettings = false
                }
                .transition(.opacity)
                
            }
        }
        .overlay(
            TableEdge()
        )
        .navigationBarBackButtonHidden(true)
        
        // ✅ If the host leaves, exit the lobby
        .onChange(of: multipeerManager.isConnected) { isConnected in
            if !isConnected {
                presentationMode.wrappedValue.dismiss() // ✅ Return to main screen
            }
        }
        
    }
}

struct PlayerCardView: View {
    var name: String
    
    var body: some View {
        Text(name)
            .font(Font.custom("LuckiestGuy-Regular", size: 20))
            .foregroundColor(.white)
            .padding()
            .frame(width: 180, height: 60) // ✅ Adjusted for grid layout
            .background(Color.red)
            .cornerRadius(20)
            .shadow(color: .red, radius: 5)
    }
}

struct JoinLobbyTitleCard: View {
    var body: some View {
        ZStack {
            Text("Finn en lobby!")
                .font(Font.custom("LuckiestGuy-Regular", size: 62))
                .foregroundColor(.red)
                .shadow(color: .red, radius: 5)
            
            Text("Finn en lobby!")
                .font(Font.custom("LuckiestGuy-Regular", size: 60))
                .foregroundColor(.white)
                .shadow(color: .red, radius: 5)
        }
    }
}

struct GameLobbyTitleCard: View {
    var body: some View {
        ZStack {
            Text("Lobby!")
                .font(Font.custom("LuckiestGuy-Regular", size: 52))
                .foregroundColor(.red)
                .shadow(color: .red, radius: 5)
            
            Text("Lobby!")
                .font(Font.custom("LuckiestGuy-Regular", size: 50))
                .foregroundColor(.white)
                .shadow(color: .red, radius: 5)
        }
    }
}

struct HostOrJoinComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HostOrJoinView()
        }
    }
}

