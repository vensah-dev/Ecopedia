//
//  TipDetailView.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 9/17/23.
//

import SwiftUI

struct SuggestionDetailView: View {
    @State var suggestion: Suggestion
    var body: some View {
        Text(suggestion.tip)
            .font(.system(size: 30, weight: .bold))
            .padding(10)
        
        Text(suggestion.detail)
            .font(.system(size: 17, weight: .none))
            .padding(25)
    }
}
