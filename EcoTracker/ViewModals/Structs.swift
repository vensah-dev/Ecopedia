//
//  Structs.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 23/12/2023.
//

import Foundation

struct Suggestion: Identifiable{
    
    var id = UUID()
    var title: String
    var detail: String = "test"
    
}

struct Challenge: Codable, Equatable{
    var id = UUID()
    var title: String = ""
    var difficulty: String = ""
    var description: String = "test"
    var completed: String = "Incomplete"

    
}
