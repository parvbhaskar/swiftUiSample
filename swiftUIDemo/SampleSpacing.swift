//
//  SampleSpacing.swift
//  swiftUIDemo
//
//  Created by Parv Bhaskar on 18/09/21.
//

import SwiftUI

struct SampleSpacing: View
{

    var body: some View
    {
        ZStack
        {
            Image("111")
                .resizable()
                .ignoresSafeArea(.all)
            VStack
            {
                HStack
                {
                    Text("Hardcode\n Avo Toast")
                        .fontWeight(.heavy)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .foregroundColor(.white)
                    
                    
                    Spacer()
                    Image("2")
                        .resizable()
                        .frame(width: 60, height: 60)
                }
                
                Spacer()
                
                Text("Energize with this healthy and hearty breakfast.")
                    .padding(5)
                    .foregroundColor(.white)
                    .font(.body)
            }
        }
    }
    
}

struct SampleSpacing_Previews: PreviewProvider {
    static var previews: some View {
        SampleSpacing()
    }
}
