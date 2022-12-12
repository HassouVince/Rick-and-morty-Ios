//
//  Character.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 05/12/2022.
//

import Foundation

struct CharactersResult: Decodable {
    var info: Info?
    var results: [Character]

    struct Info: Decodable {
        var count, pages: Int
        var next, prev: String?
    }

    struct Character: Decodable, Identifiable {
        var id: Int
        var name, gender, status, species, type: String
        var origin, location: Location?
        var image: String
        var episode: [String]
        var url: String
        var created: String
      //  var isFavorite: Bool = true
                
        static func `default`() -> CharactersResult.Character{
            return CharactersResult.Character(id: 1, name: "Jony", gender: "Male", status: "Alive", species: "Human", type: "type", origin: CharactersResult.Location(name: "loc1", url: "url1"), location: CharactersResult.Location(name: "loc2", url: "url2"), image: "image", episode: ["okok","okokok"], url: "url", created: "created")
        }
    }

    struct Location: Decodable {
        var name: String
        var url: String
    }
}

