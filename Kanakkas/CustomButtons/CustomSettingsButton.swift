//
//  CustomSettingsButton.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//

import SwiftUI

struct CustomSettingsButton: View {
    @State private var offsetY: CGFloat = -150
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Image(systemName: "gearshape.fill") // Settings icon
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.red)
                    .padding()
                    .cornerRadius(15)
                    .shadow(color: .red, radius: 5)
                    .offset(y: offsetY) // Slide-in effect
                    .onAppear {
                        withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                            offsetY = 0 // Moves down into position smoothly
                        }
                    }
                
                Image(systemName: "gearshape.fill") // Settings icon
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .cornerRadius(15)
                    .shadow(color: .red, radius: 5)
                    .shadow(radius: 5)
                    .offset(y: offsetY) // Slide-in effect
                    .onAppear {
                        withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                            offsetY = 0 // Moves down into position smoothly
                        }
                    }
            }
        }
    }
}

// 🛠 Preview
struct CustomSettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlayerSetupView()
        }
    }
}
