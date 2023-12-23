//
//  ChallengeView.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 21/12/2023.
//

import SwiftUI

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
