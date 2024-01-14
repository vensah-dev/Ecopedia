//
//  ProgressView.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 21/12/2023.
//

import SwiftUI
import UIKit

struct ProgressScreen: View {
    @StateObject var dataManager: DataManager

    @State var targetScore: Int = 200
    @State var currentScore: Int = 496
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                VStack(spacing: 15){

                    HStack(spacing: 15){
                        FootprintWidget(title: "Current", value: currentScore)
                        FootprintWidget(title: "Target", value: targetScore)
                    }

                    
                    //Calculator
                    NavigationLink(){
                        CalculatorView()
                    }label:{
                        Image("Calculator")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)

                    }
                    
                    //Review
                    Button(){
                        print("Review")
                    }label:{
                        Image("Review")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)

                    }
                    

                    //Challenges
                    CompletedChallengesWidget()

                    
                    Spacer(minLength: 180)

                }
                .padding(.top, 15)
                .padding(.horizontal, 20)

            }
            .navigationTitle("Progress")
            .toolbar{
                ProfileIcon(dataManager: dataManager)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            .padding(.bottom, -100)
        }
    }
}

struct FootprintWidget: View {
    @State var title: String
    @State var value: Int
    var body: some View {
        ZStack(alignment: .center){
            Color.accentColor
            VStack(alignment: .center, spacing: 20){
                VStack{
                    Text(title)
                        .font(.system(size: 31, weight: .heavy, design: .rounded))
                        .offset(y: 10)
                    
                    Text("Carbon Footprint \n Score")
                        .frame(width: 170, height: 50)
                        .font(.system(size: 15, weight: .regular, design: .rounded))
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.3)
                        .offset(y: -5)
                }
                .offset(y: -80)
                
                ZStack{
                    
                    Circle()
                        .fill(Color("green").opacity(0.7))
                        .frame(width: 315, height: 325)
                        .padding(.top, 110)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0.0, y: 0.0)
                                        
                    Text(String(value))
                        .font(.system(size: 48, weight: .heavy, design: .rounded))
                        .offset(y: -50)
                        .foregroundColor(Color.accentColor)

                }
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .frame(width: 60, height: 0)
            }
            .padding(.top, 80)
            .padding(.horizontal, -20)
        }
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .frame(maxWidth: .infinity, maxHeight: 210, alignment: .center)

    }
}

struct CompletedChallengesWidget: View {
    @ObservedObject var dataManager = DataManager()

    @State var completedChallenges: Int = 0
    @State var completedChallengesPercent: Double = 0
    
    var body: some View {
        GeometryReader{ g in
            ZStack{
                Color.accentColor
                ZStack{
                    VStack(alignment: .center){
                        Text("Complete Challenges")
                            .font(.system(size: 36, weight: .heavy, design: .rounded))
                            .minimumScaleFactor(0.7)
                            .padding(.bottom, -5)
                        ZStack{
                            ZStack(alignment: .leading){
                                Rectangle()
                                    .fill(Color.black.opacity(0.1))
                                
                                let fillWidth = (g.size.width-70)*CGFloat(completedChallengesPercent)
                                
                                Rectangle()
                                    .fill(Color("green"))
                                    .frame(width: fillWidth, height: 30)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 100))
                            .frame(maxWidth: .infinity, maxHeight: 30, alignment: .center)
                            
                            Text(String(completedChallenges) + "/" + String(dataManager.Challenges.count))
                                .foregroundColor(Color.black)
                                .opacity(0.5)
                                .font(.system(size: 18, weight: .medium, design: .rounded))
                            
                            HStack(){
                                
                                VStack(alignment: .trailing){
                                    Image("Tick")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 55, height: 55, alignment: .trailing)
                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0.0, y: 0.0)
                                        .offset(x: 5)
                                }
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        
                        Spacer(minLength: 100)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                }
                .offset(y: 55)
                .padding(.horizontal)

            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            .clipShape(RoundedRectangle(cornerRadius: 18))
        }
        .onAppear{
            setCompletedChallenges()
            setCompletedChallengesPercent()
        }

    }
    
    func setCompletedChallenges(){
        var i = 0
        for x in dataManager.Challenges{
            if(x.completed == "Complete"){
                i += 1
            }
        }
        
        completedChallenges = i
    }
    
    func setCompletedChallengesPercent(){
        completedChallengesPercent = Double(completedChallenges)/Double(dataManager.Challenges.count)
    }
}
