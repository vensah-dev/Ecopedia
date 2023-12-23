//
//  AllSuggestionsView.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 21/12/2023.
//

import SwiftUI

struct ChallengesView: View {
    @StateObject var dataManager: DataManager

    @State var SearchTerms: String = ""
    @Environment (\.dismiss) private var dismiss
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(displayChallenges.indices, id: \.self){index in
                        NavigationLink {
                            ChallengeDetailView(challenge: $dataManager.Challenges[index])
                        } label: {
                            VStack(alignment: .leading){
                                Text(dataManager.Challenges[index].title)
                                    .foregroundColor(Color("green"))
                                    .bold()
                                
                                Text(dataManager.Challenges[index].difficulty)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .searchable(text: $SearchTerms)
            .navigationTitle("Challenges")
            .navigationBarItems(leading:
                HStack{
                    Button(){
                        dismiss()
                    }label:{
                        HStack{
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                }
            )
        }
    }
    
    var displayChallenges: [Challenge]{
        var s: [Challenge] = []
        
        if(SearchTerms.isEmpty){
            s = dataManager.Challenges
        }
        else{
            s = dataManager.Challenges.filter{$0.title.contains(SearchTerms)}
        }
        
        return s
    }
}
