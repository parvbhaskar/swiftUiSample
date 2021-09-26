//
//  SampleCardView.swift
//  swiftUIDemo
//
//  Created by Parv Bhaskar on 18/09/21.
//

import SwiftUI

struct SampleCardView: View
{
    @State private var isHearted = false
    @State private var numberHeart = 999

    var body: some View
    {
        VStack
        {
            Image("111")
                .resizable()
                .cornerRadius(20)
                .padding()
                .shadow(radius: 10)
            
            HStack
            {
                Button(action: {
                    isHearted.toggle()
                    
                    if isHearted
                    {
                        numberHeart += 1
                    }
                    else
                    {
                        numberHeart -= 1
                    }
                }, label: {
                    if isHearted
                    {
                        Image(systemName: "heart.fill")
                            .renderingMode(.original)
                    }
                    else
                    {
                        Image(systemName: "heart")
                            .renderingMode(.original)

                    }
                })

                Text(String(numberHeart))
            }
                        
            Text("This curtain is totally amazing")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.blue)
                .shadow(color: .gray, radius: 0.1, x: 2, y: 2)
        }
    }
}


struct SampleCardView_Previews: PreviewProvider {
    static var previews: some View {
        SampleCardView()
    }
}
