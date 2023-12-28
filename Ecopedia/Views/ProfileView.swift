//
//  ProfileView.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 26/12/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var dataManager: DataManager

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
            List{
                Section{
                    VStack{
                        
                        ZStack(alignment: .center){
                            if( dataManager.Profile.pfpIndex >= 0){
                                profilePictures[ dataManager.Profile.pfpIndex]
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                            }
                            else{
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                            }
                        }
                        .listRowBackground(opacity(0))
                        .listRowSeparator(.hidden)
                        .frame(maxWidth: 150, maxHeight: 150)
                        .padding()
                        
                        let columns = [GridItem(.adaptive(minimum: 80))]
                        
                        ScrollView(showsIndicators: false){
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(profilePictures.indices, id: \.self){ index in
                                    Button{
                                        dataManager.Profile.pfpIndex = index
                                    }label:{
                                        profilePictures[index]
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
                
                Section{
                    Text(  dataManager.Profile.userName)
                    Text("Current Streak: \(dataManager.Profile.streak)")
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}
