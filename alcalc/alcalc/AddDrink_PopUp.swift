//
//  AddDrink_PopUp.swift
//  alcalc
//
//  Created by Komarzz on 24.04.2022.
//

import SwiftUI

struct AddDrink_PopUp: View {
    
    @State var name: String
    @State var alcohol: String
    @State var volume: String
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
                    if show {
                        // PopUp Window
                        VStack(alignment: .center, spacing: 0) {
                            
                            Form{
                                Section{
                                    TextField("Name", text: $name)
                                    TextField("Alcohol", text: $alcohol)
                                    TextField("Volume", text: $volume)
                                }
                            }

                            Button(action: {
                                // Dismiss the PopUp
                                    show = false
                            }, label: {
                                Text("Add")
                                    
                            })
                        }
                    }
                }
    }
}
