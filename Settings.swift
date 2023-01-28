//
//  Settings.swift
//  RollIt
//
//  Created by Bror2 on 26/01/2023.
//

import SwiftUI

struct Settings: View {
    @Environment(\.dismiss) var dismiss
    @Binding var range: ClosedRange<Int>
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello world")
            }
            .toolbar {
                Button(action: {
                    dismiss()
                }) {
                    Text("Done")
                }
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(range: .constant(1...6))
    }
}
