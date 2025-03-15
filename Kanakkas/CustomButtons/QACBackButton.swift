//
//  QACBackButton.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 07/03/2025.
//

import SwiftUI

struct QACBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var offsetY: CGFloat = -150

    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
                Image(systemName: "arrow.left") // Back icon
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding()
                    .cornerRadius(15)
                    .offset(y: offsetY) // Slide-in effect
                    .onAppear {
                        withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                            offsetY = 0 // Moves down into position smoothly
                        }
                    }
        }
    }
}
