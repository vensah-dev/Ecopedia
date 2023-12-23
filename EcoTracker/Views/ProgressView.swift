//
//  ProgressView.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 21/12/2023.
//

import SwiftUI

struct ProgressScreen: View {
    @ObservedObject var dataManager: DataManager

    @State var targetScore: Int = 200
    @State var currentScore: Int = 496

    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                VStack(spacing: 15){
                    //Targets
                    HStack(spacing: 20){
                        FootprintWidget(title: "Current", value: currentScore)
                        FootprintWidget(title: "Target", value: targetScore)
                    }
                    .padding([.leading, .trailing], 20)

                    
                    //Calculator
                    Button(){
                        print("calculator")
                    }label:{
                        Image("Calculator")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(22)
                            .padding([.leading, .trailing], 20)
                    }
                    
                    //Review
                    Button(){
                        print("Review")
                    }label:{
                        Image("Review")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(22)
                            .padding([.leading, .trailing], 20)
                    }
                    

                    //Challenges
                    ChallengesWidget()
                    
                    Spacer(minLength: 80)

                }
                .padding(.top, 15)
            }
            .navigationTitle("Progress")

        }
    }
}

struct FootprintWidget: View {
    @State var title: String
    @State var value: Int
    var body: some View {
        ZStack{
            Color.accentColor
            VStack{
                Text(title)
                    .font(.system(size: 32, weight: .heavy, design: .rounded))
                    .padding(.bottom, 0.05)
                
                Text("Carbon Footprint \n Score")
                    .frame(width: 170, height: 50)
                    .font(.system(size: 18, weight: .regular, design: .rounded))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                
                ZStack{
                    
                    Circle()
                        .fill(Color("green"))
                        .frame(width: 315, height: 325)
                        .padding(.top, 110)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0.0, y: 0.0)
                                        
                    Text(String(value))
                        .font(.system(size: 48, weight: .heavy, design: .rounded))
                        .offset(y: -50)
                        .foregroundColor(Color.accentColor)

                }
                .frame(width: 80, height: 210)
            }
            .padding(.top, 80)
        }
        .padding(.top, 50)
        .frame(maxWidth: .infinity, maxHeight: 210)
        .cornerRadius(22)
    }
}

struct ChallengesWidget: View {
    @ObservedObject var dataManager = DataManager()

    @State var completedChallenges: Int = 0
    @State var completedChallengesPercent: Double = 0
    
    var body: some View {
        GeometryReader{ g in
            ZStack{
                Color.accentColor

                VStack(alignment: .center){
                    Text("Complete Challenges")
                        .font(.system(size: 30, weight: .heavy, design: .rounded))
                        .minimumScaleFactor(0.8)
                        .fixedSize()
                    
                    ZStack(alignment: .leading){
                        Rectangle()
                            .fill(Color.black.opacity(0.1))
                            .frame(width: 310, height: 30)
                        
                        let fillWidth = (g.size.width-100)*CGFloat(completedChallengesPercent)
                        
                        
                        
                        Rectangle()
                            .fill(Color("green"))
                            .frame(width: fillWidth, height: 30)
                    
                        HStack{
                            Text(String(completedChallenges) + "/" + String(dataManager.Challenges.count))
                                .foregroundColor(Color.black)
                                .opacity(0.5)
                                .font(.system(size: 18, weight: .medium, design: .rounded))
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                        .frame(maxWidth: .infinity, maxHeight: 20)
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                    .frame(maxWidth: .infinity, maxHeight: 20, alignment: .center)
                    
                    Image("Tick")
                        .offset(x: 150, y: -45)
                }
                .offset(y: 25)
                .padding()
                
                Spacer(minLength: 20)
                
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            .clipShape(RoundedRectangle(cornerRadius: 22))
            .padding([.leading, .trailing], 20)
        }
        .onAppear{
            setCompletedChallenges()
            setCompletedChallengesPercent()
        }

    }
    
    func setCompletedChallenges(){
        var i = 0
        for x in dataManager.Challenges{
            if(x.completed){
                i += 1
            }
        }
        
        completedChallenges = i
    }
    
    func setCompletedChallengesPercent(){
        completedChallengesPercent = Double(completedChallenges)/Double(dataManager.Challenges.count)
    }
}
