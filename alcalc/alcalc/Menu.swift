//
//  Menu.swift
//  alcalc
//
//  Created by Komarzz on 23.04.2022.
//

import SwiftUI


struct Drink: Hashable{
    var id = UUID()
    let name: String
    let alcohol: String
    let volume: String
}

var drinksArray = [
    Drink(name:"Vodka", alcohol: "\(40)", volume:"\(40)"),
    Drink(name:"Wine", alcohol:"\(40)", volume:"\(40)"),
    Drink(name:"Bear", alcohol:"\(40)", volume:"\(40)"),
    Drink(name:"Rom", alcohol:"\(40)", volume:"\(40)")
]


struct Menu: View {
    @State var showAdd = false
    @State var showDrink = false;
    @State var name: String
    @State var alcohol: String
    @State var volume: String
    @Binding var allVol: Int
    @Binding var allAlc: Float
    @Binding var promille: Float
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        

        
        ZStack{
            
            VStack{
        
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(drinksArray, id: \.self){ item in
                            VStack(alignment: .leading, spacing: 10){
                                Text(item.name).bold()
                                Text("Alcohol: " + item.alcohol + "%")
                            }.frame(width: 175, height: 175).background(Color.blue).border(Color.white).cornerRadius(30).foregroundColor(Color.white).onTapGesture{
                                name = "\(item.name)"
                                alcohol = "\(item.alcohol)"
                                showDrink = true
                            }.disabled(showAdd)
                        }
                    }
                }.padding()
                
    Button("Add Drink"){
        self.showAdd = true
    }.disabled(showDrink)
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
                        }).position(x: 250, y: 15).colorMultiply(Color.blue)
                        Spacer()
                        VStack(alignment: .leading ,spacing: 10){
                            TextField("Name", text: $name)
                            TextField("%", text: $alcohol)
                            TextField("ml", text: $volume)
                        }
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
                        VStack(alignment: .leading, spacing: 10){
                            Text("\(name)").bold()
                            Text(alcohol + "%")
                            TextField("ml", text: $volume)
                        }
                        Spacer()
                        Button(action: {
                            DrinkedList.append(Drinked(name: name, alcohol: alcohol, volume: volume))
                            allVol = Int(volume) ?? 0
                            allAlc = (Float(alcohol) ?? 0)*0.01
                            promille += Float(allVol)*allAlc*0.8/(koeff*(Float(weightGlobal) ?? 0))
                            
                            name = ""
                            alcohol = ""
                            volume = ""
                            self.showDrink = false
                        }, label:{
                            Text("Drink")
                        }).colorMultiply(Color.orange).disabled(name.isEmpty || alcohol.isEmpty || volume.isEmpty)
                    }
                }.padding()
        }.frame(width: 300, height: 200)
                .cornerRadius(20).shadow(radius: 20)
        }
        }


    
}
}

