//
//  ReviewView.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 29/12/2023.
//

import SwiftUI

struct ReviewView: View {
    @StateObject var dataManager: DataManager
    
    @State var recyclingFeedback: Bool = true
    @State var transportFeedback: Bool = true
    @State var utilitiesFeedback: Bool = true
    
    var body: some View {
        
        NavigationStack{
            let scoreData = dataManager.scoreData
            
            List{
                Section(header: Text("Recyling")){
                    
                    if(!scoreData.recycleAluminium || !scoreData.recyclePaper){
                        if(!scoreData.recycleAluminium){
                            Text("you should recycle more paper. Here are some challengs that you can complete to help with that and improve your carbon footprint score")
                                .font(.system(size: 20, weight: .none, design: .rounded))
                            
                            ForEach(recomendedchallenges(word: "metal recycling").indices, id: \.self){index in
                                ChallengesListItem(dataManager: dataManager, index: index)
                                
                            }
                        }
                        
                        if(!scoreData.recyclePaper){
                            Text("you should recycle more paper. Here are some challengs that you can complete to help with that and improve your carbon footprint score")
                                .font(.system(size: 20, weight: .none, design: .rounded))
                            
                            ForEach(recomendedchallenges(word: "paper recycling").indices, id: \.self){index in
                                ChallengesListItem(dataManager: dataManager, index: index)
                                
                            }
                        }
                    }
                    else{
                        Text("You are doing well keep up the good work!")
                            .font(.system(size: 20, weight: .none, design: .rounded))
                    }
                }
                
                Section(header: Text("Transport")){
                    if(Numberify(value: scoreData.carMileage) > 20000){
                        Text("you should cut down on your usage of cars of cars for transport. Here are some challengs that you can complete to help with that and improve your carbon footprint score")
                            .font(.system(size: 20, weight: .none, design: .rounded))
                        
                        ForEach(recomendedchallenges(word: "sustainable transportation").indices, id: \.self){index in
                            ChallengesListItem(dataManager: dataManager, index: index)
                            
                        }
                    }
                    else{
                        Text("You are doing well keep up the good work!")
                            .font(.system(size: 20, weight: .none, design: .rounded))
                    }
                }
                
                Section(header: Text("Utilities")){
                    if((Numberify(value: scoreData.ElectrictyBill) > 150) || (Numberify(value: scoreData.GasBill) > 150)){
                        if(Numberify(value: scoreData.ElectrictyBill) > 150){
                            Text("you should cut down on your usage of electricity as your electricity bill is above average. Here are some challengs that you can complete to help with that and improve your carbon footprint score")
                                .font(.system(size: 20, weight: .none, design: .rounded))
                            
                            ForEach(recomendedchallenges(word: "digital detox").indices, id: \.self){index in
                                ChallengesListItem(dataManager: dataManager, index: index)
                                
                            }
                        }
                        
                        if(Numberify(value: scoreData.GasBill) > 150){
                            Text("you should cut down on your gas usage as your gas bill is above average. Here are some challengs that you can complete to help with that and improve your carbon footprint score")
                                .font(.system(size: 20, weight: .none, design: .rounded))
                            
                            ForEach(recomendedchallenges(word: "digital detox").indices, id: \.self){index in
                                ChallengesListItem(dataManager: dataManager, index: index)
                                
                            }
                        }
                    }
                    else{
                        Text("You are doing well keep up the good work!")
                            .font(.system(size: 20, weight: .none, design: .rounded))
                    }
                }
            }
        }
        .navigationTitle("Review")
    }
    
    func recomendedchallenges(word: String) -> [Challenge]{
        return dataManager.Challenges.filter{$0.title.lowercased().contains(word.lowercased())}
    }
}
