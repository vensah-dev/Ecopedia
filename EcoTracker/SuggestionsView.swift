//
//  Tips.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 9/17/23.
//

import SwiftUI

struct SuggestionsView: View {
    @State var suggestion: Suggestion = Suggestions[0]
    var body: some View {
        NavigationStack{
            ZStack{
                Color("ListBackground")
                    .ignoresSafeArea()
                VStack{
                    ChallengeView()
                    
                    List{
                        Section(header: Text("Suggestions")){
                            ForEach(Suggestions, id: \.id){suggestion in
                                NavigationLink {
                                    SuggestionDetailView(suggestion: suggestion)
                                } label: {
                                    Text(suggestion.title)
                                        .foregroundColor(Color("AccentText"))
                                        .bold()
                                }
                            }
                        }
                    }
                    .navigationTitle("Suggestions")
                    
                }
            }
        }
    }
}

struct Tips_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionsView()
    }
}
