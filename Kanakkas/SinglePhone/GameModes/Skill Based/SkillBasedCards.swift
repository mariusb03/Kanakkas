//
//  SkillBasedCards.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 16/03/2025.
//

//
//  VorsetStarterCard.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 07/03/2025.
//


import SwiftUI

// MARK: - Vorset Starter Card Model
struct SkillBasedCard: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    let category: String
    let needsPlayer: Bool

    // ✅ Implement Hashable conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: SkillBasedCard, rhs: SkillBasedCard) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Category Colors
let skillBasedCategoryColors: [String: Color] = [
    "kategori": Color.red,
                   
]

// MARK: - Vorset Starter Card Data
let skillBasedCards: [SkillBasedCard] = [
    
    // MARK: Kategori (dark blue)
    SkillBasedCard(title: "BeerPong!", description: "Spill en runde med beer pong! \n vinnerene får dele ut 5 slurker hver! \n Regler: \n Alle vet ha beerpong er!", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "BeerKing!", description: "Spill en runde med beer King! \n Regler: \n Sett frem like mange halfulle glass/kopper som spillere! Plasser deretter en ektra kopp i midten av dise koppene! \n En valgfri spiller starter nå med å treffe koppen i midten, ballen må treffe bordet først og det er ikke lov å kaste rett foran koppen i midten. Treffer spilleren må alle andre drikke! \n Om spilleren bommer må en selv drikke 3 slurker! Om spilleren treffer en annen kopp må både kasteren og koppens eier drikke 3 slurker! \n Spillet holder på så lenge dere ønsker!", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "Ikke fult før det renner over!!", description: "Hent like mange glass som spillere + et til! \n En person starter med å helle så mye vann de vil i glasset! \n Spilleren til venstre fortsetter! \n Målet med spillet er å fylle opp glasset så mye som mulig, uten at det renner utenfor glasset! \n Spilleren som gjør at det renner over må chugge resten av drikken sin!", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "BeerPong!", description: "Spill en runde med beer pong! \n vinnerene får dele ut 5 slurker hver! \n Regler: \n Alle vet ha beerpong er!", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "Flip Cup!", description: "Spill en runde med Flip Cup! \n Regler: \n Spillerene deles i ønket mengde lag! \n Alle spillerene har hver sin kopp (ikke knuselig) \n Spillerene skal etter tur (en og en fra laget) drikke det de har i koppen så fort som mulig! \n deretter skal spilleren sette koppen opp ned på enden av bordet! \n Dette fortsetter til hele laget er ferdig \n Laget som fullfører først får dele ut 5 slurker hver!", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "Speed Pong!", description: "Spill en runde med Speed pong! \n Regler: \n Ligner på Beer Pong, men her brukes kun en kopp! \n spillerene deles inn i 2 lag! \n Målet med spillet er at et av lagene skal treffe koppen 5 ganger! \n Treffer laget ditt, må det andre laget drikke 3 slurker hver! \n Bommer laget ditt, må dere drikke 3 slurker hver! \n første laget til å treffe 5 baller får dele ut 5 slurker hver!", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "Hat-Trick!", description: "Spill en runde med Hat-Trick! \n Regler: \n Plasser en hatt eller lignende på midted av bordet! \n spillerene går på tur for å prøve å treffe hatten med en ball eller lignende! \n Treffer du hatten før du dele ut 3 slurker! \n Bommer du må du drikke 3 slurker!" , category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "Terningen/opus!", description: "Spill en runde med terningen/opus! \n Regler: \n Skur på sangen Opus - eric Prydz! Velg hvor mange terninger som skal være i spillet! (terning app på mobilen) \n Dersom du får 6 på terningen gi telefonen videre til venstre! \n får du 6 på først forsøk kan du gi terningen til hvem som helst! \n får du 3 på terningen må du ta en sup før du fortsetter å rulle terningen! \n Personene som står igjen med en telefon må chugge resten av drikken når dere hører droppet i sangen! \n nb! ned er 2 drop i sangen, dere kan velge å fortsette etter det første droppet om dere ønsker en mer intens versjon!", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "Fysisk Terning!", description: "Spill en runde med Fysisk Terning! \n Regler: \n hver spiller får rulle en terning! \n 1 = Alle drikker 1 sup, 2 = Spilleren til venstre drikker 2 super \n 3 = Spilleren til høyre drikker 3 super, 4 = Du deler ut 4 slurker \n 5 = du drikker 5 super selv, 6 = alle drikker 6 slurker", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "Drita Bowling!", description: "Spill en runde med Drita Bowling! \n Regler: \n Sett ut en pyramide med (helst) tomme små kopper! finn en ball eller et objekt som ikke gjør det for enkelt! \n Målet er å velte så mange kopper som mulig! \n Gi ut 2 super for hver veltede kopp!", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "Steike varm ølkork!", description: "Spill en runde med steike varm ølkork! \n Regler: \n Hent en ølkork eller lignende (Flere er bedre)! \n En spiller velger en sang som skal spille! Denne personen har også ansvaret for å stoppe musikken (sangen må spille i minst 10 sekunder)! \n En person kaster ølkorken tilfeldig til en annen, dette holder på til samgen stopper! \n Personen(e) som holder ølkorken(e) må drikke 5 slurker dersom musikken stopper når musikken stopper!", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "Gjett sangen!", description: "Spill en runde med Gjett Sangen \n Regler: \n En tilfeldig person får ansvaret for å sette på en sang! \n Dere må gjette hvilken sang det er! \n Hvis du gjettes riktig får du dele ut 3 super! \n Hvis du gjettes feil får de som har satt på sangen dele ut 2 super!", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "For Drita?", description: "Her skal balansen testes! \n Regler: \n Lag en linje på gulvet (Tape, eller lignende) \n En og en skal dere gå langs linjen! \n Mister spilleren balansen og tråkker utenfor linjen, må hen drikke 3 slurker for hver gang dette skjer! \n Klarer hen hele linjen kan hen gi ut 10 slurker!", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "Gjett ordet!", description: "Her skal tegne evnene skal bevises! \n Regler: \n En spiller begynner med å tegne et ord eller utrykk! \n Resten av spillerene har 60 sek på å tippe hvilket ord eller uttrykk spilleren har tegnet! \n Dersom en spiller klare å gjette ordet eller uttrykket, får hen dele ut 10 slurker! \n Dersom ingen klarer å tippe ordet eller uttrykket, får tegneren gi ut 10 slurker selv!", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "Spinning Room!", description: "Kan du balansere gjennom rommet? \n Regler: \n Hver spiller skal 1 etter 1 bli snurret rundt sin egen agse 10 ganger! \n Hen skal deretter prøve å gå fra en side av rommet til den andre uten å falle! \n Faller hen, mp hen drikke 5 slurker! \n Klarer hen å gå gjennom hele rommet uten å falle kan hen dele ut 10 slurker!", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "Hviske Leken!", description: "Er du god på å lese lepper? \n Regler: \n Personen som trekker kortet begynner! \n Hen skal hviske et setning til personen til venstre! Spilleren må holde for ørene slik at ingen kan høre hva personen sier! \n setningen skal deretter gå vider til venstre til setningen kommer tilbake til spilleren som begynte! \n De som gjetter feil i forhold til den til venstre må drikke 3 slurker! \n (Setningen må ikke være den samme som den som begynte, bare fra den som kommer fra venstre for deg!" , category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "Etterligneren!", description: "Er du god til å immitere andre? \n Regler: \n En spiller begynner med å etterligne en kjent person eller en i rommet! \n De andre spillerene skal etter tur gjette hvem hen etterligner! \n Gjetter du riktig får du dele ut 5 slurker! \n Gjetter du feil må du drikke 5 slurker selv!", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "Ingen Hender!", description: "Drikk uten å bruke hendene! \n Regler: \n Personen som trakk kortet, drikk en enhet uten å bruke hendene! \n Klarer du det får du dele ut 20 slurker! \n Dersom du ikke klarte det, må du drikke 10 slurker selv! \n Om du ikke prøver må du uansett drikke 5 slurker!", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "Hvem er jeg?", description: "Er du god på kjente mennesker? \n Regler: \n Finn frem like mange lapper tilsvarende spillere! \n Alle skal ha et nav på en kjent person i pannen! \n Alle får stille Ja/Nei spørsmål, ut ifra dette må alle gjette hvem de har i pannen! \n for hvert feil gjett må du drikke 3 slurker! \n Tipper du riktig får du dele ut 5 slurker!", category: "kategori", needsPlayer: false),
    
    SkillBasedCard(title: "Drita Karaoke!", description: "Er du god på sanger? \n Regler: \n Hver spiller skal gjennom denne leken! \n En sang skal spilles, midt i sangen skal musikken stoppes! \n Personen skal deretter fortsette å synge riktig sangtekst! \n Synger personen feil må hen drikke 3 slurker! \n Synger hen riktig får hen dele ut 5 slurker!", category: "kategori", needsPlayer: false),
]

// MARK: Title Card
struct SkillBasedTitleCard: View {
    @State private var isTapped = false
    @State private var offsetY: CGFloat = -300
    
    var body: some View {
        ZStack {
            Text("Test ferdighetene dine!")
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
