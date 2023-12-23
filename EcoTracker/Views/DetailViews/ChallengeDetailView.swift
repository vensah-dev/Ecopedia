//
//  ChallengeDetailView.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 21/12/2023.
//

import SwiftUI

struct ChallengeDetailView: View {
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
                    if(challenge.completed){
                        Button(){
                            challenge.completed = false
                        }label:{
                            Text("Redo")
                                .foregroundColor(Color.red)
                        }
                    }
                    else{
                        Button(){
                            challenge.completed = true
                        }label:{
                            Text("Done")
                                .foregroundColor(Color("green"))
                        }
                    }
                }
                
                Section(header: Text("Variants")){
                    NavigationLink {
                        ChallengeDetailView(challenge: $challenge)
                    } label: {
                        VStack(alignment: .leading){
                            Text(challenge.title)
                                .foregroundColor(Color("green"))
                                .bold()
                            
                            Text(challenge.difficulty)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    }
                }
            }
        }
    }
}
