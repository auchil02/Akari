//
//  PuzzleView.swift
//  Akari
//
//  Created by Adi Uchil on 4/23/23.
//

import Foundation
import SwiftUI

struct PuzzleView: View {
    
    var puzzle = 0
    @State private var board: [[Cell]] = [
        [Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: true, isLit: false, hasLamp: false, clueNumber: 1), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil)],
        [Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: true, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil)],
        [Cell(isWall: true, isLit: false, hasLamp: false, clueNumber: 0), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil)],
        [Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: true, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: true, isLit: false, hasLamp: false, clueNumber: 4), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil)],
        [Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: true, isLit: false, hasLamp: false, clueNumber: nil)],
        [Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: true, isLit: false, hasLamp: false, clueNumber: 2), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil)],
        [Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: true, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil), Cell(isWall: false, isLit: false, hasLamp: false, clueNumber: nil)]
        ]
    

    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .black],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            VStack (spacing: 0) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(height: 50)
                        .padding(.horizontal)
                    HStack {
                        Text("Puzzle \(puzzle)")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .padding(25)
                    }
                }
                .frame(width: 385)
                ForEach(0..<7) { row in
                    HStack (spacing: 0) {
                        ForEach(0..<7) { column in
                            let cell = board[row][column]
                            cell.button
                            /*if board[row][column].isWall {
                                var clueNum = board[row][column].clueNumber
                                Button(action: {
                                    // nothing
                                }) {
                                    Text(clueNum)
                                }
                                .background(Color.black)
                                .foregroundColor(.white)
                            } else {
                                Button(action: {
                                    board[row][column].hasLamp.toggle()
                                }) {
                                    // image maybe
                                }
                                .background(Color.white)
                            }*/
                        }
                    }
                }
            }
        }
    }
    
    struct Cell {
        var isWall: Bool
        var isLit: Bool
        @State var hasLamp: Bool
        var clueNumber: Int?
        @State var bgColor: Color = Color.white
        
        init(isWall: Bool = false, isLit: Bool = false, hasLamp: Bool = false, clueNumber: Int? = nil) {
            self.isWall = isWall
            self.isLit = isLit
            self.hasLamp = hasLamp
            self.clueNumber = clueNumber
        }
        
        var button: some View {
            Button(action: {
                hasLamp.toggle()
            }) {
                Text(clueNumber != nil ? "\(clueNumber!)" : "")
                    .foregroundColor(.white)
            }
            .padding()
            .frame(width: 50, height: 50)
            .border(Color.black)
            .background(isWall ? Color.black : bgColor)
            .overlay(
                Group {
                    if hasLamp {
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(.yellow)
                    }
                })
        }
    }
}
