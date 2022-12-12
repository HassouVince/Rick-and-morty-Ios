//
//  InfoRow.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 06/12/2022.
//

import SwiftUI

struct InfoRow: View {
    var icon: String
    var title: String
    var content: String
    
    var body: some View {
        HStack{
            Image(systemName: icon)
                .foregroundColor(.gray)
                .padding(10)
            Text(title)
                .font(.caption)
                
            Spacer()
            Text(content)
                .italic()
                .font(.caption)
                .padding(10)
        }
    }
}

struct InfoRow_Previews: PreviewProvider {
    static var previews: some View {
        InfoRow(icon: "star.fill", title: "title", content: "content")
    }
}
