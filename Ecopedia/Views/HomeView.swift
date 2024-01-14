//
//  HomeView.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 9/17/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var dataManager: DataManager
    
    @State var targetScore: Int = 200
    @State var currentScore: Int = 496
    
    @State var percentage: Float = 100
    var body: some View {
        NavigationStack{
            ZStack{
                Color(UIColor.systemGroupedBackground)
                    .ignoresSafeArea()
                    .navigationTitle("Home")
                GeometryReader{ G in
                    
                    List{
                        HStack(spacing: 15){
                            FootprintWidget(title: "Current", value: currentScore)
                            FootprintWidget(title: "Target", value: targetScore)
                        }
                        .padding(.horizontal, 20)
                        .frame(width: G.size.width)
                        .listRowBackground(opacity(0))
                        .listRowSeparator(.hidden)
                        
                        HomeProgressWidget(progressPercent: percentage)
                            .padding(.horizontal, 20)
                            .frame(width: G.size.width)
                            .listRowBackground(opacity(0))
                            .listRowSeparator(.hidden)
                        
                        Section(header: Text("Recommended")){
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
                            
                            ForEach(randomChallenges.indices, id: \.self){index in
                                ChallengesListItem(dataManager: dataManager, index: index)
                            }
                        }
                        
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
    
    var randomChallenges: [Challenge]{
        var returnVar: [Challenge] = []
        
        for _ in 0...3{
            returnVar.append(dataManager.Challenges[Int.random(in: 0...dataManager.Challenges.count - 1)])
        }
        
        return returnVar
    }
    
    var randomSuggestions: [Suggestion]{
        var returnVar: [Suggestion] = []
        
        for _ in 0...3{
            returnVar.append(dataManager.Suggestions[Int.random(in: 0...dataManager.Suggestions.count - 1)])
        }
        
        return returnVar
    }
}

struct HomeProgressWidget: View {
    @State var progressPercent: Float
    var body: some View {
        ZStack{
            Color.accentColor

            HStack(alignment: .center){
                VStack{
                    
                    Image("GoodWork")
                        .resizable()
                        .scaledToFit()
                    
                    Text("You are doing well to achieve your carbon footprint target! ")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .minimumScaleFactor(0.5)
                        .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0.0, y: 0.0)
                }
                .padding(.vertical)
                
                VStack{
                    Gauge(value: progressPercent, in: 0...100) {
                        Image(systemName: "gauge.medium")
                            .font(.system(size: 50.0))
                    } currentValueLabel: {
                        Text("\(progressPercent.formatted(.number))")
             
                    }
                    .gaugeStyle(ProgressGaugeStyle())
                    .padding([.vertical, .trailing], 20)
                    .padding(.leading, 10)
                    .frame(maxWidth: 300, maxHeight: 300)

                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color("green"))
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .padding(.leading, 150)
                    
                    NavigationLink{
                        Text("Review").opacity(0)
                    }label:{
                        EmptyView()
                    }
                    .opacity(0)
                }
            }
            .padding(.horizontal, 10)

        }
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .frame(maxWidth: .infinity, maxHeight: 250, alignment: .center)
    }
}

struct ProgressGaugeStyle: GaugeStyle {
    func makeBody(configuration: Configuration) -> some View {
        let gradient = AngularGradient(
            gradient: Gradient(colors: [Color("green"), Color("circularProgressBar")]),
            center: .center,
            startAngle: .degrees(270),
            endAngle: .degrees(0))
        GeometryReader{ g in
            ZStack {
                let diameter = g.size.width - 50
                let strokeLength = diameter*CGFloat.pi
                let degrees = 282+(strokeLength*0.2*configuration.value)
                
                Circle()
                    .stroke(Color.black.opacity(0.15), lineWidth: 25)
     
                Circle()
                    .trim(from: 0, to: 0.2*configuration.value)
                    .stroke(Color("circularProgressBar"), style: StrokeStyle(lineWidth: 25, lineCap: .round))
                    .rotationEffect(.degrees(270))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                Circle()
                    .trim(from: 0, to: 0.8*configuration.value)
                    .stroke(gradient, style: StrokeStyle(lineWidth: 25, lineCap: .round))
                    .rotationEffect(.degrees(degrees))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
     
                VStack {

                    Text(String(Int(round(configuration.value * 100))) + "%")
                        .font(.system(size: 30, weight: .heavy, design: .rounded))
                        .minimumScaleFactor(0.5)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0.0, y: 0.0)
                }
     
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
 
    }
}

extension View {
    func innerShadow<S: Shape>(using shape: S, angle: Angle = .degrees(0), color: Color = .black, width: CGFloat = 6, blur: CGFloat = 6) -> some View {
        return self
    }
}
