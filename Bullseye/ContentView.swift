//
//  ContentView.swift
//  Bullseye
//
//  Created by Safar Safarov on 2020/8/22.
//  Copyright © 2020 Safarov Safar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible: Bool = false
    var body: some View {
        VStack {
            Text("Welcome to my not first app")
                .fontWeight(.black)
                .foregroundColor(.green)
            Button(action: {
                print("Button Pressed!")
                self.alertIsVisible = true
            }) {
                Text("Hit me")
            }
            .alert(isPresented: self.$alertIsVisible) {
                Alert(title: Text("Hello there"),
                      message: Text("This is my first pop-up."),
                      dismissButton: .default(Text("Awesome")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
