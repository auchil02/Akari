//
//  ContentView.swift
//  Akari
//
//  Created by Adi Uchil on 4/18/23.
//

import SwiftUI

struct ContentView: View {
    // random, select, next, previous
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.yellow, .black],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                VStack {
                    NavigationLink(destination: selectPuzzleView()) {
                        Text("Select Puzzle")
                    }
                    .font(.headline)
                    Divider().background(Color.black)
                    NavigationLink(destination: PuzzleView(puzzle: Int.random(in: 1...5))) {
                        Text("Random Puzzle")
                    }
                    .font(.headline)
                    Divider().background(Color.black)
                    NavigationLink(destination: InstructionsView()) {
                        Text("Instructions")
                    }
                    .font(.headline)
                }
                .padding(.vertical)
                .foregroundColor(.black)
                .background(Color.white)
                .navigationBarTitle("Akari")
            }
        }
    }
}

struct InstructionsView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .black],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(height: 50)
                        .padding(.horizontal)
                    HStack {
                        Text("How to play Akari!")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .padding(25)
                    }
                }
                .edgesIgnoringSafeArea(.top)
                .padding()
                Text("Akari is a puzzle and logic game, below is an example for reference. There's a 2d board containing 3 types of tiles: Corridors, Walls, and Clues. Your aim is to place lamps on the Corridors (white tiles) to fill the board with light. Walls and Clues will not be lit up. Clue tiles display the number of lamps that must be placed in their adjacent Corridor tiles to solve the puzzle. While you can place a lamp in every Corridor, the puzzle will not be solved if any lamp is in view of another's light. Good luck!")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.black)
                Image("akari_background")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
        }
    }
}

struct selectPuzzleView: View {
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .black],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            VStack (spacing: 30){
                Divider()
                ForEach(1..<6) { index in
                    NavigationLink(destination: PuzzleView(puzzle: index)) {
                        Text("Puzzle \(index)")
                    }
                    .cornerRadius(20)
                    .padding()
                    Divider().background(Color.black)
                }
            }
            .foregroundColor(.black)
            .background(Color.white)
            .font(.headline)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
