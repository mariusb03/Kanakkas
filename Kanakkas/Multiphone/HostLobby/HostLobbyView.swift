//
//  HostLobbyView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//


import SwiftUI

struct HostLobbyView: View {
    var body: some View {
        ZStack {
            HomeBackground()
            
            VStack {
                Text("Oppretter Lobby...")
                    .font(Font.custom("LuckiestGuy-Regular", size: 40))
                    .foregroundColor(.red)
                    .shadow(color: .red, radius: 10)

                
            }
        }
        .overlay(
            TableEdge()
        )
    }
}

// 🛠 Preview
struct HostLobbyView_Previews: PreviewProvider {
    static var previews: some View {
        HostLobbyView()
    }
}
