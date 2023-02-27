//
//  MapAppApp.swift
//  MapApp
//
//  Created by Vojtěch Kalivoda on 16.02.2023.
//

import SwiftUI

@main
struct MapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
