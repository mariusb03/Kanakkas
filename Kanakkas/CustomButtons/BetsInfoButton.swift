//
//  BetsInfoButton.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 16/03/2025.
//

import SwiftUI

struct BetsInfoButton: View {
    @State private var offsetY: CGFloat = -150
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            
                Image(systemName: "info.circle") // Settings icon
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding()
                    .cornerRadius(15)
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
