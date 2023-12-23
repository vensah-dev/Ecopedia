//
//  Calculate.swift
//  EcoTracker
//
//  Created by Venkatesh Devendran on 9/17/23.
//

import SwiftUI

struct Calculate: View {
    @State var footPrint: Double = 0.0
    @State var showScore: Double = 0.0
    @ObservedObject var carMileage = NumbersOnly()
    @State var recycleAluminium: Bool = false
    @State var recyclePaper: Bool = false 
    
    var body: some View {
        NavigationView{
            VStack(){
                Text("Calculate Footprint")
                    .font(.system(size: 36, weight: .bold))
                    .padding(.init(top: 0, leading: 0, bottom: 25, trailing: 0))
                
                TextField("Enter car mileage", text: $carMileage.value)
                    .accessibilityLabel("Car Mileage")
                    .keyboardType(.decimalPad)
                
                Toggle("Do You Recycle Metal?", isOn: $recycleAluminium)
                    .tint(.black)
                
                Toggle("Do You Recycle Paper?", isOn: $recyclePaper)
                    .tint(.black)
                
                Button(){
                    footPrint = CalculateFootprint(mileage: Int(carMileage.value) ?? 0, metal: recycleAluminium, paper: recyclePaper)
                    showScore = 1.0
                }label: {
                    Text("Calculate")
                }
                .padding(15)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(22)
                .padding(25)
                
                Text("Score:")
                    .font(.system(size: 24, weight: .bold))
                    .opacity(showScore)
                    .padding()
                
                Text(String(footPrint))
                    .opacity(showScore)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(30)
        }
    }
}

func CalculateFootprint(mileage: Int, metal: Bool, paper: Bool ) -> Double{
    var footprint: Double = Double(mileage) * 0.79
    
    if(!metal){
        footprint += 166
    }
    if(!paper){
        footprint += 184
    }
    
    return footprint
}

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

struct Calculate_Previews: PreviewProvider {
    static var previews: some View {
        Calculate()
    }
}
