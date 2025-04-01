//
//  DamenesAftenCard.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 07/03/2025.
//


import SwiftUI

// MARK: - Vorset Starter Card Model
struct HundreSpørsmålCard: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let category: String
    let needsPlayer: Bool
}

// MARK: - Category Colors
let hundreSpørsmålCategoryColors: [String: Color] = [
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
    "ingen tittel": Color.red,                // Red (Default for empty titles)
    "rød": Color.red,
    "blå": Color.blue,
    "grønn": Color.green,
    "lilla": Color.purple,
    "pink": Color.pink,
    "orange": Color.orange,
    "cyan": Color.cyan
]

// MARK: - Vorset Starter Card Data
let hundreSpørsmålCards: [HundreSpørsmålCard] = [
    
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er alltid på mobilen?", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har mest viljestyrke?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er best på å chugge?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er den verste sjåføren?", category: "lilla", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er sykest i hodet", category: "orange", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Spander alltid på fylla?", category: "cyan", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er kåtest?", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er flinkest på skolen?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Tar seg mest på puppene?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Trodde lengst på julenissen?", category: "lilla", needsPlayer: false),
    
    HundreSpørsmålCard(title: "10 spørsmål!", description: "en skål for alle som stilte opp i dag!", category: "rosa", needsPlayer: false),
    
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har Utrolig nok ikke har vært i håndjern enda", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Sender mest nudes?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Kan drikke mest uten å bli drita?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har hooket med flest i rommet?", category: "lilla", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er den største fyliken?", category: "orange", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har vært/kunne vært utro.", category: "cyan", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Blir den beste moren/faren.", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har best hygiene?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har Kjørt uten lappen?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har hatt trekant?", category: "lilla", needsPlayer: false),
    
    HundreSpørsmålCard(title: "20 spørsmål!", description: "2 skåler for en god start på vorset!", category: "rosa", needsPlayer: false),
    
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er Mest ubesluttsom", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har onanert offentlig?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Bruker mest penger på byen?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Ville du vært på en øde øy med?", category: "lilla", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Knuser flest hjerter?", category: "orange", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har diggest tits?", category: "cyan", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Tror selv hen er morsomst.", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har best musikksmak", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "kunne personen til din høyre hooket med?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Blir mest fyllesyk?", category: "lilla", needsPlayer: false),
    
    HundreSpørsmålCard(title: "30 spørsmål!", description: "3 skåler! Det skal vel bli god stemining?!", category: "rosa", needsPlayer: false),
    
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er mest bortskjemt?", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Hadde klart seg best på farmen?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Lyser opp rommet?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Onanerer mest?", category: "lilla", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Får du vakrest barn med?", category: "orange", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Ville du ikke hatt til å styre dine sosiale medier for en dag?", category: "cyan", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har finest rumpe?", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er den beste vennen?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har de fineste øynene", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Trodde du var et rasshøl første gang dere møttes?", category: "lilla", needsPlayer: false),
    
    HundreSpørsmålCard(title: "40 spørsmål!", description: "4 skåler! Nesten halvveis nå!", category: "rosa", needsPlayer: false),
    
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er mest uheldig?", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "har Tatt flest jomfrudommer?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Spyr i kveld?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Blir den beste kjæresten?", category: "lilla", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "har Gått lengst uten å ha sex?", category: "orange", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "er Mest sannsynlig å være hangover på en hverdag?", category: "cyan", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "er Morsomst?", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har hatt flest våte drømmer?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er smartest?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "er Svigemors/Svigefars drøm?", category: "lilla", needsPlayer: false),
    
    HundreSpørsmålCard(title: "50 spørsmål!", description: "5 skåler for å være halvveis!", category: "rosa", needsPlayer: false),
    
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er med på alt?", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "er Dårligst på å bruke prevensjon?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Danser best?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Mest ansvarlig?", category: "lilla", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Minst ansvarlig?", category: "orange", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Lukter best?", category: "cyan", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er den beste sjekkeren?", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "har Høyest IQ?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har den mest skitneste loggen?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Hadde blitt den beste statsministeren?", category: "lilla", needsPlayer: false),
    
    HundreSpørsmålCard(title: "60 spørsmål!", description: "6 skåler fordi dere kom dere over halvveis!", category: "rosa", needsPlayer: false),
    
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har det beste snittet", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "er Festens midtpunkt?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "er Best til å kysse?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "er Største dramaqueenen?", category: "lilla", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "har Rundet netflix?", category: "orange", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Hadde overlevd hunger games?", category: "cyan", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "kommer til å drikke mest i kveld?", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Blir millionær først?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er lærerens favoritt?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Blir best likt av nye personer?", category: "lilla", needsPlayer: false),
    
    HundreSpørsmålCard(title: "70 spørsmål!", description: "7 skåler fordi hvorfor ikke!", category: "rosa", needsPlayer: false),
    
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har de mest slitte knærne?", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er best i sengen?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er villest?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har shavet og er klar for alt?", category: "lilla", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er lengst i dusjen?", category: "orange", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Blir mest sukessfull?", category: "cyan", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "sover ikke hjem i natt?", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er flinkest med barn?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har størst kjendisfaktor?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er mest empatisk?", category: "lilla", needsPlayer: false),
    
    HundreSpørsmålCard(title: "80 spørsmål!", description: "8 skåler for å nærme seg!", category: "rosa", needsPlayer: false),
    
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har best sjans på deg?", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har flest tinder matches", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Ler på dårligst tidspunkt?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "ville du hatt som beer pong partner?", category: "lilla", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Blir gjenkjent på polet?", category: "orange", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Blir gjenkjent på kondomeriet?", category: "cyan", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Stoler du mest på?", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Hadde gjort alt for penger?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Hooker mest?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Lager de sykeste lydene i senga?", category: "lilla", needsPlayer: false),
    
    HundreSpørsmålCard(title: "90 spørsmål!", description: "9 skåler for å nesten være ferdig!", category: "rosa", needsPlayer: false),
    
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Blir raskest sjalu?", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "hadde Mest sannsynelig kunne spilt i en porno?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "hadde betalt for å se den?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Får flest nudes?", category: "lilla", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er den største stalkeren?", category: "orange", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Kommer raskest?", category: "cyan", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Har sex på første date?", category: "rød", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Er keen på læreren sin?", category: "blå", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Blir spandert mest på på byen?", category: "grønn", needsPlayer: false),
    HundreSpørsmålCard(title: "Hvem i rommet...", description: "Skal chugge enheten sin med deg?", category: "lilla", needsPlayer: false),
    
    HundreSpørsmålCard(title: "100 spørsmål!", description: "Grattis, dere kom dere gjennom, jævla krigere! \n 10 skåler for å takke for laget!", category: "rosa", needsPlayer: false),
    
    
]

// MARK: Title Card
struct HundreSpørsmålTitleCard: View {
    @State private var isTapped = false
    @State private var offsetY: CGFloat = -300
    
    var body: some View {
        ZStack {
            Text("100 spørsmål!")
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
