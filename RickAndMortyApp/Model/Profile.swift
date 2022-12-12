//
//  Profile.swift
//  RickAndMortyApp
//
//  Created by Nadir Hassou on 07/12/2022.
//

import Foundation

struct Profile: Equatable {
    var userName: String
    var town: String
    var mood = Mood.very_happy
    
    static let `default` = Profile(userName: "Unknown (name)", town: "Unknown (town)")

    enum Mood: String, CaseIterable, Identifiable{
        case sad = "😕"
        case neutral = "😐"
        case happy = "😊"
        case very_happy = "😁"
        
        var id: String { rawValue }
    }
    
    public static func ==(lhs: Profile, rhs: Profile) -> Bool{
            return
                lhs.userName == rhs.userName &&
                lhs.town == rhs.town &&
                lhs.mood.rawValue == rhs.mood.rawValue
        }
    
  /*  static func getMoodFromString(value: String) -> Mood{
        switch value {
            case
        }
    }  */
}
