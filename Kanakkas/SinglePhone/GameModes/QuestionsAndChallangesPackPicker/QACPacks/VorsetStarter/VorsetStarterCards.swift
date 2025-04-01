//
//  VorsetStarterCard.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 07/03/2025.
//


import SwiftUI

// MARK: - Vorset Starter Card Model
struct VorsetStarterCard: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    let category: String
    let needsPlayer: Bool
    
    // ✅ Implement Hashable conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: VorsetStarterCard, rhs: VorsetStarterCard) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Category Colors
let vorsetStarterCategoryColors: [String: Color] = [
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
    "ingen tittel": Color.red,               // Red (Default for empty titles)
    "hva gjør du": Color.green,
    "utfordring": Color.purple,
    "historie": Color.pink
]


// MARK: - Rule Pairing Logic
let vorsetStarterPairedRules: [(VorsetStarterCard, VorsetStarterCard)] = [
    (
        VorsetStarterCard(title: "Flytende greier?", description: "Fra nå av er det ikke lenger lov å si 'drikke' eller 'alkohol' \n Dette straffes med 2 slurker!", category: "regel", needsPlayer: true),
        VorsetStarterCard(title: "Alkohol!", description: "Dere kan gå tilbake til Å kalle det 'drikke' eller 'alkohol' igjen nå! \n Det ble litt for mange kreative nye forslag!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        VorsetStarterCard(title: "Skål!", description: "Hver gang dere drikker er dere nødt til å si 'skål' til en annen i rommet \n 2 slurker for hver gang dette ikke gjennomføres!", category: "regel", needsPlayer: true),
        VorsetStarterCard(title: "Litt mye?", description: "Dere skal få slippe å si 'skål!' nå! \n Det ble litt mye kanskje?", category: "regel opphevet", needsPlayer: true)
    ),
    (
        VorsetStarterCard(title: "OuiOui!", description: "Alle må nå snakke med en aksent! \n 2 slurker hvert ord som ikke er på aksent", category: "regel", needsPlayer: true),
        VorsetStarterCard(title: "JADA!", description: "Det aksent greiene ble litt voldsomt... \n slutt med det tullet nå!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        VorsetStarterCard(title: "Spørsmål? aldri hørt om", description: "Det er ikke lenger lov å svare på spørsmål! \n hver gang du besvarer et spørsmål, må du drikke 2 slurker!", category: "regel", needsPlayer: true),
        VorsetStarterCard(title: "Åja, det var det du spurte om?", description: "Dere kan nå få svare på spørsmål igjen!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        VorsetStarterCard(title: "3. person!", description: "Dere må nå snakke om dere selv i tredje person! \n Dersom du ikke gjør det drikker 2 slurker", category: "regel", needsPlayer: true),
        VorsetStarterCard(title: "Jeg og meg!", description: "Dere kan nå slippe å snakke i tredje person!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        VorsetStarterCard(title: "Vask munnen!", description: "Det er ikke lenger lov å banne \n dette straffes med 2 slurker", category: "regel", needsPlayer: true),
        VorsetStarterCard(title: "Nå ble det kjedelig!", description: "Fyfaen, dette ble jævlig kjedelig \n det er faen meg lov å banne igjen for helvete!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        VorsetStarterCard(title: "Baby!", description: "Dere må nå alle snakke med baby-stemme \n straffen er 2 slurker om dette ikke blir gjort", category: "regel", needsPlayer: true),
        VorsetStarterCard(title: "Babyen er voksen igjen!", description: "Voks opp a folkens! Slutt med det baby tullet!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        VorsetStarterCard(title: "DAB!", description: "Det er nå obligatorisk å hitte en feit dab før du drikker \n straffen er 2 slurker om dette ikke blir gjort!", category: "regel", needsPlayer: true),
        VorsetStarterCard(title: "Litt cringe kanskje?", description: "Dab var inn i 2018 folkens... \n Følg med da!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        VorsetStarterCard(title: "Schall!", description: "Det er nå pålagt å rope 'schall!', som admiral von schneider, før man drikker! \n straffen er 2 slurker om dette ikke blir gjort", category: "regel", needsPlayer: true),
        VorsetStarterCard(title: "Schall ferdig!", description: "Det er ikke lenger pålagt å rope 'schall!'. \n men dere må gjerne fortsette!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        VorsetStarterCard(title: "Deres høyhet?", description: "{player} er nå kongen/dronningen, hen må derfor omtales som 'Deres majestet' \n straffen er 2 slurker om dette ikke blir gjort!", category: "regel", needsPlayer: true),
        VorsetStarterCard(title: "Deres lavhet", description: "Det viste seg å bare være en wannabe... \n Slutt med det 'deres majestet' tullet!", category: "regel opphevet", needsPlayer: true)
    )
]

// MARK: - Vorset Starter Card Data
let vorsetStarterCards: [VorsetStarterCard] = [
    
    // MARK: Kategori (dark blue)
    VorsetStarterCard(title: "Kategorien er ...", description: "filmer! \n {player} starter!", category: "kategori", needsPlayer: true),
    VorsetStarterCard(title: "Kategorien er ...", description: "tv-serier! \n {player} starter!", category: "kategori", needsPlayer: true),
    VorsetStarterCard(title: "Kategorien er ...", description: "Kjendiser! \n {player} starter!", category: "kategori", needsPlayer: true),
    VorsetStarterCard(title: "Kategorien er ...", description: "Drinker! \n {player} starter!", category: "kategori", needsPlayer: true),
    VorsetStarterCard(title: "Kategorien er ...", description: "Typiske 'cringe' ting folk legge rut på sosiele medier! \n {player} starter!", category: "kategori", needsPlayer: true),
    VorsetStarterCard(title: "Kategorien er ...", description: "Ting du aldri skal si på første date! \n {player} starter!", category: "kategori", needsPlayer: true),
    VorsetStarterCard(title: "Kategorien er ...", description: "Kjente personer som begynner på 's'! \n {player} starter!", category: "kategori", needsPlayer: true),
    VorsetStarterCard(title: "Kategorien er ...", description: "Prevensjonsmidler! \n {player} starter!", category: "kategori", needsPlayer: true),
    VorsetStarterCard(title: "Kategorien er ...", description: "Uvanlige fobier! \n {player} starter!", category: "kategori", needsPlayer: true),
    VorsetStarterCard(title: "Kategorien er ...", description: "Valgfri kategori! \n {player} velger og starter!", category: "kategori", needsPlayer: true),
    
    
    // MARK: Pekelek (green)
    VorsetStarterCard(title: "Pekelek", description: "Hvem er best til å lyve?", category: "pekelek", needsPlayer: false),
    VorsetStarterCard(title: "Pekelek", description: "Hvem ber andre drepe edderkopper for de?", category: "pekelek", needsPlayer: false),
    VorsetStarterCard(title: "Pekelek", description: "Hvem ville du hatt som partner i en start-up?", category: "pekelek", needsPlayer: false),
    VorsetStarterCard(title: "Pekelek", description: "Hvem kommer oftest for sent?", category: "pekelek", needsPlayer: false),
    VorsetStarterCard(title: "Pekelek", description: "Hvem blir mest drita i kveld?", category: "pekelek", needsPlayer: false),
    VorsetStarterCard(title: "Pekelek", description: "Hvem har best sjans på byen?", category: "pekelek", needsPlayer: false),
    VorsetStarterCard(title: "Pekelek", description: "Hvem googler seg selv mest?", category: "pekelek", needsPlayer: false),
    VorsetStarterCard(title: "Pekelek", description: "Hvem er den beste sjekkeren?", category: "pekelek", needsPlayer: false),
    VorsetStarterCard(title: "Pekelek", description: "Hvem spyr i kveld?", category: "pekelek", needsPlayer: false),
    VorsetStarterCard(title: "Pekelek", description: "Hvem hadde gjord hva som helst for penger?", category: "pekelek", needsPlayer: false),
    
    
    // MARK: Tommel opp/ned (dark green)
    VorsetStarterCard(title: "Tommel opp/ned", description: "Drikke øl/vin med sugerør?", category: "tommel opp/ned", needsPlayer: false),
    VorsetStarterCard(title: "Tommel opp/ned", description: "Ghoste noen etter første date?", category: "tommel opp/ned", needsPlayer: false),
    VorsetStarterCard(title: "Tommel opp/ned", description: "Stalkere eksen på sosiale medier?", category: "tommel opp/ned", needsPlayer: false),
    VorsetStarterCard(title: "Tommel opp/ned", description: "Dra på ferie alene?", category: "tommel opp/ned", needsPlayer: false),
    VorsetStarterCard(title: "Tommel opp/ned", description: "Bruke emojis i en jobbsøknad?", category: "tommel opp/ned", needsPlayer: false),
    VorsetStarterCard(title: "Tommel opp/ned", description: "Date noen 10 år eldre?", category: "tommel opp/ned", needsPlayer: false),
    VorsetStarterCard(title: "Tommel opp/ned", description: "Å ha samme passord på alt?", category: "tommel opp/ned", needsPlayer: false),
    VorsetStarterCard(title: "Tommel opp/ned", description: "Ost og vin eller Pils og pizza?", category: "tommel opp/ned", needsPlayer: false),
    VorsetStarterCard(title: "Hva gjør du?", description: "Bli satt på prykiatrisk helt til du kan bevise at du er ved dine fulle fem, \n eller poste 10 tiktoks daglig der du driter deg ut?", category: "tommel opp/ned", needsPlayer: false),
    VorsetStarterCard(title: "Hva gjør du?", description: "Helevete bryter løs, tredje verdenskrig er realitet og russerne innvaderer. \n Du får valget om å verve deg til frontlinjen eller være hjelpepleier på et trygt sykehus, hva gjør du! \n Stem med tommel opp eller ned!", category: "tommel opp/ned", needsPlayer: false),
    
    
    // MARK: Jeg har aldri (light blue)
    VorsetStarterCard(title: "Jeg har aldri ...", description: "Gått på en blind date", category: "jeg har aldri", needsPlayer: false),
    VorsetStarterCard(title: "Jeg har aldri ...", description: "Blitt ferska i å snoke på noen sin mobil", category: "jeg har aldri", needsPlayer: false),
    VorsetStarterCard(title: "Jeg har aldri ...", description: "Sagt feil navn til noen ved et uhell", category: "jeg har aldri", needsPlayer: false),
    VorsetStarterCard(title: "Jeg har aldri ...", description: "Sovnet offentlig (på buss, tog, jobb)", category: "jeg har aldri", needsPlayer: false),
    VorsetStarterCard(title: "Jeg har aldri ...", description: "Gått feil inn i et rom eller hu.", category: "jeg har aldri", needsPlayer: false),
    VorsetStarterCard(title: "Jeg har aldri ...", description: "Faket en grunn for å slippe en date", category: "jeg har aldri", needsPlayer: false),
    VorsetStarterCard(title: "Jeg har aldri ...", description: "Stalket noen på sosiale medier", category: "jeg har aldri", needsPlayer: false),
    VorsetStarterCard(title: "Jeg har aldri ...", description: "Mistet telefonen min på en fest", category: "jeg har aldri", needsPlayer: false),
    VorsetStarterCard(title: "Jeg har aldri ...", description: "Sendt en melding jeg angrer på", category: "jeg har aldri", needsPlayer: false),
    VorsetStarterCard(title: "Jeg har aldri ...", description: "Prøvd å imponere noen og failet helt", category: "jeg har aldri", needsPlayer: false),
    
    
    // MARK: Red flag, dealbreaker eller OK? (dark red)
    VorsetStarterCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din svarer ofte med 'k.' i meldinger", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    VorsetStarterCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din hater favorittfilmen din", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    VorsetStarterCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din er fortsatt venner med eksen", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    VorsetStarterCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din deler alt om forholdet deres på sosiale medier", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    VorsetStarterCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din har en tatovering av eksen sin", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    VorsetStarterCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din elsker karaoke – og insisterer på at du synger med", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    VorsetStarterCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din hater å danse", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    VorsetStarterCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din snakker kun om seg selv på date", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    VorsetStarterCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din pusher trekant med vennen/veninna", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    VorsetStarterCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din drikker hver helg", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    
    
    // MARK: Hot seat (red)
    VorsetStarterCard(title: "Hot seat", description: "{player} skal i hotseat! \n På rundgang skal de andre still spørmål du må svare helt ærlig på.\n samtidig starter noen en timer du ikke ser. Du skal svare på spørsmål og samtidig prøve \n å si STOPP når du tror det har gått 1 minutt. \n Per 5 sekund du er unna 1 minutt, må du drikke 2 slurker!", category: "hot seat", needsPlayer: true),
    VorsetStarterCard(title: "Hot seat", description: "{player} skal i hotseat! \n På rundgang skal de andre still spørmål du må svare helt ærlig på.\n samtidig starter noen en timer du ikke ser. Du skal svare på spørsmål og samtidig prøve \n å si STOPP når du tror det har gått 1 minutt. \n Per 5 sekund du er unna 1 minutt, må du drikke 2 slurker!", category: "hot seat", needsPlayer: true),
    VorsetStarterCard(title: "Hot seat", description: "{player} skal i hotseat! \n På rundgang skal de andre still spørmål du må svare helt ærlig på.\n samtidig starter noen en timer du ikke ser. Du skal svare på spørsmål og samtidig prøve \n å si STOPP når du tror det har gått 1 minutt. \n Per 5 sekund du er unna 1 minutt, må du drikke 2 slurker!", category: "hot seat", needsPlayer: true),
    VorsetStarterCard(title: "Hot seat", description: "{player} skal i hotseat! \n På rundgang skal de andre still spørmål du må svare helt ærlig på.\n samtidig starter noen en timer du ikke ser. Du skal svare på spørsmål og samtidig prøve \n å si STOPP når du tror det har gått 1 minutt. \n Per 5 sekund du er unna 1 minutt, må du drikke 2 slurker!", category: "hot seat", needsPlayer: true),
    VorsetStarterCard(title: "Hot seat", description: "{player} skal i hotseat! \n På rundgang skal de andre still spørmål du må svare helt ærlig på.\n samtidig starter noen en timer du ikke ser. Du skal svare på spørsmål og samtidig prøve \n å si STOPP når du tror det har gått 1 minutt. \n Per 5 sekund du er unna 1 minutt, må du drikke 2 slurker!", category: "hot seat", needsPlayer: true),
    
    
    // MARK: Er du stressa? (orange)
    VorsetStarterCard(title: "Er du stressa?", description: "{player} skal stresstestes! \n spilleren over for deg velger en kategori! \n Si så mange ting du kan innenfor kategorien innen 20 sekunder! \n minst 5 ting trengs \n klarer du det får du dele ut 5 slurker, feiler du drikker du 5 selv!", category: "er du stressa", needsPlayer: true),
    VorsetStarterCard(title: "Er du stressa?", description: "{player} skal stresstestes! \n spilleren over for deg velger en kategori! \n Si så mange ting du kan innenfor kategorien innen 20 sekunder! \n minst 5 ting trengs \n klarer du det får du dele ut 5 slurker, feiler du drikker du 5 selv!", category: "er du stressa", needsPlayer: true),
    VorsetStarterCard(title: "Er du stressa?", description: "{player} skal stresstestes! \n spilleren over for deg velger en kategori! \n Si så mange ting du kan innenfor kategorien innen 20 sekunder! \n minst 5 ting trengs \n klarer du det får du dele ut 5 slurker, feiler du drikker du 5 selv!", category: "er du stressa", needsPlayer: true),
    VorsetStarterCard(title: "Er du stressa?", description: "{player} skal stresstestes! \n spilleren over for deg velger en kategori! \n Si så mange ting du kan innenfor kategorien innen 20 sekunder! \n minst 5 ting trengs \n klarer du det får du dele ut 5 slurker, feiler du drikker du 5 selv!", category: "er du stressa", needsPlayer: true),
    VorsetStarterCard(title: "Er du stressa?", description: "{player} skal stresstestes! \n spilleren over for deg velger en kategori! \n Si så mange ting du kan innenfor kategorien innen 20 sekunder! \n minst 5 ting trengs \n klarer du det får du dele ut 5 slurker, feiler du drikker du 5 selv!", category: "er du stressa", needsPlayer: true),
    
    
    // MARK: hemmelig spørsmål (pink)
    VorsetStarterCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n Hvem i rommet ser best ut i kveld? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    VorsetStarterCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n Hvem i rommet må/kommer til å måtte betale barnebidrag? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    VorsetStarterCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n hvem i rommet Blir mest drita i kveld? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    VorsetStarterCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n hvem i rommet spyr på seg selv i kveld? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    VorsetStarterCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n Hvem i rommet lager best stemning? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    
    
    // MARK: Hva er oddsen ... (green)
    VorsetStarterCard(title: "Hva er oddsen ...", description: "{player}, Hva er oddsen for at du sender 'Jeg er håpløst forelska i deg...' \n til en rommet velger på snap?", category: "hva er oddsen", needsPlayer: true),
    VorsetStarterCard(title: "Hva er oddsen ...", description: "{player}, Hva er oddsen for at du chugger en ny, u-åpnet, enhet?", category: "hva er oddsen", needsPlayer: true),
    VorsetStarterCard(title: "Hva er oddsen ...", description: "{player}, Hva er oddsen for at du tar en shot her og nå?", category: "hva er oddsen", needsPlayer: true),
    VorsetStarterCard(title: "Hva er oddsen ...", description: "{player}, Hva er oddsen for at du går ut å prøver å få nummeret til den første jenta/gutten du ser?", category: "hva er oddsen", needsPlayer: true),
    VorsetStarterCard(title: "Hva er oddsen ...", description: "{player}, Hva er oddsen for at du tar av deg buksa?", category: "hva er oddsen", needsPlayer: true),
    
    
    // MARK: Historie (Orange)
    VorsetStarterCard(title: "Historie", description: "{player} skal lage en historie! Temaet er 'Samleie'! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    VorsetStarterCard(title: "Historie", description: "{player} skal lage en historie! Temaet er 'Vors'! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    VorsetStarterCard(title: "Historie", description: "{player} skal lage en historie! Temaet er 'Fylla'! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    VorsetStarterCard(title: "Historie", description: "{player} skal lage en historie! Temaet er 'Busstur til byen'! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    VorsetStarterCard(title: "Historie", description: "{player} skal lage en historie! Temaet er 'nach'! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    VorsetStarterCard(title: "Historie", description: "{player} skal lage en historie! Rommet finner på tema! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    VorsetStarterCard(title: "Historie", description: "{player} skal lage en historie! Rommet finner på tema! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    VorsetStarterCard(title: "Historie", description: "{player} skal lage en historie! Rommet finner på tema'! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    VorsetStarterCard(title: "Historie", description: "{player} skal lage en historie! Rommet finner på tema! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    VorsetStarterCard(title: "Historie", description: "{player} skal lage en historie! Rommet finner på tema! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    
    
    // MARK: Utfordring (purple)
    VorsetStarterCard(title: "Utfordring!", description: "Knyt et bind for øynene til {player} og still opp en annen i rommet. \n Hen skal føre seg frem til hvem det er. Hen har bare ett forsøk, klarer hen det ikke må hen drikke 6 slurker. \n hvis hen gjetter riktig ka hen dele ut tilsvarende!", category: "utfordring", needsPlayer: true),
    VorsetStarterCard(title: "Utfordring!", description: "{player} og de to til venstre for deg, gå sammen for å lage den mest kreative trekanten dere kan tenke dere! \n Hvis gruppa godkjenner deres kreativitet, kan dere dele ut 5 slurker hver!", category: "utfordring", needsPlayer: true),
    VorsetStarterCard(title: "Utfordring!", description: "{player}, fullfør setningen: Jeg har aldri...", category: "utfordring", needsPlayer: true),
    VorsetStarterCard(title: "Shot, Chug or text!", description: "{player}, send 'ville bare meddele at jeg har byttet kjørefil! du vet, spiller for andre laget;)' \n til sjefen eller en den motsatt for deg velger, ta en shot eller chug resten av enheten din!", category: "utfordring", needsPlayer: true),
    VorsetStarterCard(title: "Slap bets!", description: "{player} og den til venstre, gjør klar bitch slappen! \n Gjett når personen over bordet for dere sist hadde sex. Den som er nermest får slappe den andre!", category: "utfordring", needsPlayer: true),
    VorsetStarterCard(title: "Utfordring!", description: "{player}, immiter an av gutta i rommet,\n den første som gjetter hvem du er får dele ut 5 slurker!", category: "utfordring", needsPlayer: true),
    VorsetStarterCard(title: "Shot, Chug or text!", description: "{player}, send 'Våken?' til siste du lå med, ta en shot eller chug resten av enheten din!", category: "utfordring", needsPlayer: true),
    VorsetStarterCard(title: "Utfordring!", description: "{player}, åpne tinder og finn en recent match! \n Rommet bestemmer hva du skal skrive til vedkommende! \n Den som finner beste åpningen kan dele ut 5 slurker! \n har du ikke tinder drikker du 5 slurker selv!", category: "utfordring", needsPlayer: true),
    VorsetStarterCard(title: "Utfordring!", description: "Den første som klarer å legge en bokser på bordet kan dele ut 10 slurker!", category: "utfordring", needsPlayer: true),
    VorsetStarterCard(title: "Utfordring!", description: "Den første som chugger enheten sin får velge 2 stykker som må gjøre det samme!", category: "utfordring", needsPlayer: true),
    
    
    // MARK: ingen tittel (red)
    VorsetStarterCard(title: "Flammer!", description: "Drikk 1 slurk for hver person av det motsatte kjønn du har på topplisten på snap", category: "ingen tittel", needsPlayer: false),
    VorsetStarterCard(title: "Waterfall!", description: "{player} starter, alle begynner å drikke når hen gjør \n personen til venstre kan ikke stoppe før hen, fortsett til dere er kommet helt rundt!", category: "ingen tittel", needsPlayer: true),
    VorsetStarterCard(title: "", description: "Drikk 2 slurker hvis du har urinert på et sted man helst ikke burde!", category: "ingen tittel", needsPlayer: false),
    VorsetStarterCard(title: "", description: "{player}, velg din drikke tjommi og start partnerskapet med å drikke 6 slurker hver!", category: "ingen tittel", needsPlayer: true),
    VorsetStarterCard(title: "Roast!", description: "{player}, roast alle i rommet så bra du klarer på 1 min! \n Personen motsatt for deg rater roasten fra 1-10, del ut slurker basert på raten!", category: "ingen tittel", needsPlayer: true),
    VorsetStarterCard(title: "Tulletelefon!", description: "{player} skal kødderinge en person hen som sitter motsatt for deg velger på sin egen kontaktliste. \n prøv å lur personen, jo bedre du gjør det jo flere slurker kan du dele ut \n Hosten av vorset er dommer og velger hvor mange slurker du får dele ut!", category: "ingen tittel", needsPlayer: true),
    VorsetStarterCard(title: "Kronisk online!", description: "Alle som sitter på mobilen drikker 5 slurker! \n Logg dere på livet for faen!", category: "ingen tittel", needsPlayer: true),
    VorsetStarterCard(title: "Kjekseløp!", description: "{player} og personen over bordet skal delta i kjekseløpet! \n Led hodet bakover og legg en kjeks eller et annet rundt, flatt objekt på pannen. \n kun ved å bruke ansiksvegelser er det førstemann til å få kjeksen i munnen. \n Taperen drikker 5 slurker!", category: "utfordring", needsPlayer: true),
    VorsetStarterCard(title: "", description: "Alle som holder drikken i hånda tar en slurk. \n Dere var jo halvveis uansett! ", category: "utfordring", needsPlayer: true),
    VorsetStarterCard(title: "Alkiser!", description: "Alle som drikker noe over 18% tar en shot! \n Det er vel det sprit er til?!", category: "utfordring", needsPlayer: true),
    
]

// MARK: Title Card
struct VorsetStarterTitleCard: View {
    @State private var isTapped = false
    @State private var offsetY: CGFloat = -300
    
    var body: some View {
        ZStack {
            Text("Vorset Starter!")
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
