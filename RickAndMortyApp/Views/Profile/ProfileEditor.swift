//
//  ProfileEditor.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 08/12/2022.
//

import SwiftUI
import CoreLocation
import MapKit

struct ProfileEditor: View {
    
    @Binding var profile: Profile
    @State var townEntry: String = ""
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
        
    var body: some View {
        
        List{
            MapView(region: $region)
                .frame(height: 200)
            
            HStack{
                Text("User name").bold()
                Divider()
                TextField("Username", text: $profile.userName)
            }
  
            HStack{
                Text("Town").bold()
                Divider()
                TextField("Town", text: $profile.town)
                    .onChange(of: profile.town) {
                                    print($0)
                                    updateCoordinates(query: $0)
                                }
            }
            
            VStack(alignment: .leading, spacing: 20) {

                Text("Mood Photo").bold()

                

                Picker("Seasonal Photo", selection: $profile.mood) {

                    ForEach(Profile.Mood.allCases) { mood in

                        Text(mood.rawValue).tag(mood)

                    }

                }

                .pickerStyle(.segmented)

            }
        }
        .onAppear{
            updateCoordinates(query: profile.town)
        }
    }
    
    func updateCoordinates(query: String){
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(query) {
            placemarks, error in
            if placemarks?.first != nil{
            let placemark = placemarks?.first
            let coordinates = CLLocationCoordinate2D(
                latitude: placemark?.location?.coordinate.latitude ?? 0.0,
                longitude: placemark?.location?.coordinate.longitude ?? 0.0)
            region = MKCoordinateRegion(
                center: coordinates,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
            }        
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
