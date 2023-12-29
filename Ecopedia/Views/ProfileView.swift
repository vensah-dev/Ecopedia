//
//  ProfileView.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 26/12/2023.
//

import SwiftUI

struct ProfileIcon: View {
    @StateObject var dataManager: DataManager
    var body: some View {
        NavigationLink {
            ProfileView(dataManager: dataManager)
        } label: {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .clipShape(Circle())
        }
    }
}

struct ProfileView: View {
    @StateObject var dataManager = DataManager()

    @State var profilePictures: [Image] = [
        Image(systemName: "square.and.arrow.up.circle"),
        Image(systemName: "pencil.circle.fill"),
        Image(systemName: "square.and.pencil.circle.fill"),
        Image(systemName: "square.and.arrow.up.circle"),
        Image(systemName: "pencil.circle.fill"),
        Image(systemName: "square.and.pencil.circle.fill"),
        Image(systemName: "square.and.arrow.up.circle"),
        Image(systemName: "pencil.circle.fill"),
        Image(systemName: "square.and.pencil.circle.fill"),

    ]
    var body: some View {
        NavigationStack{
            ZStack{
                Color(UIColor.systemGroupedBackground)
                    .ignoresSafeArea()
                VStack{
                    ZStack(alignment: .center){
                        if( dataManager.Profile.pfpIndex >= 0){
                            profilePictures[ dataManager.Profile.pfpIndex]
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(maxWidth: 150, maxHeight: 150, alignment: .center)
                        }
                        else{
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(maxWidth: 150, maxHeight: 150, alignment: .center)
                        }
                    }
                    .listRowBackground(opacity(0))
                    .listRowSeparator(.hidden)
                    .frame(maxWidth: 150, maxHeight: 150, alignment: .center)
                    .padding()
                    
                    List{
                        
        //                Section{
        //                    VStack{
        //                        let columns = [GridItem(.adaptive(minimum: 80))]
        //
        //                        ScrollView(showsIndicators: false){
        //                            LazyVGrid(columns: columns, spacing: 20) {
        //                                ForEach(profilePictures.indices, id: \.self){ index in
        //                                    Button{
        //                                        dataManager.Profile.pfpIndex = index
        //                                    }label:{
        //                                        profilePictures[index]
        //                                            .resizable()
        //                                            .scaledToFit()
        //                                            .frame(width: 50, height: 50)
        //
        //                                    }
        //                                }
        //                            }
        //                        }
        //                    }
        //                }
                        
                        Section{
                            Text(  dataManager.Profile.userName)
                            Text("Current Streak: \(dataManager.Profile.streak)")
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .padding(.vertical)
            }
            .navigationTitle("Profile")

        }
    }
}

#Preview{
    ProfileView()
}
