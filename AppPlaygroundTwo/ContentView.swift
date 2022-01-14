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
    @State private var cpuSelection = "Rock"
    
    func shoot() {
        cpu = Int.random(in: 0...2)
    }
    
    var body: some View {
        
        VStack {
            
            Text("CPU: \(cpuSelection)")
                .padding()
            
            Spacer()
            
            HStack {
                
                
                Button { shoot()
                }
            label: { Image(systemName: "icloud")
                    .resizable()
                .frame(width: 70, height: 70) }
            .padding()
                Spacer()
                
                Button { shoot()
                }
            label: { Image(systemName: "doc.fill")
                    .resizable()
                .frame(width: 70, height: 70) }
            .padding()
                
                
                Spacer()
                
                
                Button { shoot()
                }
            label: { Image(systemName: "scissors")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .padding()
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
