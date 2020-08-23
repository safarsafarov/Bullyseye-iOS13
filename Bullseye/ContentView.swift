//
//  ContentView.swift
//  Bullseye
//
//  Created by Safar Safarov on 2020/8/22.
//  Copyright © 2020 Safarov Safar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // Properties
    // ==========
    
    // User interface views
    @State var alertIsVisible: Bool = false
    
    // User interface content and layout
    var body: some View {
        VStack {
            
            // Target row
            Text("Welcome to my not first app")
                .fontWeight(.black)
                .foregroundColor(.green)
            
            // Slider row
            // TODO: Add views for the slider row here.
            
            // Button row
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
            
            // Score row
            // TODO: Add views for the score, rounds, and start info buttons here.
        }
    }
    // Methods
    // =======
}

// Preview
// =======

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
