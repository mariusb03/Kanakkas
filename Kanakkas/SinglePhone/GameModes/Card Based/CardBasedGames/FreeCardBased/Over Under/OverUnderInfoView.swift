//
//  OverUnderInfoView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 12/03/2025.
//

import SwiftUI

struct OverUnderInfoView: View {
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
            VStack(spacing: 10) {
                Text("📜 Over/Under Regler! 📜")
                    .font(Font.custom("LuckiestGuy-Regular", size: 34))
                    .foregroundColor(.white)
                    .shadow(color: .red, radius: 5)
                
                Text("Yngte i rommert begynner!\n Tipp om neste korter er høyere eller lavere enn forrige kort!")
                    .font(Font.custom("LuckiestGuy-Regular", size: 22))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text(" Gjetter hen riktig, Fortsett til neste spiller og legg til en slurk i taperpotten!\n Gjetter hen feil, må hen ta alle slurkene i potten og dere begynner på nytt! 🍻")
                    .font(Font.custom("LuckiestGuy-Regular", size: 20))
                    .foregroundColor(.yellow)
                    .multilineTextAlignment(.center)
                    

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
    }
}

// MARK: - Blur Effect
struct VisualEffectBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

// MARK: - Preview
struct OverUnderInfoView_Previews: PreviewProvider {
    static var previews: some View {
        OverUnderInfoView(dismiss: {})
    }
}
