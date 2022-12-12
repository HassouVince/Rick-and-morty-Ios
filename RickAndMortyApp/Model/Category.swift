//
//  Category.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 08/12/2022.
//

import Foundation

struct Category{
     var title: String
     var dict : [String: [CharactersResult.Character]]
    
    public static let `default` = Category(title: "Categories", dict: [:])
 }
