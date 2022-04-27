//
//  AddDrink_PopUp.swift
//  alcalc
//
//  Created by Komarzz on 24.04.2022.
//

import SwiftUI

struct AddDrink: View {
    
    @State var name: String
    @State var alcohol: String
    @State var volume: String
    var body: some View {
                            
                            Form{
                                Section{
                                    TextField("Name", text: $name)
                                    TextField("Alcohol", text: $alcohol)
                                    TextField("Volume", text: $volume)
                                }
                            }
        
        Button("Uklulu", action: {
            drinksArray.append(Drink(name: name, alcohol: alcohol, volume: volume))
        })
                            
                            HStack{
                               
                                NavigationLink("Add", destination: Menu())
                            }
                            
                    }
                }

