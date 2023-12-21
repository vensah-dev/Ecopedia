//
//  ContentView.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 9/17/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView{
                HomeView()
                    .tabItem(){
                        Label("Home", systemImage: "house")
                    }
                
                SuggestionsView()
                    .tabItem(){
                        Label("Suggestions", systemImage: "lightbulb.2.fill")
                    }
                
                Calculate()
                    .tabItem(){
                        Label("Progress", systemImage: "chart.bar.fill")
                    }
                
                Scan()
                    .tabItem(){
                        Label("Scan", systemImage: "camera")
                    }
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}

