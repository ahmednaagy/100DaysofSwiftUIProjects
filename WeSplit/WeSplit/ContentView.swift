//
//  ContentView.swift
//  WeSplit
//
//  Created by Ahmed Nagy on 4/19/20.
//  Copyright © 2020 Ahmed Nagy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @State private var checkAmount = ""
  @State private var numberOfPeople = ""
  @State private var tipPercentage = 2
  
  let tipPercentages = [10, 15, 20, 25, 0]
  
  var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople) ?? 1
    let amountPerPerson = grandTotalAmount / peopleCount
    
    return amountPerPerson
  }
  
  var grandTotalAmount: Double {
    let amount = Double(checkAmount) ?? 0
    let tipSelected = Double(tipPercentages[tipPercentage])
    
    let tipMoney = Double(amount/100 * tipSelected)
    let grandTotalCash = amount + tipMoney
    
    return grandTotalCash
  }
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount", text: $checkAmount)
            .keyboardType(.decimalPad)
          
//          Picker("Number of people", selection: $numberOfPeople) {
//            ForEach(2 ..< 100) {
//              Text("\($0) people")
//            }
//          }
          TextField("Number Of People", text: $numberOfPeople)
            .keyboardType(.decimalPad)
        }
        
        Section(header: Text("How much tip do you want to leave?")) {
          Picker("Tip Percentage", selection: $tipPercentage) {
            ForEach(0 ..< tipPercentages.count) {
              Text("\(self.tipPercentages[$0])%")
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        
        Section(header: Text("Grand total")) {
          Text("\(grandTotalAmount, specifier: "%.2f")")
        }
        
        Section(header: Text("Amount per person")) {
          Text("$\(totalPerPerson, specifier: "%.2f")")
        }
      }
      .navigationBarTitle("WeSplit")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
