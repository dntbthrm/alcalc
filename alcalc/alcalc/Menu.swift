//
//  Menu.swift
//  alcalc
//
//  Created by Komarzz on 23.04.2022.
//

import SwiftUI

var show = false
struct Drink: Identifiable{
    var id = UUID()
    let name: String
    let alcohol: String
    let volume: String
}
var drinksArray = [
    Drink(name:"Vodka", alcohol: "\(40)", volume:"\(40)"),
    Drink(name:"Vine", alcohol:"\(40)", volume:"\(40)"),
    Drink(name:"Bear", alcohol:"\(40)", volume:"\(40)"),
    Drink(name:"Rom", alcohol:"\(40)", volume:"\(40)")
]

struct Menu: View {
    


    
    
    @State var show = false;
    
    @State var name: String
    @State var alcohol: String
    @State var volume: String
    
    
    
    var body: some View {
        
        List(drinksArray) {
         Text($0.name + " " + "\($0.alcohol)%" + " " + "\($0.volume)ml")
         }
        
        if(show){
        ZStack {
                
                Color.white
                VStack {
                    
                    VStack{
                        TextField("Name", text: $name)
                            TextField("Alcohol", text: $alcohol)
                            TextField("Volume", text: $volume)
                    }
                            
                    
                    Spacer()
                    Button(action: {
                        drinksArray.append(Drink(name: name, alcohol: alcohol, volume: volume))
                        name = ""
                        alcohol = ""
                        volume = ""
                        self.show = false
                    }, label: {
                        Text("Add")
                    }).disabled(name.isEmpty || alcohol.isEmpty || volume.isEmpty)
                }.padding()
            }
            .frame(width: 300, height: 200)
            .cornerRadius(20).shadow(radius: 20)
        }
        
            
        Button("Add Drink"){
            self.show = true
        }

    }
}
