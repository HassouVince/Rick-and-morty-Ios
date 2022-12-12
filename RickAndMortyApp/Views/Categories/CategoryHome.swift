//
//  CategoryHome.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 07/12/2022.
//

import SwiftUI

struct CategoryHome: View {
    
@EnvironmentObject var modelData: ModelData
 
    @State private var selection = "Gender"
    @State private var category: Category = Category.default
    
    private let categoryTitles = ["Gender", "Status", "Species"]
    
    var body: some View {
        VStack(alignment: .leading){
            Picker("Select a category", selection: $selection){
                ForEach(categoryTitles, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                        .onChange(of: selection) { select in
                            category = getCategoryWithSelection(select)
                        }
            
            List {
                ForEach(category.dict.keys.sorted(), id: \.self) { key in

                    CategoryRow(categoryName: key, items: category.dict[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Categories")
            .listStyle(.inset)
        }.padding()
            .onAppear{
                Repository(modelData: modelData).fetchcharacters()
                category = getCategoryWithSelection(selection)
            }
    }
    
    private func getCategoryWithSelection(_ selection: String) -> Category{
        if(selection == "Gender"){
            return modelData.getGenderCategory()
        }else if (selection == "Status"){
            return modelData.getStatusCategory()
        }else if (selection == "Species"){
            return modelData.getSpeciesCategory()
        }else {
            return Category.default
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
