//
//  AllInGuttaCard.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 07/03/2025.
//


import SwiftUI

// MARK: - Vorset Starter Card Model
struct AllInGuttaCard: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let category: String
    let needsPlayer: Bool
}

// MARK: - Category Colors
let allInGuttaCategoryColors: [String: Color] = [
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
let pairedRules: [(AllInGuttaCard, AllInGuttaCard)] = [
    (
        AllInGuttaCard(title: "Fuckboy!", description: "Fra nå av heter man navnet på noen man har hooket med. \n man kan altså ha flere navn \n Hvis noen kaller deg feil navn må de drikke!", category: "regel", needsPlayer: true),
        AllInGuttaCard(title: "Fuckboys er cancelled!", description: "Dere kan gå tilbake til vanlige navn nå! Det ble ekstremt vanskelig å følge med på {player} heter gitt alle han har vært på 😏", category: "regel opphevet", needsPlayer: true)
    ),
    (
        AllInGuttaCard(title: "Hørte dere noe?", description: "Alle ignorerer {player}... Det er ikke lov å verken snakke med eller se på han.", category: "regel", needsPlayer: true),
        AllInGuttaCard(title: "Åja, det var du!", description: "Dere kan få snakke med gutten igjen, stakkars liten", category: "regel opphevet", needsPlayer: true)
    ),
    (
        AllInGuttaCard(title: "Forbudte ord!", description: "Ikke lov å si ja/nei, dette straffes med 2 slurker hver gang!", category: "regel", needsPlayer: true),
        AllInGuttaCard(title: "Ja, det går fint nå!", description: "Dere skal få si ja og nei igjen nå!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        AllInGuttaCard(title: "Regel, det er tid for!", description: "Fra nå av, dere som Yoda alle må snakke. \n Hvis som yoda du ikke snakker, drikke 6 slurker du må!", category: "regel", needsPlayer: true),
        AllInGuttaCard(title: "Ferdig regelen er!", description: "Dere kan nå slippe å snakke som yoda!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        AllInGuttaCard(title: "Runke Mesterne!", description: "Hver gang du drikker, må du ta en liten oppvisningrunk! \n Dersom du ikke gjør det drikker 2 slurker til! \n husk runken!", category: "regel", needsPlayer: true),
        AllInGuttaCard(title: "Legg vekk kølla!", description: "Dere kan nå slippe å gjøre en oppvisningsrunk!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        AllInGuttaCard(title: "Vask munnen!", description: "Det er ikke lenger lov å banne \n dette straffes med 2 slurker", category: "regel", needsPlayer: true),
        AllInGuttaCard(title: "Er det jentefors?!", description: "Fyfaen, dette ble jævlig kjedelig \n det er faen meg lov å banne igjen for helvete!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        AllInGuttaCard(title: "Baby!", description: "Dere må nå alle snakke med baby-stemme \n straffen er 2 slurker om dette ikke blir gjort", category: "regel", needsPlayer: true),
        AllInGuttaCard(title: "Babyen er voksen igjen!", description: "Voks opp a gutta! Slutt med det baby tullet!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        AllInGuttaCard(title: "DAB!", description: "Det er nå obligatorisk å hitte en feit dab før du drikker \n straffen er 2 slurker om dette ikke blir gjort!", category: "regel", needsPlayer: true),
        AllInGuttaCard(title: "Litt cringe kanskje?", description: "Dab var inn i 2018 gutta \n Følg med da!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        AllInGuttaCard(title: "Schall!", description: "Det er nå pålagt å rope 'schall!', som admiral von schneider, før man drikker! \n straffen er 2 slurker om dette ikke blir gjort", category: "regel", needsPlayer: true),
        AllInGuttaCard(title: "Schall ferdig!", description: "Det er ikke lenger pålagt å rope 'schall!'. \n men dere må gjerne fortsette!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        AllInGuttaCard(title: "Deres høyhet?", description: "{player} er nå kongen, han må derfor omtales som 'Deres majestet' \n straffen er 2 slurker om dette ikke blir gjort!", category: "regel", needsPlayer: true),
        AllInGuttaCard(title: "Borg Høyby?", description: "Det viste seg at det bare var marius som var på besøk \n Slutt med det 'deres majestet' tullet!", category: "regel opphevet", needsPlayer: true)
    )
]

// MARK: - All in gutta Card Data
let allInGuttaCards: [AllInGuttaCard] = [
    
    // MARK: Kategori (dark blue)
    AllInGuttaCard(title: "Kategorien er ...", description: "Idrettsstjerner, {player} starter", category: "kategori", needsPlayer: true),
    AllInGuttaCard(title: "Kategorien er ...", description: "det kleineste som kan skje på en date, {player} starter", category: "kategori", needsPlayer: true),
    AllInGuttaCard(title: "Kategorien er ...", description: "U- land, {player} starter", category: "kategori", needsPlayer: true),
    AllInGuttaCard(title: "Kategorien er ...", description: "Pornostjerner, {player} starter", category: "kategori", needsPlayer: true),
    AllInGuttaCard(title: "Kategorien er ...", description: "U- land, {player} starter", category: "kategori", needsPlayer: true),
    AllInGuttaCard(title: "Kategorien er ...", description: "synonymer for runking, {player} starter", category: "kategori", needsPlayer: true),
    AllInGuttaCard(title: "Kategorien er ...", description: "synonymer for pupper, {player} starter", category: "kategori", needsPlayer: true),
    AllInGuttaCard(title: "Kategorien er ...", description: "ølmerker, {player} starter", category: "kategori", needsPlayer: true),
    AllInGuttaCard(title: "Kategorien er ...", description: "Fordeler med å være gutt, {player} starter", category: "kategori", needsPlayer: true),
    AllInGuttaCard(title: "Kategorien er ...", description: "Frivillig kategori! {player} velger og starter", category: "kategori", needsPlayer: true),
    
    
    // MARK: Pekelek (green)
    AllInGuttaCard(title: "Pekelek!", description: "Hvem av gutta har mest flaks?", category: "pekelek", needsPlayer: false),
    AllInGuttaCard(title: "Pekelek!", description: "Hvem er mest hang i morgen?", category: "pekelek", needsPlayer: false),
    AllInGuttaCard(title: "Pekelek!", description: "Hvem tar med gutta på eventyr?", category: "pekelek", needsPlayer: false),
    AllInGuttaCard(title: "Pekelek!", description: "Hvem av guttas søster er finest?", category: "pekelek", needsPlayer: false),
    AllInGuttaCard(title: "Pekelek!", description: "Hvem stalker fremdeles eksen?", category: "pekelek", needsPlayer: false),
    AllInGuttaCard(title: "Pekelek!", description: "Hvem av gutta har størst pakke?", category: "pekelek", needsPlayer: false),
    AllInGuttaCard(title: "Pekelek!", description: "Hvem bruker mest tid på jobb og skole, uten å arbeide?", category: "pekelek", needsPlayer: false),
    AllInGuttaCard(title: "Pekelek!", description: "Hvem av gutta lager mest lyd i senga?", category: "pekelek", needsPlayer: false),
    AllInGuttaCard(title: "Pekelek!", description: "Hvem av gutta får den ikke opp i kveld?", category: "pekelek", needsPlayer: false),
    AllInGuttaCard(title: "Pekelek!", description: "Hvem har det kjedeligste navnet?", category: "pekelek", needsPlayer: false),
    
    
    // MARK: Tommel opp/ned / Hva gjør du? (dark green)
    AllInGuttaCard(title: "Tommel opp/ned", description: "Tits eller ass?", category: "tommel opp/ned", needsPlayer: false),
    AllInGuttaCard(title: "Tommel opp/ned", description: "Bli satt på prykiatrisk helt til du kan bevise at du er ved dine fulle fem, \n eller poste 10 tiktoks daglig der du driter deg ut?", category: "tommel opp/ned", needsPlayer: false),
    AllInGuttaCard(title: "Tommel opp/ned", description: "En pils med gutta, eller 10 pils med bare chicks?", category: "tommel opp/ned", needsPlayer: false),
    AllInGuttaCard(title: "Tommel opp/ned", description: "Bli sugd av ei bikkje, eller suge bikkja? Stemm samtidig, tapergruppa drikker 5 hver!", category: "tommel opp/ned", needsPlayer: false),
    AllInGuttaCard(title: "Tommel opp/ned", description: "OnlyFans! \n Akseptert å betale litt her og der?", category: "tommel opp/ned", needsPlayer: false),
    AllInGuttaCard(title: "Tommel opp/ned", description: "Galtwort eller Padawan? ", category: "tommel opp/ned", needsPlayer: false),
    AllInGuttaCard(title: "Tommel opp/ned", description: "Jenta du har crushet på siden barneskolen lager OnlyFans. \n kryper du til korset og betaler?", category: "tommel opp/ned", needsPlayer: false),
    AllInGuttaCard(title: "Hva gjør du?", description: "Helevete bryter løs, tredje verdenskrig er realitet og russerne innvaderer. \n Du får valget om å verve deg til frontlinjen eller være hjelpepleier på et trygt sykehus, hva gjør du! \n Stem med tommel opp eller ned!", category: "tommel opp/ned", needsPlayer: false),
    AllInGuttaCard(title: "Hva gjør du?", description: "Se for deg at du ligger i en seng med mor og far. \n Far har kølla 2 cm inni deg, du har pikker 2 cm inni mor. \n Går du 2cm frem eller tilbake for å komme deg ut av situasjonen? \n Stem med tommel opp eller ned!", category: "tommel opp/ned", needsPlayer: false),
    AllInGuttaCard(title: "Hva gjør du?", description: "Sekundet gutta ankommer byen sier dama at hus vil hjem. \n Scorer du kjæreste poeng? eller blir du igjen og danser natta lang? \n stem med tommel opp/ned!", category: "tommel opp/ned", needsPlayer: false),
    
    
    // MARK: Jeg har aldri (light blue)
    AllInGuttaCard(title: "Jeg har aldri ...", description: "Kjøpt smulgersprit", category: "jeg har aldri", needsPlayer: false),
    AllInGuttaCard(title: "Jeg har aldri ...", description: "Angret på en tatovering", category: "jeg har aldri", needsPlayer: false),
    AllInGuttaCard(title: "Jeg har aldri ...", description: "Stoppet opp under sex fordi dama queffet", category: "jeg har aldri", needsPlayer: false),
    AllInGuttaCard(title: "Jeg har aldri ...", description: "Blitt skutt av en paintball", category: "jeg har aldri", needsPlayer: false),
    AllInGuttaCard(title: "Jeg har aldri ...", description: "Grått til rørende Got Talent-videoer på Youtube", category: "jeg har aldri", needsPlayer: false),
    AllInGuttaCard(title: "Jeg har aldri ...", description: "Ligget med to eller flere ila et døgn", category: "jeg har aldri", needsPlayer: false),
    AllInGuttaCard(title: "Jeg har aldri ...", description: "Hooket med samme chick som en kompis, på samme kveld", category: "jeg har aldri", needsPlayer: false),
    AllInGuttaCard(title: "Jeg har aldri ...", description: "Spist mat under sex", category: "jeg har aldri", needsPlayer: false),
    AllInGuttaCard(title: "Jeg har aldri ...", description: "Kjøpt en hore", category: "jeg har aldri", needsPlayer: false),
    AllInGuttaCard(title: "Jeg har aldri ...", description: "Tatovert en klisje quote", category: "jeg har aldri", needsPlayer: false),
    
    
    // MARK: Red flag, dealbreaker eller OK? (dark red)
    AllInGuttaCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din bruker ikke prevensjon fordi hun 'Kjenner når hun kan bli gravid og ikke', {player} starter!", category: "red flag, dealbreaker eller OK", needsPlayer: true),
    AllInGuttaCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren dil vi kun ha sex 2 ganger i måneden, {player} starter!", category: "red flag, dealbreaker eller OK", needsPlayer: true),
    AllInGuttaCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din veier mer enn deg, {player} starter!", category: "red flag, dealbreaker eller OK", needsPlayer: true),
    AllInGuttaCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din har en irrasjonell frykt for alle typer vann, {player} starter!", category: "red flag, dealbreaker eller OK", needsPlayer: true),
    AllInGuttaCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din er høyere enn deg, {player} starter!", category: "red flag, dealbreaker eller OK", needsPlayer: true),
    AllInGuttaCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din mener selv hun ikke er attraktiv, {player} starter!", category: "red flag, dealbreaker eller OK", needsPlayer: true),
    AllInGuttaCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din bruker bestemor-truser, {player} starter!", category: "red flag, dealbreaker eller OK", needsPlayer: true),
    AllInGuttaCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din sender ikke nudes eller dirty texts, {player} starter!", category: "red flag, dealbreaker eller OK", needsPlayer: true),
    AllInGuttaCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din har bare guttevenner, {player} starter!", category: "red flag, dealbreaker eller OK", needsPlayer: true),
    AllInGuttaCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din har ligget med faren din, {player} starter!", category: "red flag, dealbreaker eller OK", needsPlayer: true),
    
    
    // MARK: Hot seat (red)
    AllInGuttaCard(title: "Hot seat", description: "{player} skal i hotseat! \n På rundgang skal de andre still spørmål du må svare helt ærlig på.\n samtidig starter noen en timer du ikke ser. Du skal svare på spørsmål og samtidig prøve \n å si STOPP når du tror det har gått 1 minutt. \n Per 5 sekund du er unna 1 minutt, må du drikke 2 slurker!", category: "hot seat", needsPlayer: true),
    AllInGuttaCard(title: "Hot seat", description: "{player} skal i hotseat! \n På rundgang skal de andre still spørmål du må svare helt ærlig på.\n samtidig starter noen en timer du ikke ser. Du skal svare på spørsmål og samtidig prøve \n å si STOPP når du tror det har gått 1 minutt. \n Per 5 sekund du er unna 1 minutt, må du drikke 2 slurker!", category: "hot seat", needsPlayer: true),
    AllInGuttaCard(title: "Hot seat", description: "{player} skal i hotseat! \n På rundgang skal de andre still spørmål du må svare helt ærlig på.\n samtidig starter noen en timer du ikke ser. Du skal svare på spørsmål og samtidig prøve \n å si STOPP når du tror det har gått 1 minutt. \n Per 5 sekund du er unna 1 minutt, må du drikke 2 slurker!", category: "hot seat", needsPlayer: true),
    AllInGuttaCard(title: "Hot seat", description: "{player} skal i hotseat! \n På rundgang skal de andre still spørmål du må svare helt ærlig på.\n samtidig starter noen en timer du ikke ser. Du skal svare på spørsmål og samtidig prøve \n å si STOPP når du tror det har gått 1 minutt. \n Per 5 sekund du er unna 1 minutt, må du drikke 2 slurker!", category: "hot seat", needsPlayer: true),
    AllInGuttaCard(title: "Hot seat", description: "{player} skal i hotseat! \n På rundgang skal de andre still spørmål du må svare helt ærlig på.\n samtidig starter noen en timer du ikke ser. Du skal svare på spørsmål og samtidig prøve \n å si STOPP når du tror det har gått 1 minutt. \n Per 5 sekund du er unna 1 minutt, må du drikke 2 slurker!", category: "hot seat", needsPlayer: true),
    AllInGuttaCard(title: "Hot seat", description: "{player} skal i hotseat! \n På rundgang skal de andre still spørmål du må svare helt ærlig på.\n samtidig starter noen en timer du ikke ser. Du skal svare på spørsmål og samtidig prøve \n å si STOPP når du tror det har gått 1 minutt. \n Per 5 sekund du er unna 1 minutt, må du drikke 2 slurker!", category: "hot seat", needsPlayer: true),
    
    
    // MARK: Er du stressa? (orange)
    AllInGuttaCard(title: "Er du stressa?", description: "{player} skal stresstestes! \n spilleren over for deg velger en kategori! \n Si så mange ting du kan innenfor kategorien innen 20 sekunder! \n minst 5 ting trengs!", category: "er du stressa", needsPlayer: false),
    AllInGuttaCard(title: "Er du stressa?", description: "{player} skal stresstestes! \n spilleren over for deg velger en kategori! \n Si så mange ting du kan innenfor kategorien innen 20 sekunder! \n minst 5 ting trengs!", category: "er du stressa", needsPlayer: false),
    AllInGuttaCard(title: "Er du stressa?", description: "{player} skal stresstestes! \n spilleren over for deg velger en kategori! \n Si så mange ting du kan innenfor kategorien innen 20 sekunder! \n minst 5 ting trengs!", category: "er du stressa", needsPlayer: false),
    AllInGuttaCard(title: "Er du stressa?", description: "{player} skal stresstestes! \n spilleren over for deg velger en kategori! \n Si så mange ting du kan innenfor kategorien innen 20 sekunder! \n minst 5 ting trengs!", category: "er du stressa", needsPlayer: false),
    AllInGuttaCard(title: "Er du stressa?", description: "{player} skal stresstestes! \n spilleren over for deg velger en kategori! \n Si så mange ting du kan innenfor kategorien innen 20 sekunder! \n minst 5 ting trengs!", category: "er du stressa", needsPlayer: false),
    
    
    // MARK: hemmelig spørsmål (pink)
    AllInGuttaCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n Hvem av gutta ville du hatt med i en trekant? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    AllInGuttaCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n Hvem av gutta ser best ut i kveld? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    AllInGuttaCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n Hvem av gutta ser værst ut i kveld? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    AllInGuttaCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n Hvem av gutta ender i en grøft i kveld? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    AllInGuttaCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n Hvem av gutta spyr på seg selv i kveld? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    
    
    // MARK: Hva er oddsen ... (green)
    AllInGuttaCard(title: "Hva er oddsen ...", description: "{player}, Hva er oddsen for at du sender 'Jeg er håpløst forelska i deg...' \n til en gutta velger på snap?", category: "hva er oddsen", needsPlayer: true),
    AllInGuttaCard(title: "Hva er oddsen ...", description: "{player}, Hva er oddsen for at du chugger en ny, u-åpnet, enhet?", category: "hva er oddsen", needsPlayer: true),
    AllInGuttaCard(title: "Hva er oddsen ...", description: "{player}, Hva er oddsen for at du tar en shot her og nå?", category: "hva er oddsen", needsPlayer: true),
    AllInGuttaCard(title: "Hva er oddsen ...", description: "{player}, Hva er oddsen for at du går ut å prøver å få nummeret til den første jenta du ser?", category: "hva er oddsen", needsPlayer: true),
    AllInGuttaCard(title: "Hva er oddsen ...", description: "{player}, Hva er oddsen for at du tar av deg buksa?", category: "hva er oddsen", needsPlayer: true),
    
    
    // MARK: Utfordring (purple)
    AllInGuttaCard(title: "Utfordring!", description: "Knyt et bind for øynene til {player} og still opp en av gutta. \n Han skal føre seg frem til hvem det er. Han har bare ett forsøk, klarer han det ikke må han drikke 6 slurker. \n hvis han gjetter riktig ka han dele ut tilsvarende!", category: "utfordring", needsPlayer: true),
    AllInGuttaCard(title: "Utfordring!", description: "{player} og de to til venstre for deg, gå sammen for å lage den mest kreative trekanten dere kan tenke dere! \n Hvis gruppa godkjenner deres kreativitet, kan dere dele ut 5 slurker hver!", category: "utfordring", needsPlayer: true),
    AllInGuttaCard(title: "Utfordring!", description: "{player}, fullfør setningen: Jeg har aldri...", category: "utfordring", needsPlayer: true),
    AllInGuttaCard(title: "Shot, Chug or text!", description: "{player}, send 'ville bare meddele at jeg har byttet kjørefil! du vet, spiller for andre laget;)' \n til sjefen eller en den motsatt for deg velger, ta en shot eller chug resten av enheten din!", category: "utfordring", needsPlayer: true),
    AllInGuttaCard(title: "Slap bets!", description: "{player} og han til venstre, gjør klar bitch slappen! \n Gjett når personen over bordet for dere sist hadde sex. Den som er nermest får slappe den andre!", category: "utfordring", needsPlayer: true),
    AllInGuttaCard(title: "Utfordring!", description: "{player}, immiter an av gutta i rommet,\n den første som gjetter hvem du er får dele ut 5 slurker!", category: "utfordring", needsPlayer: true),
    AllInGuttaCard(title: "Shot, Chug or text!", description: "{player}, send 'Våken?' til siste du lå med, ta en shot eller chug resten av enheten din!", category: "utfordring", needsPlayer: true),
    AllInGuttaCard(title: "Shot, Chug or text!", description: "{player}, send 'trenger en til å avgjøre en diskusjon, er jeg helt gal hvis jeg kjører etter 4 pils? Er en smuuuuud dame som vil at jek skal kommer over' til den fjerde siste du ringte, ta en shot eller chug resten av enheten din!", category: "utfordring", needsPlayer: true),
    AllInGuttaCard(title: "Utfordring!", description: "{player}, åpne tinder og finn en recent match! /n Gutta bestemmer hva du skal skrive til chicken! \n Den som finner beste åpningen kan dele ut 5 slurker!", category: "utfordring", needsPlayer: true),
    AllInGuttaCard(title: "Utfordring!", description: "Den første som klarer å legge en bokser på bordet kan dele ut 10 slurker!", category: "utfordring", needsPlayer: true),
    
    
    // MARK: Historie (Orange)
    AllInGuttaCard(title: "Historie", description: "{player} skal lage en historie! Temaet er 'Samleie'! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    AllInGuttaCard(title: "Historie", description: "{player} skal lage en historie! Temaet er 'Vors'! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    AllInGuttaCard(title: "Historie", description: "{player} skal lage en historie! Temaet er 'Fylla'! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    AllInGuttaCard(title: "Historie", description: "{player} skal lage en historie! Temaet er 'Bussturen til byen'! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    AllInGuttaCard(title: "Historie", description: "{player} skal lage en historie! Temaet er 'Nach'! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    
    
    // MARK: ingen tittel (red)
    AllInGuttaCard(title: "Flammer!", description: "Drikk 1 slurk for hver dame du har på topplisten på snap!", category: "ingen tittel", needsPlayer: false),
    AllInGuttaCard(title: "Waterfall!", description: "{player} starter, alle begynner å drikke når han gjør \n personen til venstre kan ikke stoppe før han, fortsett til dere er kommet helt rundt!", category: "ingen tittel", needsPlayer: true),
    AllInGuttaCard(title: "", description: "Drikk 2 slurker hvis du har urinert på et sted man helst ikke burde!", category: "ingen tittel", needsPlayer: false),
    AllInGuttaCard(title: "", description: "{player}, velg din drikke tjommi og start partnerskapet med å drikke 6 slurker hver!", category: "ingen tittel", needsPlayer: true),
    AllInGuttaCard(title: "Roast!", description: "{player}, roast gutta så bra du klarer på 1 min! \n Personen motsatt for deg rater roasten fra 1-10, del ut slurker basert på raten!", category: "ingen tittel", needsPlayer: true),
    AllInGuttaCard(title: "Tulletelefon!", description: "{player} skal kødderinge en person han som sitter motsatt for deg velger på sin egen kontaktliste. \n prøv å lur personen, jo bedre du gjør det jo flere slurker kan du dele ut \n Hosten av vorset er dommer og velger hvor mange slurker du får dele ut!", category: "ingen tittel", needsPlayer: true),
    AllInGuttaCard(title: "Kronisk online!", description: "Alle gutta som sitter på mobilen drikker 5 slurker! \n Logg dere på livet for faen!", category: "ingen tittel", needsPlayer: true),
    AllInGuttaCard(title: "Kjekseløp!", description: "{player} og han over bordet skal delta i kjekseløpet! \n Led hodet bakover og legg en kjeks eller et annet rundt, flatt objekt på pannen. \n kun ved å bruke ansiksvegelser er det førstemann til å få kjeksen i munnen. \n Taperen drikker 5 slurker!", category: "utfordring", needsPlayer: true),
    AllInGuttaCard(title: "", description: "Alle gutta som holder drikken i hånda tar en slurk. \n Dere var jo halvveis uansett! ", category: "utfordring", needsPlayer: true),
    AllInGuttaCard(title: "Alkiser!", description: "Alle som drikker noe over 18% tar en shot! \n Det er vel det sprit er til?!", category: "utfordring", needsPlayer: true),
]

// MARK: Title Card
struct AllInGuttaTitleCard: View {
    @State private var isTapped = false
    @State private var offsetY: CGFloat = -300
    
    var body: some View {
        ZStack {
            Text("All-In gutta!")
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
