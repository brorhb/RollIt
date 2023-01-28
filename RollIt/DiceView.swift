//
//  DiceView.swift
//  RollIt
//
//  Created by Bror2 on 26/01/2023.
//

import SwiftUI

struct DiceView: View, Identifiable {
    let id = UUID()
    let value: Int
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
        }
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(value: 5)
    }
}



