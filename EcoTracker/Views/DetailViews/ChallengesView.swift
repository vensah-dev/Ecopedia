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
    
    @State var selectedFilter = -1
    @State var filters = ["Complete", "Incomplete"]
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(UIColor.systemBackground)
                    .ignoresSafeArea()
                VStack{
                    
                    FilterView(selectedFilter: $selectedFilter, filters: filters)
                        .frame(maxHeight: 40)
                        .padding(.horizontal, 20)
                    
                    List{
                        Section{
                            ForEach(displayChallenges.indices, id: \.self){index in
                                if(selectedFilter >= 0){
                                    if(displayChallenges[index].completed == filters[selectedFilter]){
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
                                else{
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
                    }
                    .searchable(text: $SearchTerms)
                }
            }

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
        if(SearchTerms.isEmpty){
            return dataManager.Challenges
        }
        
        return dataManager.Challenges.filter{$0.title.lowercased().contains(SearchTerms.lowercased())}
    }
}

struct ChallengeWidget: View {
    @StateObject var dataManager = DataManager()

    @State var challenge = Challenge()
    
    var body: some View {
        ZStack(){
            Color.accentColor
                VStack{
                    Text(challenge.title)
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.7)
                        .padding([.bottom, .top], 1)
                        .padding([.trailing, .leading], 10)
                    
                    Text(challenge.description)
                    .font(.system(size: 17, weight: .none, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .lineLimit(350)
                    .padding([.trailing, .leading], 20)
                }
                ZStack{
                    
                    Rectangle()
                        .fill(
                            LinearGradient(stops: [
                                Gradient.Stop(color: Color("AccentColor").opacity(0), location: 0),
                                Gradient.Stop(color: Color("AccentColor"), location: 0.5),
                            ], startPoint: .top, endPoint: .bottom)
                        )
                        .padding(.top, 85)
                        .frame(maxWidth: .infinity, maxHeight: 160)
                    
                    HStack{
                        
                        Text(challenge.difficulty)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(Color("green"))
                            .minimumScaleFactor(0.01)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .padding([.top], 115)
                            .padding([.leading, .trailing], 20)

                        
                        HStack(spacing: 20){
                            Button(){
                                setChallenge()
                                
                            }label:{
                                Image(systemName:"arrow.clockwise")
                                    .font(.system(size: 22, weight: .heavy))
                                    .foregroundColor(Color("green"))
                            }
                            
                            NavigationLink(){
                                ChallengeDetailView(challenge: $challenge)
                            }label:{
                                Image(systemName:"chevron.right")
                                    .font(.system(size: 22, weight: .heavy))
                                    .foregroundColor(Color("green"))
                            }
                        }
                        .padding([.top], 115)
                        .padding([.leading, .trailing], 20)
                    }

                }
        }
        .frame(maxWidth: .infinity, maxHeight: 160)
        .cornerRadius(22)
        .padding([.trailing, .leading, .top])
        .onAppear(){
            setChallenge()
        }
    }
    
    func setChallenge(){
        challenge = dataManager.Challenges[Int.random(in: 0...dataManager.Challenges.count-1)]
        
    }
}

struct FilterView: View {
    @Binding var selectedFilter: Int
    @State var filters: [String]
        
    var body: some View {
        HStack(spacing: 0){
            Button{
                selectedFilter = -1
            }label:{
                let selected: Bool = selectedFilter == -1
                
                Text("All")
                    .foregroundColor(selected ? .white : Color.accentColor)
                    .padding(.init(top: 8, leading: 15, bottom: 8, trailing: 15))
                    .background(selected ? Color.accentColor : Color.accentColor.opacity(0.0))
                    .cornerRadius(15)
                    .bold(selected)
            }
            
            Divider()
                .padding(.init(top: 5, leading: 15, bottom: 5, trailing: 0))
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(filters.indices, id: \.self){ i in
                        Button{
                            selectedFilter = i
                        }label:{
                            let selected: Bool = selectedFilter == i
                            
                            Text(filters[i])
                                .foregroundColor(selected ? .white : Color.accentColor)
                                .padding(.init(top: 8, leading: 15, bottom: 8, trailing: 15))
                                .background(selected ? Color.accentColor : Color.accentColor.opacity(0.0))
                                .cornerRadius(15)
                                .bold(selected)
                        }
                        .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
                    }
                }
            }
        }
    }
}

