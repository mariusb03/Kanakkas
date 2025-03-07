//
//  KanakkasApp.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//

import SwiftUI
import SwiftData

@main
struct DrinkingGame: App {
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
        }
    }
}

// Preview
struct app_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
