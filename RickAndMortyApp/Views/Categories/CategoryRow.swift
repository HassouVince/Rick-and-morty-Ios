//
//  CategoryRow.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 07/12/2022.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String

    var items: [CharactersResult.Character]
    
    var body: some View {

            VStack {

                Text(categoryName)

                    .font(.headline)

                    .padding(.leading, 15)

                    .padding(.top, 5)


                ScrollView(.horizontal, showsIndicators: false) {

                    HStack(alignment: .top, spacing: 0) {

                        ForEach(items) { item in
                            
                            NavigationLink {
                                CharacterDetails(character: item)
                            } label: {
                                CategoryItem(character: item)
                            }

                        }

                    }

                }

                .frame(height: 185)
        }

    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(categoryName: "Category", items: ModelData().characters)
    }
}
