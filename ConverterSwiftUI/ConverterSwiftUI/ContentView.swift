//
//  ContentView.swift
//  ConverterSwiftUI
//
//  Created by Ahmed Nagy on 4/21/20.
//  Copyright © 2020 Ahmed Nagy. All rights reserved.
//

// You need to build an app that handles unit conversions: users will select an input unit and an output unit, then enter a value, and see the output of the conversion.

/*
 - picker for input units
 - picker for output units
 - Text feild for the value of the user which he wants to convert
 - text field shows the output result
 */


import SwiftUI

struct ContentView: View {
  // meters, kilometers, feet, yards, or miles
  
  @State private var inputUnit = 0
  @State private var outputUnit = 0
  @State private var valueEnterd = ""
  let lengthUnits = ["meters", "kilometers", "feet", "yards", "miles"]
  
  
  var valueEnteredInBaseUnitMeters: Double {
    let initialValue = Double(valueEnterd) ?? 0
    var outputValue: Double = 0.0
    
    switch inputUnit {
    case 0:
      outputValue = initialValue
    case 1:
      outputValue = initialValue * 1000
    case 2:
      outputValue = initialValue / 3.281
    case 3:
      outputValue = initialValue / 1.094
    case 4:
      outputValue = initialValue * 1609
    default:
      break
    }
    return outputValue
  }
  
  var ConvertedToUnit: Double {
    var finalConversion: Double = 0.0
    
    switch outputUnit {
    case 0:
      finalConversion = valueEnteredInBaseUnitMeters
    case 1:
      finalConversion = valueEnteredInBaseUnitMeters / 1000
    case 2:
      finalConversion = valueEnteredInBaseUnitMeters * 3.281
    case 3:
      finalConversion = valueEnteredInBaseUnitMeters * 1.094
    case 4:
      finalConversion = valueEnteredInBaseUnitMeters / 1609
    default:
      break
    }
    return finalConversion
  }
  
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Your Value", text: $valueEnterd)
            .keyboardType(.numberPad)
        }
        
        // INPUT PICKER
        Section(header: Text("Please select your input unit")) {
          Picker("Your input unit", selection: $inputUnit) {
            ForEach(0 ..< lengthUnits.count) {
              Text("\(self.lengthUnits[$0])")
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        
        Section(header: Text("Please select your output unit")) {
          Picker("Your input unit", selection: $outputUnit) {
            ForEach(0 ..< lengthUnits.count) {
              Text("\(self.lengthUnits[$0])")
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        
        Section(header: Text("Your Result")) {
          Text("\(ConvertedToUnit, specifier: "%.2f")")
        }
      }
      .navigationBarTitle("Converter SwiftUI")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
