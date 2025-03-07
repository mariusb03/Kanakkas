//
//  MultiplayerSelectionComponents.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//

import SwiftUI

struct SelectionButton: View {
    @State private var offsetY: CGFloat = 300
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(Font.custom("LuckiestGuy-Regular", size: 30))
            .foregroundColor(.white)
            .frame(width: 300, height: 70)
            .background(Color.red)
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding(5)
            .offset(y: offsetY) // Slide-in effect
            .onAppear {
                withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                    offsetY = 0 // Moves down into position smoothly
                }
            }
    }
}

// MARK: Title Card
struct MultiplayerSelectionTitleCard: View {
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
            .scaleEffect(isTapped ? 1.2 : 1.0) // Bounce effect
            .offset(y: offsetY) // Slide-in effect
            .onAppear {
                withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5)) {
                    offsetY = 0 // Moves down smoothly
                }
            }
            .onTapGesture {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.2)) {
                    isTapped.toggle()
                }
                
                // Reset the animation after a short delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.2)) {
                        isTapped = false
                    }
                }
            }
            .padding(.top)
    }
}

// 🛠 Preview
struct MultiplayerSelectionComponents_Previews: PreviewProvider {
    static var previews: some View {
        MultiplayerSelectionView()
    }
}
