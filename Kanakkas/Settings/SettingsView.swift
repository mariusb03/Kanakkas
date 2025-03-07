//
//  SettingsView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//


import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Text("Innstillinger")
                .font(Font.custom("LuckiestGuy-Regular", size: 40))
                .foregroundColor(.red)
            
            Toggle("Lyd", isOn: .constant(true))
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal, 40)

            Toggle("Vibrasjon", isOn: .constant(true))
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal, 40)

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Lukk")
                    .font(Font.custom("LuckiestGuy-Regular", size: 25))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color.red)
                    .cornerRadius(25)
                    .shadow(radius: 5)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.8).edgesIgnoringSafeArea(.all))
    }
}