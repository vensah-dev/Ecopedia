//
//  ContentView.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 9/17/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataManager = DataManager()

    var body: some View {
        VStack {
            TabView{
                HomeView(dataManager: dataManager)
                    .tabItem(){
                        Label("Home", systemImage: "house")
                    }
                
                ResourceView(dataManager: dataManager)
                    .tabItem(){
                        Label("Resources", systemImage: "list.clipboard.fill")
                    }
                
                ProgressScreen(dataManager: dataManager)
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

