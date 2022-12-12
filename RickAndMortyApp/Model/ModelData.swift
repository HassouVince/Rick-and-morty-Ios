//
//  ModelData.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 08/12/2022.
//

import Foundation

final class ModelData: ObservableObject{
    @Published var characters: [CharactersResult.Character] = []
    @Published var profile = Profile.default

    func getGenderCategory()-> Category{
        return Category(title: "Gender", dict: Dictionary(
            grouping: characters,
            by: { $0.gender }
        )
        )
    }
    
    func getStatusCategory()-> Category{
        return Category(title: "Gender", dict: Dictionary(
            grouping: characters,
            by: { $0.status }
        )
        )
    }
    
    func getSpeciesCategory()-> Category{
        return Category(title: "Gender", dict: Dictionary(
            grouping: characters,
            by: { $0.species }
        )
        )
    }
}
