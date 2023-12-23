//
//  AllSuggestionsView.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 21/12/2023.
//

import SwiftUI

struct SuggestionsView: View {
    @ObservedObject var dataManager: DataManager

    @State var SearchTerms: String = ""
    @Environment (\.dismiss) private var dismiss
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(displaySuggestions, id: \.id){suggestion in
                        NavigationLink {
                            SuggestionDetailView(suggestion: suggestion)
                        } label: {
                            Text(suggestion.title)
                                .foregroundColor(Color("green"))
                                .multilineTextAlignment(.leading)
                                .bold()
                        }
                    }
                }
            }
            .searchable(text: $SearchTerms)
            .navigationTitle("Suggestions")
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
    
    var displaySuggestions: [Suggestion]{
        var s: [Suggestion] = []
        
        if(SearchTerms.isEmpty){
            s = dataManager.Suggestions
        }
        else{
            s = dataManager.Suggestions.filter{$0.title.contains(SearchTerms)}
        }
        
        return s
    }
}
