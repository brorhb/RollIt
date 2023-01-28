//
//  ContentView.swift
//  RollIt
//
//  Created by Bror2 on 26/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var dice: [Dice] = [Dice()]
    @State private var range = 1...6
    @State private var showSettings = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func roll() {
        dice = dice.map { die in
            die.generateRandomInt(range: range)
            return die
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                if (dice.count > 1) {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(dice) { die in
                            DiceView(value: die.value)
                        }
                    }
                } else {
                    DiceView(value: dice[0].value)
                }
                Spacer()
                Button(action: {
                    roll()
                    print(dice)
                }) {
                    Text("Roll")
                        .bold()
                }
                .padding()
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        showSettings.toggle()
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if (dice.count > 1) {
                        Button(action: {
                            dice.removeLast()
                        }) {
                            Image(systemName: "minus")
                        }
                    }
                    Button(action: {
                        let newDie = Dice()
                        newDie.generateRandomInt(range: range)
                        dice.append(newDie)
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showSettings) {
            Settings(range: $range)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
