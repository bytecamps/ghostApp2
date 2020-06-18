//
//  ContentView.swift
//  ghostApp3
//
//  Created by W Wessels on 6/18/20.
//  Copyright © 2020 W Wessels. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var ghostDoor = Int.random(in: 1...3)
    @State var textBoxText = "Three doors ahead... \n Behind one of them is a ghost \n Which one do you choose? \n Click on one of the doors. "
    @State var score = 0
    
    var body: some View {
        VStack {
            Text("Ghost Game")
            Text("Score: \(score)")
            Image("cuteGhosts").resizable().aspectRatio(contentMode: .fit).padding(.horizontal, 20.0)
            Text(textBoxText)
                .multilineTextAlignment(.center)
            HStack {
                Button(action: {
                    self.checkIfGhostBehindDoor(doorNumber: 1)
                }) {
                    Image("cartoonDoor").resizable().aspectRatio(contentMode: .fit)
                }
                Button(action: {
                    self.checkIfGhostBehindDoor(doorNumber: 2)
                }) {
                    Image("cartoonDoor").resizable().aspectRatio(contentMode: .fit)
                }
                Button(action: {
                    self.checkIfGhostBehindDoor(doorNumber: 3)
                }) {
                    Image("cartoonDoor").resizable().aspectRatio(contentMode: .fit)
                }
            }
            Button(action: {
                self.startOver()
            }) {
                Text("Start over")
            }
        }
    }
    
    func checkIfGhostBehindDoor(doorNumber : Int) {
        if ghostDoor == doorNumber {
            print("Oh no, there was a ghost!")
            textBoxText = "Oh no! \n There was a ghost! \n Game Over! \n Your score was \(score)"
        }
        else {
            print("No ghost, we're safe")
            print("You can pick a new door")
            textBoxText = "No ghost! \n You enter another room. \n There are three doors. \n Which one do you pick?"
            ghostDoor = Int.random(in: 1...3)
            score = score + 1
        }
    }
    
    func startOver() {
        score = 0
        textBoxText = "Three doors ahead... \n Behind one of them is a ghost \n Which one do you choose? \n Click on one of the doors. "
        ghostDoor = Int.random(in: 1...3)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
