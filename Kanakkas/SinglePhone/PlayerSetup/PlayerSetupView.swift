//
//  PlayerSetupView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//


import SwiftUI

struct PlayerSetupView: View {
    @State private var players: [String] = ["", ""]
    
    @State private var newPlayerName: String = ""
    
    @State private var showSettings = false
    
    @State private var offsetY: CGFloat = 300
    
    private let columns = [
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
                    PlayerSetupTitleCard()
                    Spacer()
                    CustomSettingsButton {
                        showSettings.toggle()
                    }
                }
                
                // 📋 Player Name Fields in Landscape Mode
                HStack {
                    VStack {
                        ScrollView(showsIndicators: false) {
                            LazyVGrid(columns: columns, spacing: 5) {
                                ForEach(players.indices, id: \.self) { index in
                                    TextField("Spiller \(index + 1)", text: $players[index])
                                        .textFieldStyle(RoundedTextFieldStyle())
                                        .frame(width: 170, height: 40)
                                        .background(Color.red)
                                        .cornerRadius(30)
                                        .shadow(radius: 3)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.horizontal, 40)
                        }
                        .frame(height: 180)
                        .offset(y: offsetY)
                        .onAppear {
                            withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                                offsetY = 0
                            }
                        }
                        
                        // ➕ Add Player Button
                        Button(action: {
                            if players.count < 10 {
                                players.append("")
                            }
                        }) {
                            Image(systemName: "plus")
                                .font(.headline)
                                .fontWeight(.black)
                                .foregroundColor(.white)
                                .padding()
                                .background(.red)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                                .shadow(color: .red, radius: 5)
                                .shadow(color: .red, radius: 5)
                        }
                        .padding(.top, 10)
                        .offset(y: offsetY)
                        .onAppear {
                            withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                                offsetY = 0
                            }
                        }
                    }
                    
                    // 🎮 Start Button
                    NavigationLink(destination: SingleDeviceGameView(players: players)) {
                        StartButton()
                    }
                    .navigationBarBackButtonHidden(true)
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
        
        .onTapGesture {
            UIApplication.shared.hideKeyboard()
        }
    }
}


extension UIApplication {
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// 🎨 Custom Text Field Style
struct RoundedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(Color.red)
            .font(Font.custom("LuckiestGuy-Regular", size: 20))
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            .cornerRadius(25)
            .shadow(radius: 3)
    }
}

// 🛠 Preview
struct PlayerSetupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlayerSetupView()
        }
         
    }
}
