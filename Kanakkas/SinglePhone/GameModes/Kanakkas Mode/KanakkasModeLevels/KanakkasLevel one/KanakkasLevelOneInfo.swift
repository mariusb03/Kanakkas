//
//  KanakkasLevelOneInfo.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 27/03/2025.
//

import SwiftUI

struct KanakkasLevelOneInfo: View {
    var dismiss: () -> Void // Closure to close the info view
    @State private var currentPage = 0 // Tracks the current page

    var body: some View {
        ZStack {
            // 🔹 Blurred Background
            VisualEffectBlurView()
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    dismiss() // Dismiss when tapping outside
                }
            
            // 📜 Swipeable Info Cards
            VStack {
                // 📌 Swipeable TabView
                TabView(selection: $currentPage) {
                    
                    // 📜 Page 1: Game Explanation
                    infoPage(
                        title: "📜 Delvis Kanakkas! 📜",
                        description: """
                                Den letteste formen for Kanakkas!
                        Her håper vi ikke vorsets elegante damer og herrer stuper med hodet først i doskåla!
                        Promillen skal allikevel kjennes etter en god runde her!
                        """
                    )
                    .tag(0)
                    
                    // ⚖️ Page 2: Rules
                    infoPage(
                        title: "📖 Regler 📖",
                        description: """
                        Spillene kan spilles så lenge dere vil med noen få avbrekk med spørsmål og utfordringer!
                        """
                    )
                    .tag(1)
                    
                    // 🔥 Page 3: Extra Tips
                    infoPage(
                        title: "🔥 Tips & Tricks 🔥",
                        description: """
                        💡 Vil dere øke nivået?
                        Øk gjerne drikke straffen om dere føler nivået i gruppa er for lavt!
                        """
                    )
                    .tag(2)
                }
                
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hides default indicator
                
                // ⬅️➡️ Page Navigation Dots
                HStack {
                    ForEach(0..<3, id: \.self) { index in
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(currentPage == index ? .white : .gray.opacity(0.5))
                    }
                }
                .padding(.top, 10)

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
                .padding(.top, 10)
            }
            .padding()
            .frame(width: 550, height: 350)
            .background(Color.red.opacity(0.8))
            .cornerRadius(20)
            .shadow(radius: 10)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // 📌 Helper function to create a formatted info page
    private func infoPage(title: String, description: String) -> some View {
        VStack(spacing: 20) {
            Text(title)
                .font(Font.custom("LuckiestGuy-Regular", size: 25))
                .foregroundColor(.white)
                .shadow(color: .black, radius: 3)

            Text(description)
                .font(Font.custom("LuckiestGuy-Regular", size: 22))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

// MARK: - Preview
struct KanakkasLevelOneInfo_Previews: PreviewProvider {
    static var previews: some View {
        KanakkasLevelOneInfo(dismiss: {})
    }
}
