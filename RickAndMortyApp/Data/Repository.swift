//
//  Repository.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 07/12/2022.
//

import Foundation
import CoreData

final class Repository {
    
    var modelData: ModelData
    private let network = Network()
    private let local = Local()

    init(modelData: ModelData) {
          self.modelData = modelData
       }
    
    func fetchcharacters(fromRemote: Bool = false,
                       url: String = "https://rickandmortyapi.com/api/character?page=1",
                       gender: String? = nil,
                       status: String? = nil,
                       initList: Bool = true){
        if(fromRemote){
            fetchCharactersFromLocal(gender: gender, status: status)
        }else{
            fetchCharactersFromRemote(url: url, gender: gender, status: status, initList: initList)
        }
    }
    
    private func fetchCharactersFromRemote(url: String,
                                         gender: String? = nil,
                                         status: String? = nil,
                                         initList: Bool = true){
        network.getCharacters(pUrl: url, gender: gender, status: status){ result in
            if(initList){
                  self.modelData.characters = []
              }
              
            self.local.saveAllCharacterEntities(characters: result.results){}
            for character in result.results {
                self.modelData.characters.append(character)
            }
            if let next = result.info?.next{
                self.fetchCharactersFromRemote(url: next, gender: gender, status: status, initList: false)
            }
        }
    }
    
    private func fetchCharactersFromLocal(gender: String? = nil, status: String? = nil){
        modelData.characters = []
        local.fetchCharacterEntities(gender: gender, status: status){ items in
            modelData.characters = CharacterListEntity.toCharacterList(entities: items)
        }
    }
    
    func saveProfile(_ profile: Profile){
        local.saveProfile(profile)
    }
    
    func getProfile() -> Profile {
        return local.getProfile()
    }
}
