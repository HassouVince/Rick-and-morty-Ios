//
//  CharactersList.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 05/12/2022.
//

import SwiftUI

struct CharactersList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    @State private var searchOnLocalDb = false
        
    @State private var genderSelection = "All genders"
        let genders = ["All genders", "Male", "Female", "Genderless","Unknown"]
    
    @State private var statusSelection = "All status"
        let statusList = ["All status", "Alive", "Dead", "Unknown"]
    
    var body: some View {
            NavigationView{
                VStack {
                    Divider()
                    Toggle(isOn: $searchOnLocalDb){
                        Text("BDD Locale")
                    }.padding()

                    HStack{
                        Spacer()
                        
                        dropDown(selection: genderSelection, items: genders, title: "Select a gender")
  
                        Spacer()
                        
                        dropDown(selection: statusSelection, items: statusList, title: "Select a status")
                            
                        Spacer()
                    }
                                        
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: GridItem(spacing: 0), count: 3), spacing: 0) {
                                     ForEach(modelData.characters) { character in
                                         NavigationLink{
                                             CharacterDetails(character: character)
                                         } label: {
                                             CharactersRow(character: character)
                                         }
                                     }
                                 }
                    }
                }.navigationBarTitle("Ricky & Morty")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        Button{
                            showingProfile.toggle()
                        } label: {
                            Label("User Profile", systemImage: "person.crop.circle")
                        }
                    }
                    .sheet(isPresented: $showingProfile) {
                                    ProfileHost()
                                        .environmentObject(modelData)
                                }
            }
            .onAppear{
                Repository(modelData: modelData).fetchcharacters()
            }
    }
    
    private func dropDown(
        selection: String,
        items: [String],
        title: String
    ) -> DropDown{
        return DropDown(items: items,
                        selection: selection == genderSelection ? $genderSelection : $statusSelection ,
                        title: title){ _ in
                Repository(modelData: modelData).fetchcharacters(
                    fromLocal: searchOnLocalDb,
                       gender: genderSelection == "All genders" ? nil : genderSelection
                   ,status: statusSelection == "All status" ? nil : statusSelection
                   )
               }
    }
}

struct CharactersList_Previews: PreviewProvider {
    static var previews: some View {
        CharactersList()
            .environmentObject(ModelData())
    }
}
