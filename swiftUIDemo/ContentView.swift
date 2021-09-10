//
//  ContentView.swift
//  swiftUIDemo
//
//  Created by Parv Bhaskar on 03/08/21.
//

import SwiftUI

var totalPages = 3

struct ContentView: View
{
    @AppStorage("currentPage") var currentPage = 1
    @AppStorage("homePage") var homePage = false
    
    var body: some View
    {
        if homePage
        {
            HomeView()
        }
        else
        {
            // condition to check if user already went through the onboarding screen then go to home page directly
            if currentPage > totalPages
            {
                Home()
            }
            else
            {
                WalkThroughScreen()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Home Page ...
struct Home: View
{
    @AppStorage("homePage") var homePage = false

    @State private var name: String = ""
    @State private var password: String = ""
    let verticalPaddingForForm = 40.0
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .center, startRadius: 100, endRadius: 470)
            VStack(spacing: CGFloat(verticalPaddingForForm)) {
                Text("Welcome To Sample App")
                    .font(.title)
                    .foregroundColor(Color.white)
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.secondary)
                    TextField("Enter your name", text: $name)
                        .foregroundColor(Color.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                
                HStack {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 16.0, height: 16.0) .foregroundColor(.secondary)
                    SecureField("Enter password", text: $password)
                        .foregroundColor(Color.black)
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                
                Button(action: {
                    if name.isEmpty || password.isEmpty
                    {
                        alertMessage(title: "Error", message: "Please fill detais before continue")
                    }
                    else
                    {
                        homePage = true
                    }
                }) {
                    Text("Login")
                        .padding()
                    
                }
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                
            }.padding(.horizontal, CGFloat(verticalPaddingForForm))
            
        }
    };
}



// WalkThrough Screens...
struct WalkThroughScreen: View
{
    @AppStorage("currentPage") var currentPage = 1

    var body: some View
    {
        ZStack
        {
            // Show the desired onboarding screen according to current page value
            if currentPage == 1
            {
                ScreenView(image: "1", title: "Step 1", detail: "", bgColor: Color("color1"))
                    .transition(.scale)
            }
            else if currentPage == 2
            {
                ScreenView(image: "2", title: "Step 2", detail: "", bgColor: Color("color2"))
                    .transition(.scale)
            }
            else if currentPage == 3
            {
                ScreenView(image: "3", title: "Step 3", detail: "", bgColor: Color("color3"))
                    .transition(.scale)
            }
        }
        .overlay(
            // Adding a overlay button on the top of onboarding screen so it will always be clickable
            Button(action: {
                withAnimation(.easeInOut) {
                    
                    // as current page is a AppStorage object so changing value of it will relaod the whole view
                    // just putting this condition for resetting the current page value when reaching the last index for making non ending loop
//                    if currentPage < totalPages
//                    {
                        currentPage += 1
//                    }
//                    else
//                    {
//                        currentPage = 1
//                    }
                }
                
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(
                        ZStack
                        {
                            // Adding extracircle for progress indicator
                            Circle()
                                .stroke(Color.black.opacity(0.04), lineWidth: 4)
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPages))
                                .stroke(Color.pink, lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(-15)
                    )
            })
            , alignment: .bottom
        )
    }
}

struct ScreenView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack(spacing: 20)
        {
            HStack
            {
                if currentPage == 1
                {
                    Text("Hello Member !!")
                        .font(.title)
                        .fontWeight(.heavy)
                        .kerning(1.4)
                }
                else
                {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            currentPage -= 1
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut) {
                        currentPage = 4
                    }
                    
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
                
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer(minLength: 0)
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            Text("Lorem ipsum is dummy text used Lorem ipsum is dummy text used Lorem ipsum is dummy text used")
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 0)
        }
        .background(bgColor.ignoresSafeArea())
    }
}

func alertMessage(title: String, message: String) {
    let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
    }
    alertVC.addAction(okAction)
    
    let viewController = UIApplication.shared.windows.first!.rootViewController!
    viewController.present(alertVC, animated: true, completion: nil)
}
