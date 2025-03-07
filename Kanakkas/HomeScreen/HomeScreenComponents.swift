//
//  HomeButton.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//


import SwiftUI

// MARK: HomeButton
struct HomeButton: View {
    @State private var isTapped = false
    @State private var offsetY: CGFloat = 200
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Font.custom("LuckiestGuy-Regular", size: 20))
                .foregroundColor(.white)
                .frame(width: 250, height: 100)
                .background(Color.orange)
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding(2)
        }
        .scaleEffect(isTapped ? 1.2 : 1.0) // Bounce effect
                .offset(y: offsetY) // Slide-in animation
                .animation(.easeOut(duration: 1.0).delay(0.5), value: offsetY)
                .onAppear {
                    offsetY = 0 // Moves up into position
                }
                .onTapGesture {
                    isTapped.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        isTapped = false
                    }
                }
    }
}

// MARK: Singlephone Button
struct SinglePhoneButton: View {
    @State private var offsetY: CGFloat = 200
    
    var body: some View {
        Text("En telefon")
            .font(Font.custom("LuckiestGuy-Regular", size: 20))
            .foregroundColor(.white)
            .shadow(radius: 5)
            .padding()
            .frame(width: 200, height: 60)
            .background(Color.red)
            .cornerRadius(30)
            .shadow(color: .red, radius: 5)
            .offset(y: offsetY) // Slide-in animation
            .animation(.easeOut(duration: 1.0).delay(0.5), value: offsetY)
            .onAppear {
                offsetY = 0 // Moves up into position
            }
    }
}

// MARK: Multiplayer Button
struct MultiplayerButton: View {
    @State private var offsetY: CGFloat = 200
    
    var body: some View {
        Text("Flere telefoner")
            .font(Font.custom("LuckiestGuy-Regular", size: 20))
            .foregroundColor(.white)
            .shadow(radius: 5)
            .padding()
            .frame(width: 200, height: 60)
            .background(Color.red)
            .cornerRadius(30)
            .shadow(color: .red, radius: 5)
            .offset(y: offsetY) // Slide-in effect
            .onAppear {
                withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                    offsetY = 0 // Moves down into position smoothly
                }
            }
    }
}

// MARK: Title Card
struct HomeTitleCard: View {
    @State private var isTapped = false
    @State private var offsetY: CGFloat = -300
    
    var body: some View {
        ZStack {
            Text("Kanakkas!")
                .font(Font.custom("LuckiestGuy-Regular", size: 86))
                .foregroundColor(.red)
                .shadow(color: .red, radius: 10)
            
            Text("Kanakkas!")
                .font(Font.custom("LuckiestGuy-Regular", size: 80))
                .foregroundColor(.white)
                .shadow(color: .red, radius: 10)
        }
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


// MARK: Under Title Card
struct UnderTitleCard: View {
    @State private var isTapped = false
    @State private var offsetY: CGFloat = -250
    
    var body: some View {
        ZStack {
            Text("Når det skal gå litt for langt!")
                .font(Font.custom("LuckiestGuy-Regular", size: 31))
                .foregroundColor(.red)
                .shadow(color: .red, radius: 10)
            
            Text("Når det skal gå litt for langt!")
                .font(Font.custom("LuckiestGuy-Regular", size: 30))
                .foregroundColor(.white)
                .shadow(color: .red, radius: 10)
        }
        .offset(y: offsetY) // Slide-in effect
        .onAppear {
            withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5).delay(0.2)) {
                offsetY = 0 // Moves down into position smoothly
            }
        }
        .scaleEffect(isTapped ? 1.2 : 1.0) // Bounce effect on tap
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.2)) {
                isTapped.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.2)) {
                    isTapped = false
                }
            }
        }
    }
}

// Preview
struct HomeScreenComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
