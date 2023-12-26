//
//  TipDetailView.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 9/17/23.
//

import SwiftUI

struct SuggestionDetailView: View {
    @StateObject var dataManager = DataManager()

    @State var suggestion: Suggestion 
    var body: some View {
        NavigationStack{ 
            List{
                Section{
                    Text(suggestion.title)
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .listRowBackground(opacity(0))
                }
                .navigationTitle("Challenge")
                
                Section(header: Text("Description")){
                    Text(suggestion.detail)
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }
}
