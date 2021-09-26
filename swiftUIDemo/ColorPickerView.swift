//
//  ColorPickerView.swift
//  swiftUIDemo
//
//  Created by Parv Bhaskar on 24/09/21.
//

import SwiftUI

struct ColorPickerView: View {
    @State var red: Double = 0
    @State var blue: Double = 0
    @State var green: Double = 0
    
    var body: some View {
       
        VStack
        {
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color(red: red/255, green: green/255, blue: blue/255))
                .border(Color.black, width: 1)
            
            SliderView(value: $red, label: "Red")
            SliderView(value: $green, label: "Green")
            SliderView(value: $blue, label: "Blue")
        }
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView()
    }
}
