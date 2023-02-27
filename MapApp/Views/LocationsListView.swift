//
//  LocationsListView.swift
//  MapApp
//
//  Created by Vojtěch Kalivoda on 18.02.2023.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel

    var body: some View {
        List(vm.locations) { location in
            Button {
                vm.showNextLocation(location: location)
            } label: {
                listRowView(location: location)
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
            }

            
        }.listStyle(.plain)
            
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsListView {
    
    func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first! {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                
                VStack(alignment: .leading){
                    Text(location.name)
                        .font(.system(.headline, design: .rounded, weight: .semibold))
                    Text(location.cityName)
                        .font(.system(.subheadline, design: .rounded, weight: .medium))

                }.frame(maxWidth: .infinity, alignment: .leading)
                                    }
        }
    }
}
