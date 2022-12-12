//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 05/12/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var tab: Tab = .list

    enum Tab{
        case categories
        case list
    }
    
    var body: some View{
        
        TabView(selection: $tab){
            
            CharactersList()
                .tabItem{
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
            CategoryHome()
                .tabItem{
                    Label("Categories", systemImage: "star")
                }
                .tag(Tab.categories)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
