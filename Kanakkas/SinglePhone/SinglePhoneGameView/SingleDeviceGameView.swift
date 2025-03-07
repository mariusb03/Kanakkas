//
//  SingleDeviceGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//


import SwiftUI

struct SingleDeviceGameView: View {
    let players: [String]
    @State private var showSettings = false
    @State private var selectedMode: GameMode? = nil
    @Namespace private var animation

    var body: some View {
        ZStack {
            // Background
            HomeBackground()
            
            if let selectedMode = selectedMode {
                // Expanded View for Selected Mode
                GameModeDetailView(gameMode: selectedMode, animation: animation, players: players) {
                    withAnimation(.spring()) {
                        self.selectedMode = nil
                    }
                }
            } else {
                VStack {
                    HStack {
                        CustomBackButton()
                        
                        Spacer()
                        
                        SingleDeviceTitleCard()
                        
                        Spacer()
                        
                        CustomSettingsButton {
                            showSettings.toggle()
                        }
                    }
                    .padding(.top, 20)
                    
                    // 📜 Game Mode Selection
                    VStack {
                        HStack {
                            Spacer()
                            GameModeButton(title: "Spørsmål og Utfordringer!", color: .red, description: "Diverse utvalg pakker med spørsmål og utfordringer for alle vors vibber!", selectedMode: $selectedMode, animation: animation)
                            Spacer()
                            GameModeButton(title: "Kanakkas      Modus!", color: .blue, description: "Gjøre deg klar for et skikkelig Rølpe-vors!", selectedMode: $selectedMode, animation: animation)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            GameModeButton(title: "Kortstokk Basert!", color: .green, description: "Diverse utvalg kortspill for de som mangler kortstokk!                                          (Evig kortstokk for alle spill)", selectedMode: $selectedMode, animation: animation)
                            Spacer()
                            GameModeButton(title: "Ferdighets Basert!", color: .orange, description: "Test ferdighetene dine i ulike utfordringer!", selectedMode: $selectedMode, animation: animation)
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

// MARK: - GameModeButton (Triggers Expansion)
struct GameModeButton: View {
    @State private var offsetX: CGFloat = 300
    let title: String
    let color: Color
    let description: String
    @Binding var selectedMode: GameMode?
    let animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedMode = GameMode(title: title, description: description, color: color)
            }
        }) {
            ZStack {
                Text(title)
                    .font(Font.custom("LuckiestGuy-Regular", size: 32))
                    .foregroundColor(.red)
                    .padding()
                    .frame(width: 300, height: 100)
                    .shadow(color: .red, radius: 5)
                
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .matchedGeometryEffect(id: title, in: animation)
                
                Text(title)
                    .font(Font.custom("LuckiestGuy-Regular", size: 30))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 100)
                    .shadow(color: .red, radius: 5)
                
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .matchedGeometryEffect(id: title, in: animation)
            }
            .offset(y: offsetX) // Slide-in effect
            .onAppear {
                withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                    offsetX = 0 // Moves down into position smoothly
                }
            }
        }
    }
}

// MARK: - GameModeDetailView (Expanded View)
struct GameModeDetailView: View {
    @State private var offsetY: CGFloat = 300
    let gameMode: GameMode
    let animation: Namespace.ID
    let players: [String]
    let onClose: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                Text(gameMode.title)
                    .font(Font.custom("LuckiestGuy-Regular", size: 32))
                    .foregroundColor(.red)
                    .padding()
                    .multilineTextAlignment(.center)
                    .frame(width: 300, height: 100)
                    .shadow(color: .red, radius: 5)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .matchedGeometryEffect(id: gameMode.title, in: animation)
                
                Text(gameMode.title)
                    .font(Font.custom("LuckiestGuy-Regular", size: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 300, height: 100)
                    .shadow(color: .red, radius: 5)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .matchedGeometryEffect(id: gameMode.title, in: animation)
            }
            
            Text(gameMode.description)
                .font(Font.custom("LuckiestGuy-Regular", size: 15))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
                .offset(y: offsetY)
                .onAppear {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                        offsetY = 0
                    }
                }
            
            // 🎮 Dynamic Button (Se Utvalg, Spill, or Navigate to QACPickerView)
            if gameMode.title == "Spørsmål og Utfordringer!" {
                NavigationLink(destination: QACPickerView(players: players)) {
                    GameModeActionButton(title: "Se utvalg")
                }
            } else {
                Button(action: {
                    if gameMode.title == "Ferdighets Basert!" {
                        print("Starting game mode: \(gameMode.title)")
                    } else {
                        print("Opening selection for: \(gameMode.title)")
                    }
                }) {
                    GameModeActionButton(title: gameMode.title == "Ferdighets Basert!" ? "Spill" : "Se Utvalg")
                }
                
            }
            
            
            // 🔙 Back Button
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

// MARK: - Reusable GameModeActionButton
struct GameModeActionButton: View {
    @State private var offsetY: CGFloat = 300
    
    let title: String
    
    var body: some View {
        ZStack {
            Text(title)
                .font(Font.custom("LuckiestGuy-Regular", size: 32))
                .foregroundColor(.red)
                .padding()
                .frame(width: 180, height: 50)
                .cornerRadius(20)
                .shadow(radius: 5)
                .shadow(color: .red, radius: 5)
                .offset(y: offsetY) // Slide-in effect
                .onAppear {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                        offsetY = 0
                    }
                }
            
            Text(title)
                .font(Font.custom("LuckiestGuy-Regular", size: 30))
                .foregroundColor(.white)
                .padding()
                .frame(width: 180, height: 50)
                .cornerRadius(20)
                .shadow(radius: 5)
                .shadow(color: .red, radius: 5)
                .offset(y: offsetY) // Slide-in effect
                .onAppear {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                        offsetY = 0
                    }
                }
        }
    }
}

// MARK: - GameMode Model
struct GameMode: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let color: Color
}

// MARK: - Preview
struct SingleDeviceGameView_Previews: PreviewProvider {
    static var previews: some View {
        SingleDeviceGameView(players: ["Spiller 1", "Spiller 2"])
    }
}
