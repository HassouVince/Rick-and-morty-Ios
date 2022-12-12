//
//  ProfileHost.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 07/12/2022.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftprofil = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                Spacer()
                EditButton()
            }
            
            if(editMode?.wrappedValue == .active){
                Button("Annuler", role: .cancel){
                    draftprofil = modelData.profile
                    editMode?.animation().wrappedValue = .inactive
                }
            }
            
            if(editMode?.wrappedValue == .inactive){
                ProfileSummary(profile: modelData.profile)
            }else{
                ProfileEditor(profile: $draftprofil)
                    .onAppear{
                        draftprofil = modelData.profile
                    }
                    .onDisappear{
                        if(modelData.profile == draftprofil){}
                        else{
                            Repository(modelData: modelData).saveProfile(draftprofil)
                        }
                        modelData.profile = draftprofil
                    }
            }
        }.padding()
            .onAppear{
                modelData.profile = Repository(modelData: modelData).getProfile()
                draftprofil = modelData.profile
            }
    }
    
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
