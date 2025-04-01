import SwiftUI

// MARK: - Vorset Starter Card Model
struct DamenesAftenCard: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let category: String
    let needsPlayer: Bool
}

// MARK: - Category Colors
let damenesAftenCategoryColors: [String: Color] = [
    "kategori": Color.pink,                  // Pink
    "pekelek": Color.purple,                 // Purple
    "regel": Color.blue,                      // Blue
    "regel opphevet": Color.blue,             // Blue (Same as "regel")
    "tommel opp/ned": Color.orange,           // Orange
    "jeg har aldri": Color.cyan,              // Light Blue
    "red flag, dealbreaker eller OK": Color.red, // Dark Red
    "hot seat": Color.red,                    // Red
    "er du stressa": Color.green,             // Green
    "hemmelig spørsmål": Color.purple,        // Purple
    "hva er oddsen": Color.teal,              // Teal
    "ingen tittel": Color.red,                // Red (Default for empty titles)
    "hva gjør du": Color.orange,
    "utfordring": Color.blue,
    "historie": Color.pink
]

// MARK: - Rule Pairing Logic
let pairedJenteneRules: [(DamenesAftenCard, DamenesAftenCard)] = [
    (
        DamenesAftenCard(title: "Hot Girl Rule!", description: "Fra nå av heter alle hverandres ekses navn. \n Hvis noen roper feil, må de drikke!", category: "regel", needsPlayer: true),
        DamenesAftenCard(title: "Hot Girl Summer er over!", description: "Dere kan gå tilbake til vanlige navn nå! Det ble for mye drama med {player} sin eks overalt 😂", category: "regel opphevet", needsPlayer: true)
    ),
    (
        DamenesAftenCard(title: "Silent Treatment!", description: "Alle ignorerer {player}. Ingen får svare på det hun sier!", category: "regel", needsPlayer: true),
        DamenesAftenCard(title: "Okay fine, vi tilgir deg!", description: "Dere kan snakke med {player} igjen, stakkars jente!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        DamenesAftenCard(title: "Forbudte ord!", description: "Det er ikke lov å si 'OMG' eller 'Girl'. Dette straffes med 2 slurker hver gang!", category: "regel", needsPlayer: true),
        DamenesAftenCard(title: "Omg, endelig!", description: "Dere kan si 'OMG' og 'Girl' igjen! Phew!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        DamenesAftenCard(title: "Regel, det er tid for!", description: "Fra nå av, må dere alle snakke som Kardashians. \n Hvis noen bryter karakter, drikk 6 slurker!", category: "regel", needsPlayer: true),
        DamenesAftenCard(title: "Kim, there's people that are dying!", description: "Dere kan nå snakke normalt igjen! Endelig.", category: "regel opphevet", needsPlayer: true)
    ),
    (
        DamenesAftenCard(title: "Glossy Lips!", description: "Hver gang du drikker, må du påføre lip gloss! \n Hvis du glemmer det, drikk 2 slurker ekstra!", category: "regel", needsPlayer: true),
        DamenesAftenCard(title: "Matte lips are back!", description: "Lip gloss-påbudet er over! Heldigvis.", category: "regel opphevet", needsPlayer: true)
    ),
    (
        DamenesAftenCard(title: "No Swearing!", description: "Ingen banning fra nå av! Hvis noen banner, drikker de 2 slurker.", category: "regel", needsPlayer: true),
        DamenesAftenCard(title: "Ugh, whatever!", description: "Fuck this shit, dere får banne igjen!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        DamenesAftenCard(title: "Doll Voice!", description: "Alle må snakke med søt babystemme. Hvis noen glemmer det? 2 slurker!", category: "regel", needsPlayer: true),
        DamenesAftenCard(title: "We're grown women!", description: "Dere får slutte med det baby-tullet nå!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        DamenesAftenCard(title: "Pose Before You Sip!", description: "Før du drikker, må du ta en selfie-pose. Hvis du ikke gjør det? 2 slurker!", category: "regel", needsPlayer: true),
        DamenesAftenCard(title: "No more posing!", description: "Dere kan drikke uten å posere igjen!", category: "regel opphevet", needsPlayer: true)
    ),
    (
        DamenesAftenCard(title: "Bachelorette Mode!", description: "{player} er kveldens bachelorette, alle må kalle henne 'queen'!", category: "regel", needsPlayer: true),
        DamenesAftenCard(title: "She got the rose!", description: "Queen-tittelen er over. Takk for en fin tid!", category: "regel opphevet", needsPlayer: true)
    ),
]

// MARK: - Vorset Starter Card Data
let damenesAftenCards: [DamenesAftenCard] = [
    
    // MARK: Kategori (dark blue)
    DamenesAftenCard(title: "Kategorien er ...", description: "Hunk-kjendiser, den som har crush på flest starter!", category: "kategori", needsPlayer: true),
    DamenesAftenCard(title: "Kategorien er ...", description: "De verste tingene du kan høre under sex, den modigste starter!", category: "kategori", needsPlayer: true),
    DamenesAftenCard(title: "Kategorien er ...", description: "Serier du kan binge en hel dag, personen med flest streamingabonnement starter!", category: "kategori", needsPlayer: true),
    DamenesAftenCard(title: "Kategorien er ...", description: "Ting jenter lyver om, den mest ærlige starter!", category: "kategori", needsPlayer: true),
    DamenesAftenCard(title: "Kategorien er ...", description: "Drikkeleker, den mest berusede starter!", category: "kategori", needsPlayer: true),
    DamenesAftenCard(title: "Kategorien er ...", description: "Moteikoner, den mest stylish starter", category: "kategori", needsPlayer: false),
    DamenesAftenCard(title: "Kategorien er ...", description: "Drinks & cocktails, den som sist kjøpte en drink starter", category: "kategori", needsPlayer: false),
    DamenesAftenCard(title: "Kategorien er ...", description: "Reality serier, den som har binget en serie sist starter", category: "kategori", needsPlayer: false),
    DamenesAftenCard(title: "Kategorien er ...", description: "Fordeler med å være kvinne, den eldste starter", category: "kategori", needsPlayer: false),
    DamenesAftenCard(title: "Kategorien er ...", description: "Ting kvinner generelt er bedre på enn menn, den mest konkurransedrevne starter", category: "kategori", needsPlayer: false),
        
    
    // MARK: Pekelek (green)
    DamenesAftenCard(title: "Pekelek", description: "Hvem er den største heartbreakeren?", category: "pekelek", needsPlayer: false),
    DamenesAftenCard(title: "Pekelek", description: "Hvem har flest skjulte talenter?", category: "pekelek", needsPlayer: false),
    DamenesAftenCard(title: "Pekelek", description: "Hvem er sannsynligst å gå tilbake til en toxic eks?", category: "pekelek", needsPlayer: false),
    DamenesAftenCard(title: "Pekelek", description: "Hvem bruker mest penger på unødvendige ting?", category: "pekelek", needsPlayer: false),
    DamenesAftenCard(title: "Pekelek", description: "Hvem hadde overlevd lengst i en zombieapokalypse?", category: "pekelek", needsPlayer: false),
    DamenesAftenCard(title: "Pekelek", description: "Hvem kommer til å gifte seg først?", category: "pekelek", needsPlayer: false),
    DamenesAftenCard(title: "Pekelek", description: "Hvem har den mest ubrukelige hobbyen?", category: "pekelek", needsPlayer: false),
    DamenesAftenCard(title: "Pekelek", description: "Hvem har høyest standarder når det gjelder dating?", category: "pekelek", needsPlayer: false),
    DamenesAftenCard(title: "Pekelek", description: "Hvem i rommet har vært i flest dårlige forhold?", category: "pekelek", needsPlayer: false),
    DamenesAftenCard(title: "Pekelek", description: "Hvem ville klart seg best i en reality-TV-serie?", category: "pekelek", needsPlayer: false),
    
    
    // MARK: Tommel opp/ned (dark green)
    DamenesAftenCard(title: "Tommel opp/ned", description: "Snoke gjennom telefonen til partneren din – akseptabelt eller ikke?", category: "tommel opp/ned", needsPlayer: false),
    DamenesAftenCard(title: "Tommel opp/ned", description: "Dra på ferie med eksen – greit eller fullstendig uaktuelt?", category: "tommel opp/ned", needsPlayer: false),
    DamenesAftenCard(title: "Tommel opp/ned", description: "Ha en sugar daddy – ville du gjort det om sjansen bød seg?", category: "tommel opp/ned", needsPlayer: false),
    DamenesAftenCard(title: "Tommel opp/ned", description: "Blokkere noen på sosiale medier etter én dårlig date – innafor eller ikke?", category: "tommel opp/ned", needsPlayer: false),
    DamenesAftenCard(title: "Tommel opp/ned", description: "Teste partnerens lojalitet med en fake konto – Innafor eller ikke?", category: "tommel opp/ned", needsPlayer: false),
    DamenesAftenCard(title: "Tommel opp/ned", description: "Ville du heller aldri kunne sminke deg igjen, eller aldri kunne bruke hårprodukter igjen?", category: "tommel opp/ned", needsPlayer: false),
    DamenesAftenCard(title: "Tommel opp/ned", description: "Skulle du ønske at alle kunne lese tankene dine, eller at du kunne lese andres tanker?", category: "tommel opp/ned", needsPlayer: false),
    DamenesAftenCard(title: "Tommel opp/ned", description: "Måtte gå med høye hæler hver dag resten av livet, eller aldri kunne bruke annet enn joggesko?", category: "tommel opp/ned", needsPlayer: false),
    DamenesAftenCard(title: "Tommel opp/ned", description: "Kunne aldri igjen spise sjokolade, eller aldri igjen drikke kaffe?", category: "tommel opp/ned", needsPlayer: false),
    DamenesAftenCard(title: "Tommel opp/ned", description: "Måtte sende en selfie uten sminke til eksen din hver morgen, eller alltid ha en dårlig hårdag?", category: "tommel opp/ned", needsPlayer: false),
        
    
    // MARK: Jeg har aldri (light blue)
    DamenesAftenCard(title: "Jeg har aldri ...", description: "Lagt ut en selfie kun for å få én spesifikk persons oppmerksomhet.", category: "jeg har aldri", needsPlayer: false),
    DamenesAftenCard(title: "Jeg har aldri ...", description: "Ghostet noen fordi de var for snille.", category: "jeg har aldri", needsPlayer: false),
    DamenesAftenCard(title: "Jeg har aldri ...", description: "Løyet om meg selv på en date.", category: "jeg har aldri", needsPlayer: false),
    DamenesAftenCard(title: "Jeg har aldri ...", description: "Gått tilbake til en eks jeg sa jeg var ferdig med.", category: "jeg har aldri", needsPlayer: false),
    DamenesAftenCard(title: "Jeg har aldri ...", description: "Faket en orgasme.", category: "jeg har aldri", needsPlayer: false),
    DamenesAftenCard(title: "Jeg har aldri ...", description: "Laget en fake konto for å stalke noen.", category: "jeg har aldri", needsPlayer: false),
    DamenesAftenCard(title: "Jeg har aldri ...", description: "Dømt noen basert på stjernetegnet deres.", category: "jeg har aldri", needsPlayer: false),
    DamenesAftenCard(title: "Jeg har aldri ...", description: "Gitt nummeret/snappen min til noen og blokkert dem etterpå.", category: "jeg har aldri", needsPlayer: false),
    DamenesAftenCard(title: "Jeg har aldri ...", description: "Løyet om hvorfor jeg ikke kunne møte noen, når jeg egentlig bare ville være alene.", category: "jeg har aldri", needsPlayer: false),
    DamenesAftenCard(title: "Jeg har aldri ...", description: "Stalket en eks eller en crush på sosiale medier i over en time.", category: "jeg har aldri", needsPlayer: false),
    
    
    // MARK: Red flag, dealbreaker eller OK? (dark red)
    DamenesAftenCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din følger eksen på Insta, men 'de er bare venner'.", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    DamenesAftenCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din vil at dere skal dele Snapchat-passord.", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    DamenesAftenCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din har fortsatt Tinder 'bare for moro skyld'.", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    DamenesAftenCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din snakker stygt om eksen sin hele tiden.", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    DamenesAftenCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din har daglig kontakt med eksen sin og sier de “bare er venner”.", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    DamenesAftenCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din vil ikke legge ut bilder av dere sammen på sosiale medier.", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    DamenesAftenCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din mener det er unødvendig å feire jubileer eller Valentinsdagen.", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    DamenesAftenCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din flørter åpenbart med andre, men sier det bare er for “moro”.", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    DamenesAftenCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din har aldri hatt en partner før deg.", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    DamenesAftenCard(title: "Red flag, dealbreaker eller OK?", description: "Partneren din følger og liker bilder av flere “Instagram-modeller” enn faktiske venner.", category: "red flag, dealbreaker eller OK", needsPlayer: false),
    
        
    // MARK: Hot seat (red)
    DamenesAftenCard(title: "Hot seat", description: "{player} skal i hotseat! \n På rundgang skal de andre still spørmål du må svare helt ærlig på.\n samtidig starter noen en timer du ikke ser. Du skal svare på spørsmål og samtidig prøve \n å si STOPP når du tror det har gått 1 minutt. \n Per 5 sekund du er unna 1 minutt, må du drikke 2 slurker!", category: "hot seat", needsPlayer: true),
    DamenesAftenCard(title: "Hot seat", description: "{player} skal i hotseat! \n På rundgang skal de andre still spørmål du må svare helt ærlig på.\n samtidig starter noen en timer du ikke ser. Du skal svare på spørsmål og samtidig prøve \n å si STOPP når du tror det har gått 1 minutt. \n Per 5 sekund du er unna 1 minutt, må du drikke 2 slurker!", category: "hot seat", needsPlayer: true),
    DamenesAftenCard(title: "Hot seat", description: "{player} skal i hotseat! \n På rundgang skal de andre still spørmål du må svare helt ærlig på.\n samtidig starter noen en timer du ikke ser. Du skal svare på spørsmål og samtidig prøve \n å si STOPP når du tror det har gått 1 minutt. \n Per 5 sekund du er unna 1 minutt, må du drikke 2 slurker!", category: "hot seat", needsPlayer: true),
    DamenesAftenCard(title: "Hot seat", description: "{player} skal i hotseat! \n På rundgang skal de andre still spørmål du må svare helt ærlig på.\n samtidig starter noen en timer du ikke ser. Du skal svare på spørsmål og samtidig prøve \n å si STOPP når du tror det har gått 1 minutt. \n Per 5 sekund du er unna 1 minutt, må du drikke 2 slurker!", category: "hot seat", needsPlayer: true),
    DamenesAftenCard(title: "Hot seat", description: "{player} skal i hotseat! \n På rundgang skal de andre still spørmål du må svare helt ærlig på.\n samtidig starter noen en timer du ikke ser. Du skal svare på spørsmål og samtidig prøve \n å si STOPP når du tror det har gått 1 minutt. \n Per 5 sekund du er unna 1 minutt, må du drikke 2 slurker!", category: "hot seat", needsPlayer: true),
    
    // MARK: Er du stressa? (orange)
    DamenesAftenCard(title: "Er du stressa?", description: "{player} skal stresstestes! \n spilleren over for deg velger en kategori! \n Si så mange ting du kan innenfor kategorien innen 20 sekunder! \n minst 5 ting trengs!", category: "er du stressa", needsPlayer: false),
    DamenesAftenCard(title: "Er du stressa?", description: "{player} skal stresstestes! \n spilleren over for deg velger en kategori! \n Si så mange ting du kan innenfor kategorien innen 20 sekunder! \n minst 5 ting trengs!", category: "er du stressa", needsPlayer: false),
    DamenesAftenCard(title: "Er du stressa?", description: "{player} skal stresstestes! \n spilleren over for deg velger en kategori! \n Si så mange ting du kan innenfor kategorien innen 20 sekunder! \n minst 5 ting trengs!", category: "er du stressa", needsPlayer: false),
    DamenesAftenCard(title: "Er du stressa?", description: "{player} skal stresstestes! \n spilleren over for deg velger en kategori! \n Si så mange ting du kan innenfor kategorien innen 20 sekunder! \n minst 5 ting trengs!", category: "er du stressa", needsPlayer: false),
    DamenesAftenCard(title: "Er du stressa?", description: "{player} skal stresstestes! \n spilleren over for deg velger en kategori! \n Si så mange ting du kan innenfor kategorien innen 20 sekunder! \n minst 5 ting trengs!", category: "er du stressa", needsPlayer: false),
    
    
    // MARK: hemmelig spørsmål (pink)
    DamenesAftenCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n Hvem av jentene ville du hatt med i en trekant? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    DamenesAftenCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n Hvem av jentene kunne vært utro? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    DamenesAftenCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n Hvem av jentene har hatt seg mest? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    DamenesAftenCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n Hvem av jentene ville du hatt med i en trekant? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    DamenesAftenCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n Hvem av jentene er den værste flørteren? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    DamenesAftenCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n Hvem av jentene Hadde du stolt minst på rundt typen? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    DamenesAftenCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n Hvem av jentene har den kleineste sex-historien? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    DamenesAftenCard(title: "Hemmelig spørsmål!", description: "Bare {player} kan vite spørmålet! \n Hvem av jentene ville du helst kysset om du måtte velge en? \n Personen må være i rommet! Du må deretter si navnet på personen høyt! \n Personer som ønsker å vite spørmålet må ta en shot eller chugge en helt ny enhet! ", category: "hemmelig spørsmål", needsPlayer: true),
    
        
    // MARK: Hva er oddsen ... (green)
    DamenesAftenCard(title: "Hva er oddsen ...", description: "{player}, hva er oddsen for at du sender en snap til eksen din og sier 'savner deg litt i kveld...' ?", category: "hva er oddsen", needsPlayer: true),
    DamenesAftenCard(title: "Hva er oddsen ...", description: "{player}, hva er oddsen for at du legger ut en cringe status på Facebook?", category: "hva er oddsen", needsPlayer: true),
    DamenesAftenCard(title: "Hva er oddsen ...", description: "{player}, hva er oddsen for at du lar de andre i rommet sende en melding til en fyr i DM-ene dine – uten at du får lese den først?", category: "hva er oddsen", needsPlayer: true),
    DamenesAftenCard(title: "Hva er oddsen ...", description: "{player}, hva er oddsen for at du poster en selfie på Insta-story akkurat NÅ – uten filter og uten caption?", category: "hva er oddsen", needsPlayer: true),
    DamenesAftenCard(title: "Hva er oddsen ...", description: "{player}, hva er oddsen for at du lar de andre i rommet velge en ny Tinder-bio for deg – og du må ha den i én uke?", category: "hva er oddsen", needsPlayer: true),
        
    
    // MARK: Historie
    DamenesAftenCard(title: "Historie", description: "{player} skal lage en historie! Temaet er 'Samleie'! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    DamenesAftenCard(title: "Historie", description: "{player} skal lage en historie! Temaet er 'dårlig date'! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    DamenesAftenCard(title: "Historie", description: "{player} skal lage en historie! Temaet er 'One night stand'! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    DamenesAftenCard(title: "Historie", description: "{player} skal lage en historie! Temaet er 'Fylla'! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    DamenesAftenCard(title: "Historie", description: "{player} skal lage en historie! Temaet er 'Ferie flørt'! \n Lag en historie utifra temaet med deg selv som hovedperson! \n De andre i rommet skal rate historien din fra 1-10! \n slurker basert på rating!", category: "historie", needsPlayer: true),
    
    
    // MARK: ingen tittel (red)
    DamenesAftenCard(title: "Flammer", description: "Drikk 1 slurk for hver person av det motsatte kjønn du har på topplisten på snap.", category: "ingen tittel", needsPlayer: false),
    DamenesAftenCard(title: "", description: "Alle drikker 3 slurker for hver eks som fortsatt ser på storyen deres!", category: "ingen tittel", needsPlayer: false),
    DamenesAftenCard(title: "Waterfall!", description: "{player} starter å drikke. Når hun begynner, må alle drikke. Den til venstre kan ikke stoppe før {player} stopper, og så videre!", category: "ingen tittel", needsPlayer: false),
    DamenesAftenCard(title: "Kronisk Online!", description: "Alle som sitter på mobilen nå drikker 5 slurker! Logg på livet a, Jenter!", category: "ingen tittel", needsPlayer: false),
    DamenesAftenCard(title: "Roast!", description: "{player}, roast jentene rundt bordet så godt du kan på 1 minutt! De andre gir deg en rating fra 1-10, og du deler ut tilsvarende slurker!", category: "ingen tittel", needsPlayer: false),
    DamenesAftenCard(title: "Kleint!", description: "Alle som noen gang har sendt en “Våken?”-melding etter midnatt, drikker 3 slurker!", category: "ingen tittel", needsPlayer: false),
    DamenesAftenCard(title: "GirlCode!", description: "Har du noen gang datet en venninnes eks? Drikk 3 slurker og fortell hvem!", category: "ingen tittel", needsPlayer: false),
    DamenesAftenCard(title: "Vinkveld?", description: "Alle som drikker noe over 12% akkurat nå må ta 3 ekstra slurker!", category: "ingen tittel", needsPlayer: false),
    DamenesAftenCard(title: "TikTok-addict!", description: "Hvis du har brukt over 3 timer på TikTok i dag, drikk 3 slurker!", category: "ingen tittel", needsPlayer: false),
    DamenesAftenCard(title: "Single Ladies!", description: "Alle som er single tar en skål sammen og drikker 2 slurker! Har du kjæreste? Da drikker du for at du slipper datinglivet!", category: "ingen tittel", needsPlayer: false),
    DamenesAftenCard(title: "", description: "Alle drikker én slurk for hver ekskjæreste de har hatt!", category: "ingen tittel", needsPlayer: false),
]

// MARK: Title Card
struct DamenesAftenTitleCard: View {
    @State private var isTapped = false
    @State private var offsetY: CGFloat = -300
    
    var body: some View {
        ZStack {
            Text("Damenes Aften!")
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
