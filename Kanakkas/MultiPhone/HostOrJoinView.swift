//
//  HostOrJoinView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 16/03/2025.
//

import SwiftUI
import MultipeerConnectivity

struct HostOrJoinView: View {
    @ObservedObject var multipeerManager = MultipeerManager()
    @State private var nickname: String = ""
    @State private var showNicknameAlert = false
    @State private var showJoinLobby = false
    @State private var navigateToLobby = false
    
    var body: some View {
        ZStack {
            HomeBackground()
            
            VStack {
                HStack {
                    CustomBackButton()
                    
                    Spacer()
                    
                    HostOrJoinTitleCard()
                    
                    Spacer()
                    
                    MultiPhoneInfoButton {
                        print("")
                    }
                }
                .padding(.top, 30)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    // 🔹 Host Button
                    Button("Host!") {
                        showNicknameAlert = true
                    }
                    .font(Font.custom("LuckiestGuy-Regular", size: 50))
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .padding()
                    .frame(width: 250, height: 100)
                    .background(Color.red)
                    .cornerRadius(30)
                    .shadow(color: .red, radius: 5)
                    .shadow(color: .red, radius: 5)
                    
                    Spacer()
                    
                    // 🔹 Join Button - Now opens JoinLobbyView
                    Button("Bli med!") {
                        multipeerManager.startBrowsing()
                        showJoinLobby = true
                    }
                    .font(Font.custom("LuckiestGuy-Regular", size: 50))
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .padding()
                    .frame(width: 250, height: 100)
                    .background(Color.red)
                    .cornerRadius(30)
                    .shadow(color: .red, radius: 5)
                    .shadow(color: .red, radius: 5)
                    
                    Spacer()
                }
                
                Spacer()
                
                // ✅ Navigation to JoinLobbyView to select a game
                NavigationLink(destination: JoinLobbyView(multipeerManager: multipeerManager),
                               isActive: $showJoinLobby) { EmptyView() }
                
                // ✅ Navigation to GameLobbyView (Both Host & Players)
                NavigationLink(destination: GameLobbyView(multipeerManager: multipeerManager),
                               isActive: $navigateToLobby) { EmptyView() }
            }
            .alert("Enter a nickname", isPresented: $showNicknameAlert) {
                TextField("Nickname", text: $nickname)
                Button("Cancel", role: .cancel) { }
                Button("Start") {
                    if !nickname.isEmpty {
                        multipeerManager.startHosting(nickname: nickname)
                        navigateToLobby = true // ✅ Move host to lobby
                    }
                }
            }
            .onChange(of: multipeerManager.isConnected) { newValue in
                if newValue && !multipeerManager.playerNicknames.isEmpty {
                    navigateToLobby = true // ✅ Ensure the player list is populated before navigating
                }
            }
        }
        .overlay (
            TableEdge()
        )
        .navigationBarBackButtonHidden(true)
    }
}

struct JoinLobbyView: View {
    @ObservedObject var multipeerManager: MultipeerManager
    @State private var selectedHost: MCPeerID? = nil
    @State private var nickname: String = ""
    @State private var showNicknamePopup = false
    @State private var navigateToGameLobby = false
    
    var body: some View {
        ZStack {
            HomeBackground() // ✅ Background
            
            VStack {
                HStack {
                    CustomBackButton() 
                    
                    Spacer()
                    
                    JoinLobbyTitleCard()
                    
                    Spacer()
                    
                    MultiPhoneInfoButton {
                        print("")
                    }
                }
                .padding(.top, 30)
                
                Spacer()
                
                VStack {
                    Text("Velg et spill å bli med i!")
                        .font(Font.custom("LuckiestGuy-Regular", size: 30))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .shadow(color: .red, radius: 5)
                        .padding()
                    
                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(multipeerManager.availableHosts, id: \.self) { peer in
                                let hostName = multipeerManager.hostNicknames[peer] ?? peer.displayName
                                
                                Button(action: {
                                    selectedHost = peer
                                    showNicknamePopup = true
                                }) {
                                    Text("\(hostName) sin lobby!")
                                        .font(Font.custom("LuckiestGuy-Regular", size: 30))
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 400, height: 60)
                                        .background(Color.red)
                                        .cornerRadius(20)
                                        .shadow(color: .red, radius: 5)
                                }
                            }
                        }
                    }
                    .frame(height: 200)
                }
                
                Spacer()
            }
            
            // ✅ Nickname Alert
            .alert("Skriv inn et kallenavn", isPresented: $showNicknamePopup) {
                TextField("Kallenavn", text: $nickname)
                Button("Avbryt", role: .cancel) { }
                Button("Bli med") {
                    if let peer = selectedHost, !nickname.isEmpty {
                        multipeerManager.joinGame(nickname: nickname, host: peer)
                        navigateToGameLobby = true
                    }
                }
            }
            
            // ✅ Navigation to GameLobbyView
            .background(
                NavigationLink(destination: GameLobbyView(multipeerManager: multipeerManager),
                               isActive: $navigateToGameLobby) { EmptyView() }
            )
        }
        .overlay(
            TableEdge()
        )
        .navigationBarBackButtonHidden(true)
    }
}




// 🛠 Preview
struct HostOrJoinView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HostOrJoinView()
        }
    }
}
