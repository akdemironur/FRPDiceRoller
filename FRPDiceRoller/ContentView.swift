//
//  ContentView.swift
//  FRPDiceRoller
//
//  Created by Onur Akdemir on 28.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State var dices = [4,6,8,10,12,20,100]
    @State var diceAmounts = [0,0,0,0,0,1,0]
    @State var diceResult = 20
    @State var output = "1d20"
    @State var output2 = "20/20"
    func outputCalc() -> String{
        output = ""
        
        for i in 0..<dices.count {
            if (diceAmounts[i] > 0) {
                output += String(diceAmounts[i]) + "d" + String(dices[i]) + " + "
            }
        }
        if (output != "") {
            output = String(output.dropLast(3))
        }
        return output
    }
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text(output2)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                Text(String(diceResult))
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                Button("Roll") {
                    diceResult = 0
                    output2 = ""
                    var rolled = 0
                    for i in 0..<dices.count {
                        if (diceAmounts[i] > 0) {
                            for _ in 1...diceAmounts[i] {
                                rolled = Int.random(in: 1...dices[i])
                                diceResult += rolled
                                output2 += String(rolled) + "/" + String(dices[i]) + " + "
                            }
                        }
                    }
                    if (output2 != "") {
                        output2 = String(output2.dropLast(3))
                    }
                }
            }
            .frame(height: 150.0)
            VStack(alignment: .center) {
                Text(String(output))
                    .font(.title2)
                    .multilineTextAlignment(.center)
                HStack {
                    Button("d4") {
                        diceAmounts[0] += 1
                        output = outputCalc()
                    }
                    Button("d6") {
                        diceAmounts[1] += 1
                        output = outputCalc()
                    }
                    Button("d8") {
                        diceAmounts[2] += 1
                        output = outputCalc()
                    }
                    Button("d10") {
                        diceAmounts[3] += 1
                        output = outputCalc()
                    }
                }
                HStack {
                    Button("d12") {
                        diceAmounts[4] += 1
                        output = outputCalc()
                        
                    }
                    Button("d20") {
                        diceAmounts[5] += 1
                        output = outputCalc()
                    }
                    Button("d100") {
                        diceAmounts[6] += 1
                        output = outputCalc()
                        print(String(diceResult))
                    }
                }
                Button("Clear") {
                    for i in 0..<diceAmounts.count {
                        diceAmounts[i] = 0
                    }
                    output = ""
                }
            }
            .frame(height: 150.0)
            Spacer()
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
