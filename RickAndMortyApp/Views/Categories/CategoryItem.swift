//
//  CategoryItem.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 07/12/2022.
//

import SwiftUI

struct CategoryItem: View {
    
    var character: CharactersResult.Character
    
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: character.image)) { phrase in
                            switch phrase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 155, height: 155)
                            case .success(let image):
                                image.resizable()
                                     .scaledToFill()
                                     
                            case .failure:
                                Image(systemName: "photo")
                            @unknown default:
                                EmptyView()
                            }
                        }
            
            Text(character.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(character: CharactersResult.Character.default())
    }
}
