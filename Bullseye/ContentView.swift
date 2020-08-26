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

    // User interface view
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    var sliderValueRounded: Int {
        Int(self.sliderValue.rounded())
    }
    @State var score = 0
    // User interface content and layout
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:”")
                Text("100")
            }

            // Slider row
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }

            Spacer()
            // TODO: Add views for the slider row here.

            // Button row
            Button(action: {
                print("Points awarded: \(self.pointsForCurrentRound())")
                self.alertIsVisible = true
                self.score = self.score + self.pointsForCurrentRound()
                self.target = Int.random(in: 1...100)
            }) {
                Text("Hit me!")
            }.alert(isPresented: self.$alertIsVisible) {
                Alert(title: Text("Hello there!"),
                                message: Text(self.scoringMessage()),
                                dismissButton: .default(Text("Awesome!")))
            }

            Spacer()

            // Score row
            HStack {
                Button(action: {}) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }

                    .padding(.bottom, 20)
            // TODO: Add views for the score, rounds, and start info buttons here.
        }
    }
    // Methods
    // =======
    func pointsForCurrentRound() -> Int {
        let difference: Int
        if self.sliderValueRounded > self.target {
            difference = self.sliderValueRounded - self.target
        } else if self.target > self.sliderValueRounded {
            difference = self.target - self.sliderValueRounded
        } else {
            difference = 0
        }
        return 100 - difference
    }

    func scoringMessage() -> String {
        return "The slider's value is \(self.sliderValueRounded).\n" +
                "The target value is \(self.target).\n" +
                "You scored \(self.pointsForCurrentRound()) points this round."
    }




// Preview
// =======
    #if DEBUG
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
    #endif
}
