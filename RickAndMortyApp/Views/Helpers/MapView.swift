//
//  MapView.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 08/12/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
        
    @Binding var region: MKCoordinateRegion
    
    var body: some View {
        Map(coordinateRegion: $region) 
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let reg = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
        MapView(region: .constant(reg))
    }
}
