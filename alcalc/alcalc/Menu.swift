//
//  Menu.swift
//  alcalc
//
//  Created by Komarzz on 23.04.2022.
//

import SwiftUI


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
    


    
    
    @State var showAdd = false;
    @State var showDrink = false;
    
    @State var name: String
    @State var alcohol: String
    @State var volume: String
    
    
    
    var body: some View {
        
        List(drinksArray, id: \.id) { index in
                Text(index.name + " " + "\(index.alcohol)%" + " " + "\(index.volume)ml").onTapGesture{
                    name = "\(index.name)"
                    alcohol = "\(index.alcohol)"
                    showDrink = true
                }
        }
        
        if(showAdd){
        ZStack {
           
                Color.white
                VStack {
                    
                    VStack{
                        Button(action: {
                            name = ""
                            alcohol = ""
                            volume = ""
                            self.showAdd = false
                        }, label:{
                            Text("X")
                        }).position(x: 250, y: 15).colorMultiply(Color.green)
                        Spacer()
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
                        self.showAdd = false
                    }, label: {
                        Text("Add")
                    }).disabled(name.isEmpty || alcohol.isEmpty || volume.isEmpty).colorMultiply(Color.green)
                }.padding()
            }
            .frame(width: 300, height: 200)
            .cornerRadius(20).shadow(radius: 20)
        }
        
        
        if(showDrink){
        ZStack {
           
                Color.white
                VStack {
                    
                    VStack{
                        Button(action: {
                            name = ""
                            alcohol = ""
                            volume = ""
                            self.showDrink = false
                        }, label:{
                            Text("X")
                        }).position(x: 250, y: 15).colorMultiply(Color.orange)
                        Spacer()
                        TextField("Name", text: $name)
                            TextField("Alcohol", text: $alcohol)
                            TextField("Volume", text: $volume)
                        Spacer()
                        Button(action: {
                            name = ""
                            alcohol = ""
                            volume = ""
                            self.showDrink = false
                        }, label:{
                            Text("Drink")
                        }).colorMultiply(Color.orange)
                    }
                }.padding()
        }.frame(width: 300, height: 200)
                .cornerRadius(20).shadow(radius: 20)
        }
        
            
        Button("Add Drink"){
            self.showAdd = true
        }

    
}
}

