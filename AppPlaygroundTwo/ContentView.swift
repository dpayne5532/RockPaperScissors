//
//  ContentView.swift
//  AppPlaygroundTwo
//
//  Created by Dan Payne on 1/11/22.
//

import SwiftUI









struct ContentView: View {
    @State private var selection = ["Rock", "Paper", "Scissiors"]
    @State private var cpu = 0
    @State private var player = 0
    @State private var cpuSelection = "questionmark.square.fill"
    @State private var playerScore = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var winGreen = true
    @State private var frameColor: Color = Color(.clear)
    func resetGame() {
        cpuSelection = "questionmark.square.fill"
        winGreen = true
        frameColor = Color(.clear)
    }
    func rockPressed() {
        cpu = Int.random(in: 0...2)
        cpuSort()
        if cpu == 0 {
            allTie()
        } else if cpu == 1 {
            cpuWin()
        } else {
            playerWin()
        }
    }
    func paperPressed() {
        cpu = Int.random(in: 0...2)
        cpuSort()
        if cpu == 0 {
            playerWin()
        } else if cpu == 1 {
            allTie()
        } else {
            cpuWin()
        }
    }
    func scissorsPressed() {
        cpu = Int.random(in: 0...2)
        cpuSort()
        if cpu == 0 {
            cpuWin()
        } else if cpu == 1 {
            playerWin()
        } else {
            allTie()
        }
    }
    func cpuSort() {
        if cpu == 0 {
            cpuSelection = "icloud"
        } else if cpu == 1 {
            cpuSelection = "doc"
        } else {
            cpuSelection = "scissors"
        }    }
    func playerWin() {
        frameColor = Color("dutchGreen")
        playerScore += 1
        winGreen = true
        scoreTitle = "You Win!"
        showingScore = true
    }
    func cpuWin() {
        if playerScore > 0 {
            winGreen = false
            playerScore -= 1
            scoreTitle = "You lose!"
            showingScore = true
        } else {
            winGreen = false
            scoreTitle = "Can't go lower than 0!"
            showingScore = true
        }
    }
    func allTie() {
        scoreTitle = "TIE!"
        showingScore = true
    }
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [ Color("darkGray"), .gray]), startPoint: .bottomLeading, endPoint: .topLeading)
                .ignoresSafeArea()
            VStack {
               
//                    Text("CPU: ")
//                        .font(.largeTitle)
//                        .bold()
//                        .padding()
//                        .background(Color("hwsRed"))
//                        .clipShape(Capsule())
//                        .padding()
//                        .background(Color("darkGray"))
//                        .clipShape(Capsule())
                    Image(systemName: "\(cpuSelection)")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding()
                        .background(winGreen ? frameColor : .red )
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                
                .padding()
                Spacer()
                HStack {
                    Button { rockPressed()
                    }
                label: { Image(systemName: "icloud")
                        .resizable()
                        .frame(width: 70, height: 50)
                        .padding()
                        .background(.blue)
                        .foregroundColor(.primary)
                        .clipShape(Capsule())
                        .padding()
                        .background(Color("darkBlue"))
                        .clipShape(Capsule())
                    //        .shadow(color: .black, radius: 20)
                    
                }
                    Spacer()
                    
                    Button { paperPressed()
                    }
                label: { Image(systemName: "doc")
                        .resizable()
                        .frame(width: 60, height: 80)
                        .padding()
                        .background(.blue)
                        .foregroundColor(.primary)
                        .clipShape(Capsule())
                        .padding()
                        .background(Color("darkBlue"))
                        .clipShape(Capsule())
                    //          .shadow(color: .black, radius: 20)
                }
                    Spacer()
                    Button { scissorsPressed()
                    }
                label: { Image(systemName: "scissors")
                        .resizable()
                        .frame(width: 70, height: 50)
                        .padding()
                        .background(.blue)
                        .foregroundColor(.primary)
                        .clipShape(Capsule())
                        .padding()
                        .background(Color("darkBlue"))
                        .clipShape(Capsule())
                    //               .shadow(color: .black, radius: 20)
                }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 30)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Text("Player Score: \(playerScore)")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: resetGame) } message: {
                Text("Your score is \(playerScore)")
            }
        
        

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
