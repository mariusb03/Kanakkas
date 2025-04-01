//
//  DamenesAftenInfoView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 19/03/2025.
//


import SwiftUI

struct DamenesAftenInfoView: View {
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
                        title: "📜 Damenes aften! 📜",
                        description: """
                        
                        """
                    )
                    .tag(0)
                    
                    // ⚖️ Page 2: Rules
                    infoPage(
                        title: "Kategori!",
                        description: """
                        dere får en kategori, alle må komme med et ord som passer kategorien, feiler du drikker du!
                        """
                    )
                    .tag(1)
                    
                    // 🔥 Page 3: Extra Tips
                    infoPage(
                        title: "Pekelek!",
                        description: """
                        Pek på personen som passer setningen best! \n personen med mest pek drikker mengden pek hen får!
                        """
                    )
                    .tag(2)
                    
                    infoPage(
                        title: "Tommel opp/ned / hva gjør du?",
                        description: "Dere får et valg, stem med tommel opp eller ned for å stemme på hva du velger / hva du gjør. \n taperlaget drikker!"
                    )
                    .tag(3)
                    
                    infoPage(
                        title: "Jeg har aldri!",
                        description: "Spillet kommer med et utsagn! \n har du gjort det utsagnet sier, drikker du!"
                    )
                    .tag(4)
                    
                    infoPage(
                        title: "Redflag, dealbreaker eller Ok?",
                        description: "Stem om det spillet sier er et readflag, dealbreaker eller ok! \n taperlaget drikker!"
                    )
                    .tag(5)
                    
                    infoPage(
                        title: "Er du stressa?",
                        description: "spilleren over for deg velger en kategori! \n Si så mange ting du kan innenfor kategorien innen 20 sekunder! \n minst 5 ting trengs!"
                    )
                    .tag(6)
                    
                    infoPage(
                        title: "Hva er oddsen?",
                        description: "Gi din odds (mellom 1 og 100) for at du gjør det appen ber om! \n Dersom spillerene velger samme tallet må personen gjøre utfordringen! Er tallet utenfor går dere vider, personen som utfordret har nå oddsen, og oddsen senkes!"
                    )
                    .tag(7)
                }
                
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hides default indicator
                
                // ⬅️➡️ Page Navigation Dots
                HStack {
                    ForEach(0..<8, id: \.self) { index in
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(currentPage == index ? .white : .gray.opacity(0.5))
                    }
                }
               

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
                .font(Font.custom("LuckiestGuy-Regular", size: 34))
                .foregroundColor(.white)
                .shadow(color: .black, radius: 3)
                .multilineTextAlignment(.center)

            Text(description)
                .font(Font.custom("LuckiestGuy-Regular", size: 22))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
                .multilineTextAlignment(.center)
        }
    }
}

// MARK: - Preview
struct DamenesAftenView_Previews: PreviewProvider {
    static var previews: some View {
        DamenesAftenInfoView(dismiss: {})
    }
}
