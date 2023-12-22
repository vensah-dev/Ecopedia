//
//  Tips.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 9/17/23.
//

import SwiftUI

struct ResoruceView: View {
    @State var suggestion: Suggestion = Suggestions[0]
    @State var showAllSug: Bool = false
    @State var showAllChal: Bool = false

    var body: some View {
        NavigationStack{
            ZStack{
                Color("ListBackground")
                    .ignoresSafeArea()
                VStack{
                    ChallengeView()
                    
                    List{
                        Section(header: Text("Suggestions")){
                            ForEach(randomSuggestions, id: \.id){ suggestion in
                                NavigationLink {
                                    SuggestionDetailView(suggestion: suggestion)
                                } label: {
                                    Text(suggestion.title)
                                        .foregroundColor(Color("green"))
                                        .multilineTextAlignment(.leading)
                                        .bold()
                                }
                            }
                            
                            Button(){
                                showAllSug = true
                            }label:{
                                Text("All Suggestions")
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                    .multilineTextAlignment(.center)
                            }
                            .fullScreenCover(isPresented: $showAllSug, content:{ SuggestionsView()})
                        }
                        
                        Section(header: Text("Challenges")){
                            ForEach(randomChallenges, id: \.id){(challenge: Challenge) in
                                NavigationLink {
                                    ChallengeDetailView(challenge: challenge)
                                } label: {
                                    VStack(alignment: .leading){
                                        Text(challenge.title)
                                            .foregroundColor(Color("green"))
                                            .bold()
                                        
                                        Text(challenge.difficulty)
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                            
                            Button(){
                                showAllChal = true
                            }label:{
                                Text("All Challenges")
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                    .multilineTextAlignment(.center)
                            }
                            .fullScreenCover(isPresented: $showAllChal, content:{ ChallengesView()})
                        }
                    }
                    .navigationTitle("Resources")
                    
                }
            }
        }
    }
    
    var randomChallenges: [Challenge]{
        var returnVar: [Challenge] = []
        
        for _ in 0...5{
            returnVar.append(Challenges[Int.random(in: 0...Challenges.count - 1)])
        }
        
        return returnVar
    }
    
    var randomSuggestions: [Suggestion]{
        var returnVar: [Suggestion] = []
        
        for _ in 0...5{
            returnVar.append(Suggestions[Int.random(in: 0...Suggestions.count - 1)])
        }
        
        return returnVar
    }
    
}

#Preview {
    ResoruceView()
}
