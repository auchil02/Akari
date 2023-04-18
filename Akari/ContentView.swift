//
//  ContentView.swift
//  Akari
//
//  Created by Adi Uchil on 4/18/23.
//

import SwiftUI

struct ContentView: View {
    let buttons = ["Random Puzzle", "Select Puzzle", "Next Puzzle", "Previous Puzzle"]
    @State private var selectView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.yellow.edgesIgnoringSafeArea(.all)
                Image("akari_background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                VStack {
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                        ForEach(0..<buttons.count, id: \.self) { index in
                            Button(action: {
                                // Action for each button
                                print("\(buttons[index]) tapped")
                                if buttons[index] == "Select Puzzle" {
                                    selectView = true
                                }
                            }) {
                                Text(buttons[index])
                                    .foregroundColor(.black)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .padding(10)
                                    .background(Color.yellow)
                                    .cornerRadius(10)
                            }
                        }
                        .padding() // Add padding around buttons
                        .padding(.top, 16) // Add padding to top of buttons
                    }
                    .padding(.bottom, 14.3)
                }
            }
            .sheet(isPresented: $selectView, content: {
                SelectPuzzle()
            })
            .navigationBarHidden(true)
        }
    }
}

struct SelectPuzzle: View {
    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all) // Fill entire view with black color
            Image("akari_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
            VStack(spacing: 16) {
                ForEach(1...5, id: \.self) { index in
                    Button(action: {
                        // Action for each button
                        print("Puzzle \(index) tapped")
                    }) {
                        Text("Puzzle \(index)") // Set button title
                            .foregroundColor(.black)
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(10)
                            .background(Color.yellow)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
