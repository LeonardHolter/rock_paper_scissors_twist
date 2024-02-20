//
//  ContentView.swift
//  rock-paper-scissors
//
//  Created by Leonard Holter on 20/02/2024.
//

import SwiftUI



struct ButtonFixer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .font(.largeTitle)
    }
}


extension View {
    func buttonStyler() -> some View {
        modifier(ButtonFixer())
    }
}



struct ContentView: View {
    
    var attacks = ["🪨", "🧻", "✂️" ]
    
    @State private var randomComputerAttackNumber = Int.random(in: 0...2)
    
    
    var objective = ["win", "lose"]
    
    @State private var randomObjectiveNumber = Int.random(in: 0...1)
    
    
    @State private var userAttack = ""
    
    @State private var points = 0
    
    @State private var roundCounter = 0
    
    @State private var endStatus = false
    

    
    
    var body: some View {
        VStack {
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            
            VStack {
                
                
                Text("Your goal is to \(objective[randomObjectiveNumber])")
                    .font(.title.bold())
                Spacer()
                
                
                Text("Computer:")
                    .font(.title2.bold())
                    .padding()
                Button("\(attacks[randomComputerAttackNumber])") {
                    
                }
                .buttonStyler()
                .tint(.yellow)
                
                Spacer()
                
                Text("Choose your Weapon: ")
                    .font(.title2.bold())
        
                
                HStack {
                    Button("🪨") {
                        userAttack = "🪨"
                        attackPointGiver()
                        randomObjectiveNumber = Int.random(in: 0...1)
                        randomComputerAttackNumber = Int.random(in: 0...2)
                        roundChecker()
                    }
                    .buttonStyler()
                    .tint(Color.blue)

                    
                        
                    Button("🧻") {
                        userAttack = "🧻"
                        attackPointGiver()
                        randomObjectiveNumber = Int.random(in: 0...1)
                        randomComputerAttackNumber = Int.random(in: 0...2)
                        roundChecker()

                    }
                    .buttonStyler()
                    
                    
                    Button("✂️") {
                        userAttack = "✂️"
                        attackPointGiver()
                        randomObjectiveNumber = Int.random(in: 0...1)
                        randomComputerAttackNumber = Int.random(in: 0...2)
                        roundChecker()
                        
                    }
                    .buttonStyler()
                }
                .padding()
                Spacer()
                
                Text("Points: \(points)")
                
                }
            }
        .alert("You got: \(points) points", isPresented: $endStatus) {
            Button("Restart game") {
                roundCounter = 0
                points = 0
            }
        }
        }
        
    
    
    func roundChecker() {
        if roundCounter == 10 {
            endStatus = true
        }
        else {
            roundCounter += 1
        }
    }
    
    
    func attackPointGiver () {
        if objective[randomObjectiveNumber] == "win" {
            if attacks[randomComputerAttackNumber] == "🪨" && userAttack == "🧻" {
                points += 1
            }
            if attacks[randomComputerAttackNumber] == "🪨" && userAttack == "✂️" {
                points -= 1
            }
            if attacks[randomComputerAttackNumber] == "🧻" && userAttack == "✂️" {
                points += 1
            }
            if attacks[randomComputerAttackNumber] == "🧻" && userAttack == "🪨" {
                points -= 1
            }
            if attacks[randomComputerAttackNumber] == "✂️" && userAttack == "🪨" {
                points += 1
            }
            if attacks[randomComputerAttackNumber] == "✂️" && userAttack == "🧻" {
                points -= 1
            }
            
        }
        if objective[randomObjectiveNumber] == "lose" {
            if attacks[randomComputerAttackNumber] == "🪨" && userAttack == "🧻" {
                points -= 1
            }
            if attacks[randomComputerAttackNumber] == "🪨" && userAttack == "✂️" {
                points += 1
            }
            if attacks[randomComputerAttackNumber] == "🧻" && userAttack == "✂️" {
                points -= 1
            }
            if attacks[randomComputerAttackNumber] == "🧻" && userAttack == "🪨" {
                points += 1
            }
            if attacks[randomComputerAttackNumber] == "✂️" && userAttack == "🪨" {
                points -= 1
            }
            if attacks[randomComputerAttackNumber] == "✂️" && userAttack == "🧻" {
                points += 1
            }
            
        }
        
    }
        
    }


#Preview {
    ContentView()
}
