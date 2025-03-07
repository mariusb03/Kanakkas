//
//  PlayerSetupComponents.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//

import SwiftUI

// MARK: Title Card
struct PlayerSetupTitleCard: View {
    @State private var isTapped = false
    @State private var offsetY: CGFloat = -300
    
    var body: some View {
            ZStack {
                Text("Kanakkas!")
                    .font(Font.custom("LuckiestGuy-Regular", size: 75))
                    .foregroundColor(.red)
                    .shadow(color: .red, radius: 10)
                
                Text("Kanakkas!")
                    .font(Font.custom("LuckiestGuy-Regular", size: 70))
                    .foregroundColor(.white)
                    .shadow(color: .red, radius: 10)
            }
            .offset(y: offsetY) // Slide-in animation
                    .animation(.easeOut(duration: 1.0), value: offsetY)
                    .onAppear {
                        offsetY = 0 // Moves down into position
                    }
                    .scaleEffect(isTapped ? 1.2 : 1.0) // Bounce effect
                    .onTapGesture {
                        isTapped.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            isTapped = false
                        }
                    }
            .padding(.top)
    }
}


struct PlayerNameList: View {
    @State private var players: [String] = ["Spiller 1", "Spiller 2"] // Default players
    @State private var newPlayerName: String = ""
    
    private let columns = [
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20)
        ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(players.indices, id: \.self) { index in
                    TextField("", text: $players[index])
                        .textFieldStyle(RoundedTextFieldStyle())
                        .frame(width: 170, height: 40)
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(radius: 3)
                }
            }
            .padding(.horizontal, 40)
        }
        .frame(height: 180) // Keep it compact
    }
}


struct AddPlayerButton: View {
    @State private var players: [String] = ["Spiller 1", "Spiller 2"]
    
    @State private var newPlayerName: String = ""
    
    private let columns = [
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20)
        ]
    
    var body: some View {
        Button(action: {
            if players.count < 10 {
                players.append("Spiller \(players.count + 1)")
            }
        }) {
            Image(systemName: "plus")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.8))
                .clipShape(Circle())
                .shadow(radius: 5)
        }
        .padding(.top, 10)
    }
}


struct StartButton: View {
    @State private var offsetX: CGFloat = 400
    
    var body: some View {
        ZStack {
            Text("START")
                .font(Font.custom("LuckiestGuy-Regular", size: 33))
                .foregroundColor(.red)
                .padding()
                .frame(width: 125, height: 50)
                .shadow(radius: 5)
                .shadow(color: .red, radius: 5)
            
            
                .offset(x: offsetX) // Slide-in effect
                .onAppear {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                        offsetX = 0 // Moves down into position smoothly
                    }
                }
            
            Text("START")
                .font(Font.custom("LuckiestGuy-Regular", size: 30))
                .foregroundColor(.white)
                .padding()
                .frame(width: 120, height: 50)
                .shadow(radius: 5)
                .shadow(color: .red, radius: 5)
                .shadow(color: .red, radius: 5)
            
            
                .offset(x: offsetX) // Slide-in effect
                .onAppear {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                        offsetX = 0 // Moves down into position smoothly
                    }
                }
        }
    }
}

// 🛠 Preview
struct PlayerSetupComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlayerSetupView()
        }
        
    }
}
