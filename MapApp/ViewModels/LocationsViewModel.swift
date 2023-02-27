//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Vojtěch Kalivoda on 16.02.2023.
//

import Foundation
import SwiftUI
import MapKit

class LocationsViewModel: ObservableObject {
    
    // all loaded locations
    @Published var locations: [Location]
    
    // current location on  map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    @State var mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // show list of locations
    @Published var isShowLocationsList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    func showLocationsList() {
        if isShowLocationsList == true {
            LocationsListView()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            isShowLocationsList = false
        }
    }
    
}
