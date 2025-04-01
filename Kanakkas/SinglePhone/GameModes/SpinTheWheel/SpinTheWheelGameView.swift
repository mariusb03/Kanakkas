//
//  SpinTheWheelGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 20/03/2025.
//

import SwiftUI

struct SpinTheWheelGameView: View {
    @State private var options: [WheelOption]
    
    @State private var rotation: Double = 0
    @State private var isSpinning = false
    @State private var selectedOption: WheelOption?
    @State private var showPopup = false
    
    init(options: [WheelOption]) {
        _options = State(initialValue: options)
    }
    
    var body: some View {
        ZStack {
            HomeBackground()
            
            VStack(spacing: 20) {
                HStack {
                    CustomBackButton()
                    
                    Spacer()
                    
                    ZStack {
                        Text("Spin The Wheel!")
                            .font(Font.custom("LuckiestGuy-Regular", size: 45))
                            .foregroundColor(.red)
                            .shadow(color: .red, radius: 5)
                        
                        Text("Spin the wheel!")
                            .font(Font.custom("LuckiestGuy-Regular", size: 43))
                            .foregroundColor(.white)
                            .shadow(color: .red, radius: 5)
                    }
                    
                    Spacer()
                    
                    KrigInfoButton {
                        print("")
                    }
                }
                
                ZStack {
                    // Wheel
                    WheelView(options: options, rotation: $rotation)
                        .frame(width: 300, height: 300)
                        .rotationEffect(.degrees(rotation))
                        .onTapGesture {
                            spinWheel()
                        }
                        .overlay(
                            Circle()
                                .stroke(Color(hue: 0.085, saturation: 0.688, brightness: 0.349), lineWidth: 20)
                        )
                        .overlay (
                            Image(systemName: "arrowtriangle.down.fill")
                                .resizable()
                                .frame(width: 30, height: 40)
                                .foregroundColor(.white)
                                .offset(y: -140)
                        )
                    
                    Circle()
                        .fill(Color(hue: 0.085, saturation: 0.688, brightness: 0.349)
                        )
                        .frame(width: 30, height: 30)
                    
                }
            }
            .padding()
            
            if showPopup, let selectedOption = selectedOption {
                SpinMessageView(
                    message: selectedOption.text,
                    totalSlices: options.count,
                    onKeep: { showPopup = false },
                    onRemove: {
                        if let index = options.firstIndex(where: { $0.id == selectedOption.id }) {
                            options.remove(at: index)
                        }
                        showPopup = false
                    }
                )
            }
        }
        .overlay(TableEdge())
        .navigationBarBackButtonHidden(true)
    }
    
    private func spinWheel() {
        guard !isSpinning else { return }
        isSpinning = true

        let randomRotation = Double.random(in: 1440...2160) // 4-6 full spins
        withAnimation(Animation.easeOut(duration: 3)) {
            rotation += randomRotation
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let normalizedRotation = rotation.truncatingRemainder(dividingBy: 360)
            
            // Adjust the rotation to match the triangle position (top = -90 degrees)
            let adjustedRotation = (normalizedRotation + 90).truncatingRemainder(dividingBy: 360)
            
            // Convert rotation into a segment index
            var index = Int((adjustedRotation + 360).truncatingRemainder(dividingBy: 360) / (360 / Double(options.count)))

            // Ensure the index is within bounds
            index = (options.count - 1 - index + options.count) % options.count

            selectedOption = options[index]
            showPopup = true
            isSpinning = false
        }
    }
}

struct WheelView: View {
    var options: [WheelOption]
    @Binding var rotation: Double
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let radius = size / 2
            let anglePerOption = 360.0 / Double(options.count)
            
            ZStack {
                ForEach(0..<options.count, id: \ .self) { index in
                    let startAngle = Double(index) * anglePerOption
                    let endAngle = startAngle + anglePerOption
                    
                    WheelSegment(startAngle: startAngle, endAngle: endAngle, color: options[index].color, text: options[index].text, radius: radius)
                }
            }
        }
    }
}

struct WheelSegment: View {
    var startAngle: Double
    var endAngle: Double
    var color: Color
    var text: String
    var radius: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
                path.move(to: center)
                path.addArc(center: center, radius: radius, startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: endAngle), clockwise: false)
                path.closeSubpath()
            }
            .fill(color)
            .stroke(.white, lineWidth: 3)
            .overlay(TextOverlay(startAngle: startAngle, endAngle: endAngle, text: text, radius: radius))
        }
    }
}

struct TextOverlay: View {
    var startAngle: Double
    var endAngle: Double
    var text: String
    var radius: CGFloat
    
    var body: some View {
        Text(text)
            .font(Font.custom("LuckiestGuy-Regular", size: 15))
            .foregroundColor(.white)
            .rotationEffect(.degrees((startAngle + endAngle) / 2))
            .offset(x: radius / 2 * cos(CGFloat((startAngle + endAngle) / 2) * .pi / 180),
                    y: radius / 2 * sin(CGFloat((startAngle + endAngle) / 2) * .pi / 180))
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}


struct SpinMessageView: View {
    let message: String
    let totalSlices: Int
    let onKeep: () -> Void
    let onRemove: () -> Void

    var body: some View {
        ZStack {
            VisualEffectBlurView()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Hjulet landet på:")
                    .font(Font.custom("LuckiestGuy-Regular", size: 32))
                    .foregroundColor(.white)
                    .bold()
                    .multilineTextAlignment(.center)

                Text(message)
                    .font(Font.custom("LuckiestGuy-Regular", size: 32))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                HStack(spacing: 20) {
                    // 🔹 Keep Option
                    Button(action: onKeep) {
                        Text("Behold")
                            .font(Font.custom("LuckiestGuy-Regular", size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150)
                            .background(Color.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    
                    // 🔹 Remove Option (Handles Even & Odd Slices)
                    Button(action: {
                        if totalSlices > 1 {
                            onRemove() // Remove slice only if more than 1 slice remains
                        }
                    }) {
                        Text("Fjern")
                            .font(Font.custom("LuckiestGuy-Regular", size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150)
                            .background(totalSlices > 1 ? Color.red : Color.gray) // Disable if last slice
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .disabled(totalSlices <= 1) // Prevent removing last slice
                }
            }
            .padding()
            .frame(width: 450, height: 280) // Ensures a nice size
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.red).shadow(radius: 10))
            .transition(.scale) // Smooth pop-in animation
        }
        .overlay (
            TableEdge()
        )
    }
}


// 🔹 Preview
struct SpinTheWheelGameView_Previews: PreviewProvider {
    static var previews: some View {
        SpinTheWheelGameView(options: [
            WheelOption(text: "Truth", color: .red),
            WheelOption(text: "Dare", color: .blue),
            WheelOption(text: "Shot", color: .green),
            WheelOption(text: "Wildcard", color: .orange),
            WheelOption(text: "bruh", color: .pink),
            
            
        ])
        .previewInterfaceOrientation(.landscapeRight) // Ensures Landscape Mode in Preview
    }
}
