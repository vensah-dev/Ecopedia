//
//  Calculate.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 9/17/23.
//

import SwiftUI
import UIKit

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct PlaceHolderWidget: View {
    @State var title: String
    var body: some View {
        ZStack{
            Color.accentColor
            VStack{
                Text(title)
                    .font(.system(size: 32, weight: .black, design: .rounded))
                    .foregroundColor(.white)
                
                Text("Work in progress")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .frame(maxWidth: .infinity, minHeight: 100, alignment: .center)
        .padding(.horizontal, 20)

    }
}

struct CalculatorView: View {
    @StateObject var dataManager: DataManager

    var body: some View {
        NavigationView{
            CalculatorFormView(dataManager: dataManager)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .onTapGesture {
                hideKeyboard()
            }
            .navigationTitle("Calculator")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

func Numberify(value: String) -> Double{
    Double(value.filter {$0.isNumber}) ?? 0.0
}

func CalculateFootprint(data: CalculatorData) -> Double{
    var footprint: Double = Double(Numberify(value: data.ElectrictyBill)) * 105
    footprint += Double(Numberify(value: data.GasBill)) * 105
    
    footprint += Double(Numberify(value: data.carMileage)) * 0.79
    footprint += Double(Numberify(value: data.FlightsUnder4)) * 1100
    footprint += Double(Numberify(value: data.FlightsOver4)) * 4400
            
    if(!data.recycleAluminium){
        footprint += 166
    }
    if(!data.recyclePaper){
        footprint += 184
    }
    
    return footprint
}

#if canImport(UIKit)
extension View {
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct ScoreView: View {
    @Environment (\.dismiss) var dismiss
    
    @State var footPrint: Double = 0.0
    @State var ShowGuide: Bool = false
    
    var body: some View {
        ZStack{
            Color.accentColor
                .ignoresSafeArea()

            
            VStack{
                Text(String(footPrint))
                    .font(.system(size: 48, weight: .heavy, design: .rounded))

                
                Button(){
                    dismiss()
                } label:{
                    ZStack{
                        VisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
                        Text("Exit")
                            .foregroundColor(Color("green"))
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .frame(width: 120, height: 50)
                    .padding(.horizontal)
                }

            }
        }
    }
}

struct CalculatorFormView: View {
    @StateObject var dataManager: DataManager
    @Environment(\.presentationMode) var presentationMode
    @State var dismiss: Bool = false

    @State var showScore: Bool = false
    
    @State var electrictyBill: String = ""
    @State var gasBill: String = ""
    
    @State var carMileage: String = ""
    @State var flightsUnder4: String = ""
    @State var flightsOver4: String = ""
    
    @State var recycleAluminium: Bool = false
    @State var recyclePaper: Bool = false
    
    var body: some View {
        ZStack{
            Color(UIColor.systemGroupedBackground)
                .ignoresSafeArea()
            VStack{
                Form{
                    Section(header: Text("Utilities")){
                        HStack{
                            Text("Electricity Bill")
                                .font(.system(size: 20))
                            
                            Spacer()
                            
                            TextField("Enter electricity bill", text: $electrictyBill, onCommit:{hideKeyboard()})
                                .keyboardType(.decimalPad)
                                .frame(maxWidth: 150, alignment: .trailing)
                        }
                        
                        HStack{
                            Text("Gas Bill")
                                .font(.system(size: 20))
                            
                            
                            Spacer()
                            
                            TextField("Enter gas bill", text: $gasBill, onCommit:{hideKeyboard()})
                                .keyboardType(.decimalPad)
                                .frame(maxWidth: 150, alignment: .trailing)
                            
                        }
                    }
                    
                    Section(header: Text("Transport")){
                        HStack{
                            Text("Car Mileage")
                                .font(.system(size: 20))
                            
                            
                            Spacer()
                            
                            
                            TextField("Enter car mileage", text: $carMileage, onCommit:{hideKeyboard()})
                                .keyboardType(.decimalPad)
                                .frame(maxWidth: 150, alignment: .trailing)
                            
                        }
                        
                        HStack{
                            Text("Flights taken under 4 hours")
                                .font(.system(size: 20))
                            
                            
                            Spacer()
                            
                            
                            TextField("Enter car mileage", text: $flightsUnder4, onCommit:{hideKeyboard()})
                                .keyboardType(.decimalPad)
                                .frame(maxWidth: 150, alignment: .trailing)
                            
                        }
                        
                        HStack{
                            Text("Flights taken over 4 hours")
                                .font(.system(size: 20))
                            
                            
                            Spacer()
                            
                            
                            TextField("Enter car mileage", text: $flightsOver4, onCommit:{hideKeyboard()})
                                .keyboardType(.decimalPad)
                                .frame(maxWidth: 150, alignment: .trailing)
                            
                        }
                    }
                    
                    Section(header: Text("Recycling")){
                        Toggle("Do you recycle metal?", isOn: $recycleAluminium)
                            .font(.system(size: 20))
                            .tint(.accentColor)
                        
                        
                        Toggle("Do you recycle metal?", isOn: $recyclePaper)
                            .font(.system(size: 20))
                            .tint(.accentColor)
                    }
                }
                
                Button(){
                    showScore = true
                    
                } label:{
                    ZStack{
                        VisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
                        Text("Calculate")
                            .foregroundColor(Color("green"))
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .frame(width: 120, height: 50)
                    .padding(.horizontal)


                }
                .fullScreenCover(isPresented: $showScore){
                    ScoreView(footPrint: CalculateFootprint(data: CalculatorData(ElectrictyBill: electrictyBill, GasBill: gasBill, carMileage: carMileage, FlightsUnder4: flightsUnder4, FlightsOver4: flightsOver4, recycleAluminium: recycleAluminium, recyclePaper: recyclePaper)))
                }
                .disabled(isFormEmpty)
            }
        }
    }
    
    var isFormEmpty: Bool{
        if(electrictyBill.isEmpty || gasBill.isEmpty || carMileage.isEmpty || flightsOver4.isEmpty || flightsUnder4.isEmpty){
            return true
        }
        return false
    }
}
