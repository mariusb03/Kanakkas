//
//  VorsetStarterCard.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 07/03/2025.
//


import SwiftUI

// MARK: - Vorset Starter Card Model
struct ErDetVarmtHerCard: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let category: String
    let needsPlayer: Bool
}

// MARK: - Category Colors
let erDetVarmtHerCategoryColors: [String: Color] = [
    "kategori": Color.blue,                // Dark Blue
    "pekelek": Color.green,                 // Green
    "regel": Color.purple,                   // Purple
    "regel opphevet": Color.purple,          // Purple (Same as "regel")
    "tommel opp/ned": Color.green,           // Dark Green
    "jeg har aldri": Color.cyan,             // Light Blue
    "red flag, dealbreaker eller OK": Color.red, // Dark Red
    "hot seat": Color.red,                   // Red
    "er du stressa": Color.orange,           // Orange
    "hemmelig spørsmål": Color.pink,         // Pink
    "hva er oddsen": Color.green,            // Green
    "ingen tittel": Color.red                // Red (Default for empty titles)
]

// MARK: - Vorset Starter Card Data
let erDetVarmtHerCards: [ErDetVarmtHerCard] = [
    
    // MARK: Kategori (dark blue)
    ErDetVarmtHerCard(title: "Kategorien er ...", description: "Idrettsstjerner, den mest atletiske starter", category: "kategori", needsPlayer: false),
    
    // MARK: Pekelek (green)
    ErDetVarmtHerCard(title: "Pekelek", description: "Hvem er best til å lyve?", category: "pekelek", needsPlayer: false),
    ErDetVarmtHerCard(title: "Pekelek", description: "Hvem ber andre drepe edderkopper for de?", category: "pekelek", needsPlayer: false),
    ErDetVarmtHerCard(title: "Pekelek", description: "Hvem ville du hatt som partner i en start-up?", category: "pekelek", needsPlayer: false),
    
    // MARK: Regel (purple)
    ErDetVarmtHerCard(title: "Regel", description: "{player}", category: "regel", needsPlayer: true),
    
    
    // MARK: Regel Opphevet (purple)
    ErDetVarmtHerCard(title: "Regel opphevet", description: "{player}", category: "regel opphevet", needsPlayer: true),
    
    
    // MARK: Tommel opp/ned (dark green)
    ErDetVarmtHerCard(title: "Tommel opp/ned", description: "{player}", category: "tommel opp/ned", needsPlayer: true),
    
    
    // MARK: Jeg har aldri (light blue)
    ErDetVarmtHerCard(title: "Jeg har aldri ...", description: "{player}", category: "jeg har aldri", needsPlayer: true),
    
    
    // MARK: Red flag, dealbreaker eller OK? (dark red)
    ErDetVarmtHerCard(title: "Red flag, dealbreaker eller OK?", description: "{player}", category: "red flag, dealbreaker eller OK", needsPlayer: true),
    
    
    // MARK: Hot seat (red)
    ErDetVarmtHerCard(title: "Hot seat", description: "{player}", category: "hot seat", needsPlayer: true),
    
    
    // MARK: Er du stressa? (orange)
    ErDetVarmtHerCard(title: "Er du stressa?", description: "", category: "er du stressa", needsPlayer: false),
    
    // MARK: Stipp!
    ErDetVarmtHerCard(title: "Stripp!", description: "", category: "stripp", needsPlayer: true),
    
    
    // MARK: hemmelig spørsmål (pink)
    ErDetVarmtHerCard(title: "Hemmelig spørsmål", description: "", category: "hemmelig spørsmål", needsPlayer: false),
    
    // MARK: Hva er oddsen ... (green)
    ErDetVarmtHerCard(title: "Hva er oddsen ...", description: "", category: "hva er oddsen", needsPlayer: false),
    
    // MARK: ingen tittel (red)
    ErDetVarmtHerCard(title: "", description: "", category: "ingen tittel", needsPlayer: false),
    ErDetVarmtHerCard(title: "Flammer", description: "Drikk 1 slurk for hver person av det motsatte kjønn du har på topplisten på snap", category: "ingen tittel", needsPlayer: false),
]

// MARK: Title Card
struct ErDetVarmtHerTitleCard: View {
    @State private var isTapped = false
    @State private var offsetY: CGFloat = -300
    
    var body: some View {
        ZStack {
            Text("Er Det Varmt Her?")
                .font(Font.custom("LuckiestGuy-Regular", size: 32))
                .foregroundColor(.white)
                .shadow(radius: 5)
            
            
        }
        .frame(width: 500)
        
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
