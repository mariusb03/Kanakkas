//
//  SingleDeviceGameComponents.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//

import SwiftUI

// MARK: Title Card
struct SingleDeviceTitleCard: View {
    @State private var isTapped = false
    @State private var offsetY: CGFloat = -300
    
    var body: some View {
        ZStack {
            Text("Velg Modus!")
                .font(Font.custom("LuckiestGuy-Regular", size: 43))
                .foregroundColor(.red)
                .shadow(color: .red, radius: 10)
            
            Text("Velg Modus!")
                .font(Font.custom("LuckiestGuy-Regular", size: 40))
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
        .navigationBarBackButtonHidden(true)
    }
}

struct QuestionsAndChallangesButton: View {
    @State private var offsetX: CGFloat = 400
    
    var body: some View {
        ZStack {
            Text("Spørsmål og utfordringer!")
                .font(Font.custom("LuckiestGuy-Regular", size: 32))
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: 300, height: 100)
                .shadow(radius: 5)
                .shadow(color: .red, radius: 5)
            
            
                .offset(y: offsetX) // Slide-in effect
                .onAppear {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                        offsetX = 0 // Moves down into position smoothly
                    }
                }
            
            Text("Spørsmål og utfordringer!")
                .font(Font.custom("LuckiestGuy-Regular", size: 30))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: 300, height: 100)
                .shadow(radius: 5)
                .shadow(color: .red, radius: 5)
            
            
                .offset(y: offsetX) // Slide-in effect
                .onAppear {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                        offsetX = 0 // Moves down into position smoothly
                    }
                }
        }
    }
}

struct CardBasedGamesButton: View {
    @State private var offsetY: CGFloat = 400
    
    var body: some View {
        ZStack {
            Text("Kortstokk basert!")
                .font(Font.custom("LuckiestGuy-Regular", size: 32))
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: 300, height: 100)
                .shadow(radius: 5)
                .shadow(color: .red, radius: 5)
            
            
                .offset(y: offsetY) // Slide-in effect
                .onAppear {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                        offsetY = 0 // Moves down into position smoothly
                    }
                }
            
            Text("Kortstokk basert!")
                .font(Font.custom("LuckiestGuy-Regular", size: 30))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: 280, height: 100)
                .shadow(radius: 5)
                .shadow(color: .red, radius: 5)
            
            
                .offset(y: offsetY) // Slide-in effect
                .onAppear {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                        offsetY = 0 // Moves down into position smoothly
                    }
                }
        }
    }
}

struct KanakkasModeGamesButton: View {
    @State private var offsetY: CGFloat = 400
    
    var body: some View {
        ZStack {
            Text("Helt Kanakkas!")
                .font(Font.custom("LuckiestGuy-Regular", size: 32))
                .foregroundColor(.red)
                .padding()
                .multilineTextAlignment(.center)
                .frame(width: 300, height: 50)
                .shadow(radius: 5)
                .shadow(color: .red, radius: 5)
            
            
                .offset(y: offsetY) // Slide-in effect
                .onAppear {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                        offsetY = 0 // Moves down into position smoothly
                    }
                }
            
            Text("Helt Kanakkas!")
                .font(Font.custom("LuckiestGuy-Regular", size: 30))
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50)
                .shadow(radius: 5)
                .shadow(color: .red, radius: 5)
            
            
                .offset(y: offsetY) // Slide-in effect
                .onAppear {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                        offsetY = 0 // Moves down into position smoothly
                    }
                }
        }
    }
}

struct SkillBasedGamesButton: View {
    @State private var offsetX: CGFloat = 400
    
    var body: some View {
        ZStack {
            Text("Ferdighets Basert!")
                .font(Font.custom("LuckiestGuy-Regular", size: 32))
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: 300, height: 100)
                .shadow(radius: 5)
                .shadow(color: .red, radius: 5)
            
            
                .offset(y: offsetX) // Slide-in effect
                .onAppear {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                        offsetX = 0 // Moves down into position smoothly
                    }
                }
            
            Text("Ferdighets Basert!")
                .font(Font.custom("LuckiestGuy-Regular", size: 30))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: 300, height: 100)
                .shadow(radius: 5)
                .shadow(color: .red, radius: 5)
            
            
                .offset(y: offsetX) // Slide-in effect
                .onAppear {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                        offsetX = 0 // Moves down into position smoothly
                    }
                }
        }
    }
}


// 🛠 Preview
struct SingleDeviceGameComponents_Previews: PreviewProvider {
    static var previews: some View {
        SingleDeviceGameView(players: ["Spiller 1", "Spiller 2"])
    }
}
