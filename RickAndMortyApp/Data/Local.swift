//
//  Local.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 12/12/2022.
//

import Foundation
import CoreData

final class Local {
        
    private let coreDataStack: CoreDataStack

       init(coreDataStack: CoreDataStack = CoreDataStack.instance) {
          self.coreDataStack = coreDataStack
       }
    
    // USER DEFAULT
    
    func saveProfile(_ profile: Profile){
        UserDefaults.standard.set(profile.userName, forKey: "name")
        UserDefaults.standard.set(profile.town, forKey: "town")
        UserDefaults.standard.set(profile.mood.rawValue, forKey: "mood")
    }
    
    func getProfile() -> Profile {
        let name = UserDefaults.standard.value(forKey: "name") as? String ?? Profile.default.userName
        let town = UserDefaults.standard.value(forKey: "town") as? String ?? Profile.default.town
        let mood = UserDefaults.standard.value(forKey: "mood") as? String ?? Profile.default.mood.rawValue
        let objMood = Profile.Mood(rawValue: mood) ?? Profile.default.mood
        return Profile(userName: name, town: town, mood: objMood)
    }
    
    // CORE DATA
    
    func saveAllCharacterEntities(characters: [CharactersResult.Character], completion: () -> Void){
        for character in characters {
            if(!checkIfItemExist(id: character.id)){
                saveCharacterEntity(character: character){}
            }
        }
        completion()
    }
    
    func fetchCharacterEntities(gender: String? = nil, status: String? = nil, completion: ([CharacterListEntity]) -> Void){
        let request: NSFetchRequest<CharacterListEntity> = CharacterListEntity.fetchRequest()
        let pGender = gender == nil ? nil : NSPredicate(format: "gender == %@",gender!)
        let pStatus = status == nil ? nil : NSPredicate(format: "status == %@",status!)
        
        if(pGender != nil && pStatus != nil){
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [pGender!,pStatus!])
        }else if(pGender != nil){
            request.predicate = pGender
        }else if(pStatus != nil){
            request.predicate = pStatus
        }
                
        guard let entities = try? CoreDataStack.instance.viewContext.fetch(request) else{
            completion([])
            return
        }
        
        completion(entities)
    }
    
    private func saveCharacterEntity(character: CharactersResult.Character, completion: () -> Void){
        if(!checkIfItemExist(id: character.id)){
            let entity = CharacterListEntity(context: CoreDataStack.instance.viewContext)
            entity.id = Int16(character.id)
            entity.name = character.name
            entity.image = character.image
            entity.gender = character.gender
            entity.status = character.status
            
            do{
                try? CoreDataStack.instance.viewContext.save()
                completion()
            }catch{
                print("Error \(character.name)")
            }
        }
    }
    
    private func checkIfItemExist(id: Int) -> Bool {
        let managedContext = CoreDataStack.instance.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CharacterListEntity")
        fetchRequest.fetchLimit =  1
        fetchRequest.predicate = NSPredicate(format: "id == %d" ,id)

        do {
            let count = try managedContext.count(for: fetchRequest)
            if count > 0 {
                return true
            }else {
                return false
            }
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }
    
}
