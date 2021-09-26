//
//  SampleView1.swift
//  swiftUIDemo
//
//  Created by Parv Bhaskar on 22/09/21.
//

import SwiftUI

struct SpinToWin: View
{
    @State private var symbols = ["star", "apple", "cherry"]
    private var betAmount = 5
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var credits = 1000
    @State private var backgrounds = Array(repeating: Color.white, count: 9)

    var body: some View
    {
        ZStack
        {
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .ignoresSafeArea()
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .ignoresSafeArea()
            VStack
            {
                Spacer()
                
                HStack
                {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("SwiftUI Slots!")
                        .fontWeight(.bold)
//                        .font(.title)
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                .scaleEffect(2)
                
                Spacer()
                
                HStack
                {
                    Text("Credits:")
                        .foregroundColor(.black)
                    Text(String(credits))
                        .foregroundColor(.black)
                }
                .padding(10)
                .background(Color.white.opacity(0.5))
                .cornerRadius(20)
                
                Spacer()
                VStack
                {
                    HStack
                    {
                        Spacer()
                        SpinToWinImageView(imageName: $symbols[numbers[0]])
                        SpinToWinImageView(imageName: $symbols[numbers[1]])
                        SpinToWinImageView(imageName: $symbols[numbers[2]])
                        Spacer()
                    }
                    HStack
                    {
                        Spacer()
                        SpinToWinImageView(imageName: $symbols[numbers[3]])
                        SpinToWinImageView(imageName: $symbols[numbers[4]])
                        SpinToWinImageView(imageName: $symbols[numbers[5]])
                        Spacer()
                    }
                    HStack
                    {
                        Spacer()
                        SpinToWinImageView(imageName: $symbols[numbers[6]])
                        SpinToWinImageView(imageName: $symbols[numbers[7]])
                        SpinToWinImageView(imageName: $symbols[numbers[8]])
                        Spacer()
                    }

                }
                
                Spacer()
                
                HStack
                {
                    VStack
                    {
                        Button(action: {
                            // process a single spin
                            processResults()
                        }, label: {
                            Text("Spin")
                                .bold()
                        })
                        .padding(10)
                        .padding(.horizontal, 30)
                        .foregroundColor(.white)
                        .background(Color.pink)
                        .cornerRadius(20)

                        Text("5 credits")
                            .foregroundColor(.white)
                            .font(.footnote)
                    }

                    VStack
                    {
                        Button(action: {
                            // process multiple spin
                            processResults(full: true)
                        }, label: {
                            Text("Max Spin")
                                .bold()
                        })
                        .padding(10)
                        .padding(.horizontal, 30)
                        .foregroundColor(.white)
                        .background(Color.pink)
                        .cornerRadius(20)

                        Text("25 credits")
                            .foregroundColor(.white)
                            .font(.footnote)
                    }

                }
                
                
                Spacer()
            }
        }
    }

    
    func processResults(full: Bool = false)
    {
        if full
        {
            self.numbers = self.numbers.map { _ in
                Int.random(in: 0...self.symbols.count - 1)
            }
        }
        else
        {
            self.numbers[3] = Int.random(in: 0...self.symbols.count - 1)
            self.numbers[4] = Int.random(in: 0...self.symbols.count - 1)
            self.numbers[5] = Int.random(in: 0...self.symbols.count - 1)
        }
        
        processWin()
    }
    
    func processWin(full: Bool = false)
    {
        print("========")
        print(numbers)
        print("========")
        
        var matches = 0
        if full
        {
            // Top row
            if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2]
            {
                print(" Top row")
                matches += 1
            }
            // Middle row
            if self.numbers[3] == self.numbers[4] && self.numbers[4] == self.numbers[5]
            {
                print(" Middle row")
                matches += 1
            }
            //BottomRow
            if self.numbers[6] == self.numbers[7] && self.numbers[7] == self.numbers[8]
            {
                print(" Bottom row")
                matches += 1
            }
            //firstDiagonal
            if self.numbers[0] == self.numbers[4] && self.numbers[4] == self.numbers[8]
            {
                print(" First Diagonal")
                matches += 1
            }
            
            //secondDiagonal
            if self.numbers[2] == self.numbers[4] && self.numbers[4] == self.numbers[6]
            {
                print(" Second diagonal")
                matches += 1
            }
        }
        else
        {
            if self.numbers[3] == self.numbers[4] && self.numbers[4] == self.numbers[5]
            {
                matches += 1
            }
        }
        print("number of matches \(matches)")
        
        if matches > 0
        {
            credits += betAmount * matches * 2
        }
        else if !full
        {
            credits -= betAmount
        }
        else
        {
            credits -= betAmount * 5
        }
    }
}

struct SampleView1_Previews: PreviewProvider {
    static var previews: some View {
        SpinToWin()
    }
}
