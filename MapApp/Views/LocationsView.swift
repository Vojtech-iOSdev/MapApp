//
//  LocationsView.swift
//  MapApp
//
//  Created by Vojtěch Kalivoda on 16.02.2023.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                header
                    .padding()
                
                Spacer()
            }
                
        }
        
    }
}


struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    
    
    private var header: some View {
        
        VStack {
            Button {
                withAnimation(.easeInOut(duration: 0.5)) {
                    vm.isShowLocationsList.toggle()
                }
                    
            } label: {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.system(.title, design: .rounded, weight: .heavy))
                    .foregroundColor(.primary)
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                            Image(systemName: "arrow.down")
                                .padding(8)
                                .font(.system(.title2, design: .rounded, weight: .semibold))
                                .rotationEffect(Angle(degrees: vm.isShowLocationsList ? 180 : 0))
                    }
            }

            if vm.isShowLocationsList == true {
                LocationsListView()
            }
            
            
                
        }.background(.thickMaterial)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 15)
        .foregroundColor(.primary)

    }
}
