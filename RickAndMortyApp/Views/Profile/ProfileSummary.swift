//
//  ProfileSummary.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 08/12/2022.
//

import SwiftUI

struct ProfileSummary: View {
    
    var profile: Profile
    
    var body: some View {
        ScrollView{
        VStack(alignment: .leading, spacing: 10){
        Text(profile.userName)
            .bold()
            .font(.title)
            Text("Ville: \(profile.town)")
            Text("Mood: \(profile.mood.rawValue)")
        }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
