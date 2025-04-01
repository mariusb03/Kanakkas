//
//  SpinTheWheelEditorView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 19/03/2025.
//

import SwiftUI

struct SpinTheWheelEditorView: View {
    @State private var options: [WheelOption] = [] // Stores user-created challenges/questions
    @State private var newOption: String = "" // Stores input field text
    @State private var textSize: Double = 18
    @State private var spinTime: Double = 5
    
    @State private var navigateToGame = false

    // 🎨 Predefined Color Palette (Repeating)
    private let colorPalette: [Color] = [
        .red, .blue, .green, .orange, .purple, .yellow, .pink, .cyan
    ]

    var onStartGame: ([WheelOption]) -> Void // Closure to start the game
    
    var body: some View {
        ZStack {
            HomeBackground()
            
            VStack(spacing: 15) {
                
                // 🔹 Header
                HStack {
                    CustomBackButton()
                    Spacer()
                    
                    ZStack {
                        Text("Rediger spørsmåls hjulet!")
                            .font(Font.custom("LuckiestGuy-Regular", size: 32))
                            .foregroundColor(.red)
                            .shadow(radius: 5)
                        
                        Text("Rediger spørsmåls hjulet!")
                            .font(Font.custom("LuckiestGuy-Regular", size: 31))
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                    }
                    
                    Spacer()
                    KrigInfoButton {
                        print("")
                    }
                }
                .padding(.horizontal, 20)
                
                // 🔹 Main Layout
                HStack(spacing: 20) {
                    
                    // ✅ Left Panel: Add & List Challenges
                    VStack {
                        // 🔹 Input Field & Add Button
                        HStack {
                            TextField("Skriv inn spørsmål eller utfordring!", text: $newOption)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .font(Font.custom("LuckiestGuy-Regular", size: 15))
                                .padding()
                                .background(Color.red.opacity(0.1))
                                .cornerRadius(10)
                            
                            Button(action: addOption) {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                    .font(.title)
                                    .shadow(radius: 2)
                            }
                        }
                        .padding(.horizontal, 10)
                        
                        // 🔹 List of Entries
                        ScrollView {
                            VStack(spacing: 10) {
                                ForEach(options.indices, id: \.self) { index in
                                    HStack {
                                        // ✅ Number Indicator
                                        Text("\(index + 1).")
                                            .font(Font.custom("LuckiestGuy-Regular", size: 20))
                                            .foregroundColor(.white.opacity(0.8))
                                            .frame(width: 30, alignment: .leading)
                                        
                                        // ✅ Question with Background Color (Now Fills Width)
                                        Text(options[index].text)
                                            .font(Font.custom("LuckiestGuy-Regular", size: 20))
                                            .foregroundColor(.white)
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading) // Ensures Full Width
                                            .background(options[index].color.opacity(1))
                                            .cornerRadius(12)
                                            .shadow(radius: 2)
                                        
                                        // ✅ Remove Button
                                        Button(action: { removeOption(at: index) }) {
                                            Image(systemName: "trash.circle.fill")
                                                .foregroundColor(.red)
                                                .font(.title2)
                                        }
                                    }
                                    .padding(.horizontal, 10) // Ensures spacing on edges
                                    .background(Color.white.opacity(0.1)) // Slight contrast background
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                }
                            }
                        }
                        .frame(height: 200)
                        .padding()
                        .cornerRadius(15)
                        .shadow(radius: 3)
                    }
                    .frame(width: 400) // Adjusted for better layout balance
                    
                    // ✅ Right Panel: Customization Settings
                    VStack(spacing: 20) {
                        Text("Tilpasninger")
                            .font(Font.custom("LuckiestGuy-Regular", size: 28))
                            .foregroundColor(.white)
                            .shadow(radius: 3)
                            .padding(.top, 20)
                        
                        VStack(spacing: 10) {
                            HStack {
                                Text("Tekststørrelse: \(Int(textSize))")
                                    .font(Font.custom("LuckiestGuy-Regular", size: 16))
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Slider(value: $textSize, in: 10...30, step: 1)
                                    .accentColor(.red)
                            }
                            .padding(.horizontal)
                            
                            
                            HStack {
                                Text("Spin-tid: \(Int(spinTime))x")
                                    .font(Font.custom("LuckiestGuy-Regular", size: 20))
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Slider(value: $spinTime, in: 1...10, step: 1)
                                    .accentColor(.blue)
                            }
                            .padding(.horizontal)
                        }
                        .padding()
                        .cornerRadius(12)
                        .shadow(radius: 3)
                        
                        Spacer()

                        // When starting the game, ensure we send an odd-numbered list
                        Button(action: {
                            if !options.isEmpty {
                                onStartGame(finalizeOptions())
                                navigateToGame = true
                            }
                        }) {
                            Text("Lagre!")
                                .font(Font.custom("LuckiestGuy-Regular", size: 24))
                                .padding()
                                .frame(width: 250)
                                .background(options.isEmpty ? Color.gray : Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }
                        .disabled(options.isEmpty)
                        
                        Spacer()
                    }
                    .frame(width: 400, height: 250)
                    .padding()
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(15)
                    .shadow(radius: 5)
                }
            }
            .fullScreenCover(isPresented: $navigateToGame) {SpinTheWheelGameView(options: options)}
            .padding()
            .overlay(TableEdge())
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func finalizeOptions() -> [WheelOption] {
        var finalOptions = options
        
        // ✅ If even, duplicate the last option to make it odd
        if finalOptions.count.isMultiple(of: 2), let lastOption = finalOptions.last {
            finalOptions.append(WheelOption(text: lastOption.text, color: lastOption.color))
        }
        
        return finalOptions
    }
    
    
    // 🔹 Function to add a new challenge/question with a repeating color cycle
    private func addOption() {
        if !newOption.isEmpty {
            let nextColor = colorPalette[options.count % colorPalette.count] // Cycle through colors
            options.append(WheelOption(text: newOption, color: nextColor))
            newOption = "" // Clear input field
        }
    }
    
    // Function to remove challenges/questions
    private func removeOption(at index: Int) {
        options.remove(at: index)
    }
}

// 🔹 Data Model for Wheel Options
struct WheelOption: Identifiable {
    let id = UUID()
    var text: String
    var color: Color
}

// 🔹 Preview
struct SpinTheWheelEditorView_Previews: PreviewProvider {
    static var previews: some View {
        SpinTheWheelEditorView { _ in }
            .previewInterfaceOrientation(.landscapeRight) // Ensures Landscape Mode in Preview
    }
}
