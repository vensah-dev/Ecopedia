//
//  Tips.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 9/17/23.
//

import SwiftUI

struct ResourceView: View {
    @ObservedObject var dataManager: DataManager

    @State var showAllSug: Bool = false
    @State var showAllChal: Bool = false

    var body: some View { 
        NavigationStack{
            ZStack{
                Color(UIColor.systemGroupedBackground)
                    .ignoresSafeArea()
                VStack(alignment: .center){
                    ChallengeWidget()
                    GeometryReader{ G in
                        ZStack(alignment: .center){
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
                                    .fullScreenCover(isPresented: $showAllSug){ SuggestionsView(dataManager: dataManager)
                                    }
                                }
                                
                                Section(header: Text("Challenges")){
                                    ForEach(randomChallenges.indices, id: \.self){index in
                                        NavigationLink {
                                            ChallengeDetailView(dataManager: dataManager, challenge: $dataManager.Challenges[index])
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
                                    
                                    Button(){
                                        showAllChal = true
                                    }label:{
                                        Text("All Challenges")
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            .multilineTextAlignment(.center)
                                    }
                                    .fullScreenCover(isPresented: $showAllChal, content:{ ChallengesView(dataManager: dataManager)})
                                }
                            }
                            .padding([.leading, .trailing], -16)
                            .frame(maxWidth: G.size.width)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .clipShape(
                            .rect(
                                topLeadingRadius: 15,
                                bottomLeadingRadius: 0,
                                bottomTrailingRadius: 0,
                                topTrailingRadius: 15
                            )
                        )
                        .navigationTitle("Resources")
                    }
                }
                .frame(maxHeight: .infinity)
                .padding(.horizontal, 20)

            }
        }
    }
    
    var randomChallenges: [Challenge]{
        var returnVar: [Challenge] = []
        
        for _ in 0...5{
            returnVar.append(dataManager.Challenges[Int.random(in: 0...dataManager.Challenges.count - 1)])
        }
        
        return returnVar
    }
    
    var randomSuggestions: [Suggestion]{
        var returnVar: [Suggestion] = []
        
        for _ in 0...5{
            returnVar.append(dataManager.Suggestions[Int.random(in: 0...dataManager.Suggestions.count - 1)])
        }
        
        return returnVar
    }
    
}
