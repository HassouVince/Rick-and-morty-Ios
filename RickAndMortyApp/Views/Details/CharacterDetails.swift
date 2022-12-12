//
//  CharacterDetails.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 05/12/2022.
//

import SwiftUI

struct CharacterDetails: View {
    
    var character: CharactersResult.Character
    
    var body: some View {
        ScrollView{
            VStack(spacing: 0){
                VStack{
                    AsyncImage(url: URL(string: character.image)) { phrase in
                                    switch phrase {
                                    case .empty:
                                        ProgressView()
                                            .frame(width: 100, height: 100)
                                    case .success(let image):
                                        image.resizable()
                                             .scaledToFill()
                                           //  .frame(height: 100)
                                             
                                    case .failure:
                                        Image(systemName: "photo")
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                    Text(character.name)
                        .bold()
                        .font(.title2)
                        .padding(.top, 5)
                    Text(character.species)
                        .italic()
                        .font(.body)
                        .padding(.bottom, 10)
                    
                    
                
                }.background(.gray)
                    .foregroundColor(.white)
                
                VStack{
                    Text("General")
                        .bold()
                            .font(.body)
                            .padding(.top)
                    Divider()
                    InfoRow(icon: "person.fill", title: "Genre", content: character.gender)
                    InfoRow(icon: "gauge", title: "Status", content: character.status)
                    InfoRow(icon: "clock", title: "Crée le", content: character.created)
                        
                }
                    .frame(maxWidth: .infinity)
                    .background(.bar)
                    .cornerRadius(12)
                    .padding()
                
                if let location = character.location{
                    VStack{
                        Text("Location")
                            .bold()
                                .font(.body)
                                .padding(.top)
                        Divider()
                        InfoRow(icon: "flag.fill", title: "Nom", content: location.name)
                        InfoRow(icon: "link", title: "Url", content: location.url)
                            
                    }
                        .frame(maxWidth: .infinity)
                        .background(.bar)
                        .cornerRadius(12)
                        .padding()
                }
                
                if let origin = character.origin{
                    VStack{
                        Text("Origin")
                            .bold()
                                .font(.body)
                                .padding(.top)
                        Divider()
                        InfoRow(icon: "flag.fill", title: "Nom", content: origin.name)
                        InfoRow(icon: "link", title: "Url", content: origin.url)
                            
                    }
                        .frame(maxWidth: .infinity)
                        .background(.bar)
                        .cornerRadius(12)
                        .padding()
                }
                
                Divider()
                
                Text("Episodes")
                    .bold()
                        .font(.body)
                        .padding()

                    ForEach(character.episode, id: \.self)
                            { ep in
                                Text(ep)
                                    .italic()
                                    .font(.caption)
                                    .padding()
                                Divider()
                            }
            }
        }
    }
    
}

struct CharacterDetails_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetails(character: CharactersResult.Character.default()
        )
    }
}
