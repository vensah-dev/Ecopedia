//
//  ChallengeDetailView.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 21/12/2023.
//

import SwiftUI

struct ChallengeDetailView: View {
    @StateObject var dataManager: DataManager
    
    @Binding var challenge: Challenge
    @State var showAll: Bool = false
    @Environment(\.dismiss) private var dismiss 
    var body: some View { 
        NavigationStack{
            List{
                Section{
                    Text(challenge.title)
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .listRowBackground(opacity(0))
                }
                .navigationTitle("Challenge")
                
                Section(header: Text("Diffculty")){
                    Text(challenge.difficulty)
                }
                
                Section(header: Text("Description")){
                    Text(challenge.description)
                        .multilineTextAlignment(.leading)
                }
                
                Section(header: Text("Completion")){
                    if(challenge.completed == "Complete"){
                        Button(){
                            challenge.completed = "Incomplete"
                        }label:{
                            Text("Redo")
                                .foregroundColor(Color.red)
                        }
                    }
                    else{
                        Button(){
                            challenge.completed = "Complete"
                        }label:{
                            Text("Done")
                                .foregroundColor(Color("green"))
                        }
                    }
                }
                
                Section(header: Text("Variants")){
                    ForEach(dataManager.Challenges.indices, id: \.self){ index in
                        if(dataManager.Challenges[index].title == challenge.title){
                            ChallengesListItem(dataManager: dataManager, index: index)
                        }
                    }
                }
            }
        }
    }
}
