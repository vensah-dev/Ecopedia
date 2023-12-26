//
//  HomeView.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 9/17/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var dataManager = DataManager()

    var body: some View {
        NavigationStack{ 
            
            ZStack{
                Color(UIColor.systemGroupedBackground)
                    .ignoresSafeArea()
                VStack{
                    List(){
                        NavigationLink{
                            ResourceView(dataManager: dataManager)
                        }label:{
                            Label(dataManager.Suggestions[Int.random(in: 0..<dataManager.Suggestions.count)].title, systemImage: "lightbulb.2.fill")
                        }
                        
                        NavigationLink{
                            Calculate()
                        }label:{
                            Label("Find out your crabon footprint score now!", systemImage: "list.clipboard.fill")
                        }
                        
                        NavigationLink{
                            Scan()
                        }label:{
                            Label("Find out if an item is recyclable using the dictionary!", systemImage: "camera.fill")
                        }
                    }
                }

            }
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
