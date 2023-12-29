//
//  Structs.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 23/12/2023.
//

import Foundation
import UIKit

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

struct ProfileData: Codable{
    var id = UUID()
    var userName: String = ""
    var streak: Int = 0
    var score: Int = 0
    var target: Int = 0
    var pfpIndex: Int = -1
    
}

struct CalculatorData{
    var id = UUID()

    var ElectrictyBill: String = ""
    var GasBill: String
    
    var carMileage: String
    var FlightsUnder4: String
    var FlightsOver4: String
    
    var recycleAluminium: Bool
    var recyclePaper: Bool
    
}
