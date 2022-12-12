//
//  InfoCard.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 06/12/2022.
//

import SwiftUI

struct InfoCard: View {
    var title: String
    var infos: [InfoRow]
    var body: some View {
        VStack{
            Text(title)
                .bold()
                    .font(.body)
                    .padding(.top)
            Divider()
                List{
                    ForEach(0..<infos.count) { index in
                                    self.buildView( index: index)
                                }
                }
        }
            .frame(maxWidth: .infinity)
            .background(.bar)
            .cornerRadius(12)
            .padding()
    }
    
    func buildView(index: Int) -> InfoRow {
        let info = infos[index]
        return  InfoRow(icon: info.icon, title: info.title, content: info.content)
        }
}

struct InfoCard_Previews: PreviewProvider {
    static var previews: some View {
        InfoCard(title: "okokokok",infos: [
            InfoRow(icon: "star.fill", title: "Genre", content: "Male"),
            InfoRow(icon: "star.fill", title: "Status", content: "Alive"),
            InfoRow(icon: "star.fill", title: "Crée le", content: "Date")
        ])
    }
}
