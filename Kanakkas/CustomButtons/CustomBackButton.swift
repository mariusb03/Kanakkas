//
//  CustomBackButton.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//


import SwiftUI

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var offsetY: CGFloat = -150

    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            ZStack {
                Image(systemName: "arrow.left") // Back icon
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
                    
                        
                        
                    
                
                Image(systemName: "arrow.left") // Back icon
                    .font(.title)
                    .fontWeight(.bold)
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
}

// 🛠 Preview
struct CustomBackButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlayerSetupView()
        }
         
    }
}
