//
//  KrigInfoView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 15/03/2025.
//

import SwiftUI

struct KrigInfoView: View {
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
                Text("📜 Krig! 📜")
                    .font(Font.custom("LuckiestGuy-Regular", size: 34))
                    .foregroundColor(.white)
                    .shadow(color: .red, radius: 5)
                
                Text("Hver spiller trekker et kort, den med høyeste kortet vinner runden! \n får spillerene samme verdi, blir det krig! Her dobles mengden super for hver krig! \n lykke til!")
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
            .frame(width: 550)
            .background(Color.red.opacity(0.8))
            .cornerRadius(20)
            .shadow(radius: 10)
        }
        .navigationBarBackButtonHidden(true)
    }
}



// MARK: - Preview
struct KrigInfoView_Previews: PreviewProvider {
    static var previews: some View {
       KrigInfoView(dismiss: {})
    }
}
