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
    let target: Double
    let color: Color
}

var drinksArray = [
    Drink(name:"Vodka", alcohol: "\(40)", volume:"", target: 0, color: Color.yellow),
    Drink(name:"Wine", alcohol:"\(8)", volume:"", target: 0, color: Color.yellow),
    Drink(name:"Bear", alcohol:"\(4)", volume:"", target: 0, color: Color.yellow),
    Drink(name:"Rom", alcohol:"\(40)", volume:"", target: 0, color: Color.yellow),
    Drink(name:"Rom", alcohol:"\(40)", volume:"", target: 0, color: Color.yellow),
    Drink(name:"Rom", alcohol:"\(40)", volume:"", target: 0, color: Color.yellow)
    
]


struct Menu: View {
    @State var showAdd = false;
    @State var showDrink = false;
    @State var name: String
    @State var alcohol: String
    @State var volume: String
    @State var selColor: Color
    @Binding var allVol: Int
    @Binding var allAlc: Float
    @Binding var promille: Float
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let colors: [Color] = [Color.red, Color.green, Color.blue, Color.yellow, Color.black, Color.pink, Color.mint]
    
    
    
    var body: some View {
        
        ZStack{
            
            
            VStack{
                
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(drinksArray, id: \.self){ item in
                            VStack(alignment: .leading, spacing: 10){
                                Text(item.name).bold()
                                Text("Alcohol: " + item.alcohol + "%")
                            }.frame(width: 175, height: 175)
                                .background(item.color)
                                .cornerRadius(30)
                                .foregroundColor(Color.white)
                                .onTapGesture{
                                    name = "\(item.name)"
                                    alcohol = "\(item.alcohol)"
                                    showDrink = true }
                                .disabled(showAdd)
                        }
                    }
                }.padding()
                
                Button(action: {self.showAdd = true}){
                    Text("Add Drink").foregroundColor(Color.white)
                }.frame(width: 200, height: 50, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .disabled(showDrink)
                
            }
            
            if(showAdd){
                ZStack {
                    Color.white
                    
                    VStack {
                        
                        VStack(spacing: 30){
                            Button(action: {
                                name = ""
                                alcohol = ""
                                volume = ""
                                self.showAdd = false
                            }, label:{
                                Text("X")
                            }).position(x: 250, y: 15)
                                .colorMultiply(Color.blue)
                            
                            
                            VStack(spacing: 7){
                                TextField("Name", text: $name).padding().overlay(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(Color.gray, lineWidth: 1.0))
                                TextField("%", text: $alcohol).padding().overlay(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(Color.gray, lineWidth: 1.0))
                                TextField("ml", text: $volume).padding().overlay(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(Color.gray, lineWidth: 1.0)
                                )
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(colors, id: \.self){ color in
                                            Circle().foregroundColor(color)
                                                .frame(width: 45, height: 45)
                                                .opacity(color == selColor ? 0.5 : 1.0)
                                                .scaleEffect(color == selColor ? 1.1 : 1.0)
                                                .onTapGesture{
                                                    selColor = color
                                                }
                                        }
                                    }.padding()
                                }.overlay(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(Color.gray, lineWidth: 1.0)
                                )
                            }
                        

                        
                        Button(
                            action: {
                                drinksArray.append(Drink(name: name, alcohol: alcohol, volume: volume, target: 0, color: selColor))
                                name = ""
                                alcohol = ""
                                volume = ""
                                selColor = Color.white
                                self.showAdd = false
                            },
                            label: {
                                Text("Add")
                            }
                            
                        ).disabled((name.isEmpty || alcohol.isEmpty || volume.isEmpty) || (selColor == Color.white))
                            .foregroundColor(Color.white)
                            .frame(width: 100, height: 30, alignment: .center)
                            .background((name.isEmpty || alcohol.isEmpty || volume.isEmpty) || (selColor == Color.white) ? Color.gray : Color.blue)
                            .cornerRadius(20)
                        }
                        
                    }.padding()
                    
                }.frame(width: 300, height:400)
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
                            }).position(x: 250, y: 15)
                                .colorMultiply(Color.orange)
                            
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
                                if(name == "Vodka"){
                                    circleProgress += (Double(volume) ?? 0)/VodkaTarget
                                }
                                
                                name = ""
                                alcohol = ""
                                volume = ""
                                self.showDrink = false
                            }, label:{
                                Text("Drink")
                            }).colorMultiply(Color.orange)
                                .disabled(name.isEmpty || alcohol.isEmpty || volume.isEmpty)
                            
                        }
                    }.padding()
                }.frame(width: 300, height: 200)
                    .cornerRadius(20).shadow(radius: 20)
            }
        }
        
        
        
    }
}

