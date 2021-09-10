//
//  HomeView.swift
//  swiftUIDemo
//
//  Created by Parv Bhaskar on 10/09/21.
//

import SwiftUI

class SourceOfTruth: ObservableObject{
    @Published var count = 0
}

struct HomeView : View {
    
    
    @State private var selection = 0
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            NavigationView {
                TabView(selection: $selection)
                {
//                    Text("Home Tab")
//                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    List(1...10, id: \.self) { index in
                        NavigationLink(
                            destination: Text("Item #\(index) Details"),
                            label: {
                                Text("Item #\(index)")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                            })
                            .navigationTitle("TabView Demo")
                        
                    }
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(0)
                    
//                    Text("Bookmark Tab")
//                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    MenuView()
                        .tabItem {
                            Image(systemName: "bookmark.circle.fill")
                            Text("Bookmark")
                        }
                        .tag(1)
                    
                    Text("Video Tab")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "video.circle.fill")
                            Text("Video")
                        }
                        .tag(2)
                    
                    Text("Profile Tab")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .tabItem {
                            Image(systemName: "person.crop.circle")
                            Text("Profile")
                        }
                        .tag(3)
                }
                .onAppear() {
                    UITabBar.appearance().barTintColor = .white
                }
                .accentColor(.red)
                .navigationTitle("TabView Demo")
            }
            Button(action: {
                selection = (selection + 1) % 4
            }) {
                Text("Next")
                    .font(.system(.headline, design: .rounded))
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10.0)
                    .padding()
                
            }
        }
    }
}

struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                MenuContent()
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)

                Spacer()
            }
        }
    }
}

struct MenuContent: View {
    var body: some View {
        List {
            Text("My Profile").onTapGesture {
                print("My Profile")
            }
            Text("Posts").onTapGesture {
                print("Posts")
            }
            Text("Logout").onTapGesture {
                print("Logout")
            }
        }
    }
}


struct MenuView: View {
    @State var menuOpen: Bool = false
    
    var body: some View {
        ZStack {
            if !self.menuOpen {
                Button(action: {
                    self.openMenu()
                }, label: {
                    Text("Open")
                })
            }

            SideMenu(width: 270,
                     isOpen: self.menuOpen,
                     menuClose: self.openMenu)
        }
    }
    
    func openMenu() {
        self.menuOpen.toggle()
    }
}
