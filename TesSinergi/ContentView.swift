//
//  ContentView.swift
//  TesSinergi
//
//  Created by Ilyasa Azmi on 09/01/20.
//  Copyright © 2020 Ilyasa Azmi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var number: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                TextField(" Enter some text", text: $number)
                    .keyboardType(.numberPad)
                    .border(Color.black)
                    .padding()
                Text("Text entered:")
                // 3.
                
                HStack {
                    Button(action: {
                        self.buttonOne()
                    }) {
                        HStack {
                            Text("1")
                                .fontWeight(.semibold)
                                .font(.title)
                        }
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                    }
                    .padding()
                    
                    Button(action: {
                        self.buttonTwo()
                    }) {
                        HStack {
                            Text("2")
                                .fontWeight(.semibold)
                                .font(.title)
                        }
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                    }
                    .padding()
                }
                
                HStack {
                    Button(action: {
                        self.buttonThree()
                    }) {
                        HStack {
                            Text("3")
                                .fontWeight(.semibold)
                                .font(.title)
                        }
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                    }
                    .padding()
                    
                    Button(action: {
                        self.buttonFour()
                    }) {
                        HStack {
                            Text("4")
                                .fontWeight(.semibold)
                                .font(.title)
                        }
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                    }
                    .padding()
                }
                .padding(.bottom, 30)
                
                VStack (alignment: .leading) {
                    Text("Result")
                }
                .padding(.bottom, 30)
                
                ResultView()
            }
        }
        
    }
    
    func buttonOne() {
        let startnumber = 1
        let intNumber = Int(number) ?? 0
        
        for i in startnumber...intNumber {
            print(i)
            
        }
        print("=== Button one tapped ===")
    }
    
    func buttonTwo() {
        var startNumber = 1
        let intNumber = Int(number) ?? 0
        
        while startNumber < intNumber {
            print(startNumber)
            startNumber = startNumber + 1
        }
        
        print(startNumber)
        
        while startNumber > 1 {
            startNumber = startNumber - 1
            print(startNumber)
        }
        
        print("=== Button two tapped ===")
    }
    
    func buttonThree() {
        let startNumber = 1
        var showNumber = 10
        let intNumber = Int(number) ?? 0
        
        for _ in startNumber...intNumber {
            print(showNumber)
            showNumber += 11
        }
        
        print("=== Button three tapped ===")
    }
    
    func buttonFour() {
        var startNumber = 1
        let intNumber = Int(number) ?? 0
        
        while startNumber <= intNumber {
            if startNumber % 5 == 0 {
                print("LIMA")
            } else if startNumber % 7 == 0 {
                print("TUJUH")
            } else {
                print(startNumber)
            }
            startNumber += 1
        }
        print("=== Button four tapped ===")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonView: View {
    var body: some View {
        Button(action: {
            print("tapped")
        }) {
            Image(systemName: "play.circle")
                .imageScale(.large)
        }
    }
}

struct ResultView: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("result view")
        }
        
    }
}

struct DismissingKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                let keyWindow = UIApplication.shared.connectedScenes
                        .filter({$0.activationState == .foregroundActive})
                        .map({$0 as? UIWindowScene})
                        .compactMap({$0})
                        .first?.windows
                        .filter({$0.isKeyWindow}).first
                keyWindow?.endEditing(true)
        }
    }
}
