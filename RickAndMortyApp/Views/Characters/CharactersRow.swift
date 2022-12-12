//
//  CharactersRow.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 05/12/2022.
//

import SwiftUI

struct CharactersRow: View {
    
    var character: CharactersResult.Character
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: character.image)) { link in
                            switch link {
                            case .empty:
                                ProgressView()
                                    .frame(width: 100, height: 100)
                            case .success(let image):
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                     .scaledToFill()
                                     
                            case .failure:
                                Image(systemName: "photo")
                            @unknown default:
                                EmptyView()
                            }
                        }

            Text(character.name)
                .font(.subheadline)
                .lineLimit(1).padding(.bottom,7)
                .foregroundColor(.black)
            
        }.border(.black, width: 0.3)
            .background(.bar)
    }
}

struct CharactersRow_Previews: PreviewProvider {
    static var previews: some View {
        CharactersRow(character: CharactersResult.Character.default())
    }
}
