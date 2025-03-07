//
//  MultiplayerGameView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//


import SwiftUI

struct MultiplayerGameView: View {
    var body: some View {
        NavigationStack {
            Text("Multiplayer Game Mode")
                .font(.largeTitle)
                .padding()
        }
    }
}

// 🛠 Preview
struct MultiplayerGameView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplayerGameView()
    }
}
