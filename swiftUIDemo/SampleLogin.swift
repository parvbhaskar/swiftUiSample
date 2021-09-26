//
//  SampleLogin.swift
//  swiftUIDemo
//
//  Created by Parv Bhaskar on 18/09/21.
//

import SwiftUI

struct SampleLogin: View
{
    
    @State private var nameTextFieldValue = ""
    @State private var passwordTextFieldValue = ""

    var body: some View
    {
        ZStack
        {
            RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 470)
            
            VStack(spacing: 40)
            {
                Text("Welcom to the App")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.title)
                
                HStack
                {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 16, height: 16, alignment: .center)
                        .foregroundColor(.secondary)
                        
                    TextField("Enter Name", text: $nameTextFieldValue)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                
                HStack
                {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 16, height: 16, alignment: .center)
                        .foregroundColor(.secondary)
                        
                    TextField("Enter Password", text: $passwordTextFieldValue)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                
                
                Button(action: {
                    print(nameTextFieldValue)
                    print(passwordTextFieldValue)
                }, label: {
                    Text("Login")
                        .padding()
                })
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
                

            }
            .padding(.horizontal, 40)
        }
    }
    
    
    
    
    
    
}


struct SampleLogin_Previews: PreviewProvider {
    static var previews: some View {
        SampleLogin()
    }
}
