//
//  CharacterListEntity.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 07/12/2022.
//

import Foundation
import CoreData

class CharacterListEntity : NSManagedObject{
    
    func toCharacter() -> CharactersResult.Character{
        var character = CharactersResult.Character.default()
        character.id = Int(self.id)
        character.name = "DB \(self.name ?? "empty")"
        character.status = self.status ?? "Unknown"
        character.gender = self.gender ?? "Unknown"
        character.image = self.image ?? ""
        return character
    }
    
    static func toCharacterList(entities: [CharacterListEntity]) -> [CharactersResult.Character]{
        return entities.map{ entity in
            entity.toCharacter()
        }
    }
}
