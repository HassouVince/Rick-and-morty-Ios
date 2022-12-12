//
//  DropDown.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 09/12/2022.
//

import SwiftUI

struct DropDown: View {
    
    var items: [String]
    @Binding var selection: String
    var title = "Select"
    var onChange: (String) -> Void
    
    var body: some View {
        Picker(title, selection: $selection){
                        ForEach(items, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .onChange(of: selection) { selected in
                        onChange(selected)
                    }
    }
}
