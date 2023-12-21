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

            VStack{
                ZStack(alignment:.bottom){
                    Color.accentColor
                        VStack{
                            Text("Zero-Waste Challenge")
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .minimumScaleFactor(0.01)
                                .truncationMode(.middle)
                                .padding([.top], 10)
                                .padding([.bottom], 1)
                                .padding([.trailing, .leading])
                            
                            Text("""
                                Aim to produce as little waste as possible for a week or a month.
                                 Use reusable containers, bags, and utensils.
                                 Choose products with minimal or recyclable pacDaily Challenge
                                 [kagingr.
                                """)
                            .font(.system(size: 17, weight: .none, design: .rounded))
                            .multilineTextAlignment(.center)
                            .lineLimit(350)
                            .padding([.trailing, .leading], 15)
                        }
                        ZStack{
                            Rectangle()
                                .fill(
                                    LinearGradient(stops: [
                                        Gradient.Stop(color: Color("AccentColor").opacity(0), location: 0),
                                        Gradient.Stop(color: Color("AccentColor"), location: 0.50),
                                    ], startPoint: .top, endPoint: .bottom)
                                )
                                .padding(.top, 90)
                                .frame(width: .infinity, height: 135)
                            
                            Button(){
                                
                            }label:{
                                
                            }
                            
                        }

                }
                .frame(maxWidth: .infinity, maxHeight: 135)
                .cornerRadius(22)
                .padding([.trailing, .leading, .top])
                .listRowBackground(Color.accentColor.opacity(0))
                
                List{
                    
                    
                    Section{
                        ForEach(Suggestions, id: \.id){suggestion in
                            NavigationLink {
                                SuggestionDetailView(suggestion: suggestion)
                            } label: {
                                Text(suggestion.tip)
                                    .foregroundColor(Color("AccentText"))
                            }
                        }
                    }
                }
                .navigationTitle("Suggestions")
            }
        }
    }
}

struct Tips_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionsView()
    }
}
