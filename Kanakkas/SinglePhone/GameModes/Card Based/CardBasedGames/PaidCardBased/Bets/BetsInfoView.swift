//
//  BetsInfoView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 16/03/2025.
//

import SwiftUI

struct BetsInfoView: View {
    var dismiss: () -> Void // Closure to close the info view

    var body: some View {
        ZStack {
            // 🔹 Blurred Background
            VisualEffectBlurView()
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    dismiss() // Dismiss when tapping outside
                }
            
            // 📜 Info Card
            VStack(spacing: 20) {
                Text("📜 Kongens Kopp! 📜")
                    .font(Font.custom("LuckiestGuy-Regular", size: 34))
                    .foregroundColor(.white)
                    .shadow(color: .red, radius: 5)
                
                Text("2 tilfeldige spillere blir valgt! \n Hver spiller velger hvor mange slurker de vil vedde! \n spillet trekker deretter 2 tilfeldige kort! \n laveste kortet taper og må drikke det hen veddet! \n deretter må hen fortsette til hen vinner! \n vinneren får dele ut det hen veddet til noen andre i rommet!")
                    .font(Font.custom("LuckiestGuy-Regular", size: 20))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                

                // ❌ Close Button
                Button(action: dismiss) {
                    Text("Lukk")
                        .font(Font.custom("LuckiestGuy-Regular", size: 24))
                        .padding()
                        .frame(width: 150)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
            }
            .padding()
            .frame(width: 600)
            .background(Color.red.opacity(0.8))
            .cornerRadius(20)
            .shadow(radius: 10)
        }
        .navigationBarBackButtonHidden(true)
    }
}



// MARK: - Preview
struct BetsInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BetsInfoView(dismiss: {})
    }
}
