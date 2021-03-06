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
    @State var round = 1
    var sliderTargetDifference: Int {
        abs(sliderValueRounded - target)
    }
    // User interface content and layout
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:”")
                Text("\(target)")
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
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }.alert(isPresented: self.$alertIsVisible) {
                Alert(title: Text(alertTitle()),
                        message: Text(self.scoringMessage()),
                        dismissButton: .default(Text("Awesome!")) {
                            self.startNewRound()
                        }
                )
            }

            Spacer()
            // Score row
            HStack {
                Button(action: {
                    self.startNewGame()
                }) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("\(score)")
                Spacer()
                Text("Round:")
                Text("\(round)")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }
                    .padding(.bottom, 20)
            .onAppear() {
                self.startNewRound()
            }


            // TODO: Add views for the score, rounds, and start info buttons here.
        }

    }

    // Methods
    // =======
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let points: Int
        if sliderTargetDifference == 0 {
            points = 200
        } else if sliderTargetDifference == 1 {
            points = 150
        } else {
            points = maximumScore - sliderTargetDifference
        }
        return points
    }

    func scoringMessage() -> String {
        return "The slider's value is \(self.sliderValueRounded).\n" +
                "The target value is \(self.target).\n" +
                "You scored \(self.pointsForCurrentRound()) points this round."
    }

    func alertTitle() -> String {
        let title: String
        if sliderTargetDifference == 0 {
            title = "Perfect!"
        } else if sliderTargetDifference < 5{
            title = "You almost had it!"
        } else if sliderTargetDifference <= 10 {
            title = "Not Bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }

    func startNewGame() {
        score = 0
        round = 1
        resetSliderAndTarget()
    }

    func startNewRound() {
        score = score + pointsForCurrentRound()
        round = round + 1
        resetSliderAndTarget()
    }

    func resetSliderAndTarget(){
        sliderValue = Double.random(in: 1...100)
        target = Int.random(in: 1...100)
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
