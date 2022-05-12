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
    var progress: Double
    let taskName: String
    let task: String
    let color: Color
}

var drinksArray = [
    Drink(name:"Vodka", alcohol: "\(40)", volume:"",
          target: 0, progress: 0,taskName: "", task: "",
          color: Color.yellow),
    Drink(name:"Wine", alcohol:"\(8)", volume:"",
          target: 2250, progress: 0,taskName: "Tereza Mouther", task: "Drink 3 bottles of wine",
          color: Color.yellow),
    Drink(name:"Bear", alcohol:"\(4)", volume:"",
          target: 0, progress: 0,taskName: "", task: "",
          color: Color.yellow),
    Drink(name:"Jagermeister", alcohol:"\(35)", volume:"",
          target: 700, progress: 0,taskName: "Naked warden", task: "Drink 0,7 of Jagermeister",
          color: Color.yellow),
    Drink(name:"Moonshine", alcohol:"\(45)", volume:"",
          target: 1000, progress: 0,taskName: "Last way", task: "Drink liter of Moonshine",
          color: Color.yellow),
    Drink(name:"Rom", alcohol:"\(40)", volume:"",
          target: 1000, progress: 0,taskName: "Pirates King", task: "Drink liter of Rom",
          color: Color.yellow)
    
]

let orange = Color(red: 207 / 255, green: 119 / 255, blue: 37 / 255)
let darkGray = Color(red: 91 / 255, green: 93 / 255, blue: 82 / 255)
let gray = Color(red: 171 / 255, green: 172 / 255, blue: 167 / 255)
let yellow = Color(red: 240 / 255, green: 186 / 255, blue: 52 / 255)



struct Menu: View {
    @State var showAdd = false
    @State var showDrink = false
    @State var showDelete = false
    @State var name: String
    @State var alcohol: String
    @State var volume: String
    @State var selColor: Color
    @Binding var allVol: Int
    @State var ind: Int = 0
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
                        ForEach(drinksArray.indices, id: \.self){ item in
                            VStack(alignment: .leading, spacing: 10){
                                Text(drinksArray[item].name).bold()
                                Text("Alcohol: " + drinksArray[item].alcohol + "%")
                            }.frame(width: 175, height: 175)
                                .background(drinksArray[item].color)
                                .cornerRadius(30)
                                .foregroundColor(Color.white)
                                .onTapGesture{
                                    name = "\(drinksArray[item].name)"
                                    alcohol = "\(drinksArray[item].alcohol)"
                                    ind = item
                                    showDrink = true }
                                .onLongPressGesture{
                                    if(item > 5){
                                        ind = item
                                        showDelete = true} }
                        }.disabled(showAdd || showDrink)
                    }.padding()
                }
                
                Button(action:{
                    self.showAdd = true
                }){
                    Text("Add Drink")
                        .frame(width: 376, height: 82, alignment: .center)
                        .foregroundColor(Color.white)
                        .background(orange)
                        .cornerRadius(10)
                        .disabled(showDrink)
                }
                
            }
            
            if(showAdd){
                ZStack {
                    
                        
                        VStack(spacing: 10){
                            VStack{
                            
                            
                            
                            Button(action:{
                                name = ""
                                alcohol = ""
                                volume = ""
                                self.showAdd = false
                            }){
                                Text("X").frame(width: 41, height: 41, alignment: .center).background(gray).cornerRadius(10).foregroundColor(Color.white)
                            }
                            }.frame(width: 300,height: 41, alignment: .topTrailing).padding()
                            
                            
                            VStack(alignment: .center, spacing: 10){
                                TextField("Name", text: $name).padding().frame(width: 265, height: 58).overlay(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(Color.gray, lineWidth: 1.0)).background(gray).cornerRadius(10)
                                TextField("%", text: $alcohol).padding().frame(width: 265, height: 58).overlay(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(Color.gray, lineWidth: 1.0)).background(gray).cornerRadius(10)
                                TextField("ml", text: $volume).padding().frame(width: 265, height: 58).overlay(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(Color.gray, lineWidth: 1.0)).background(gray).cornerRadius(10)
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(colors, id: \.self){ color in
                                            Circle().foregroundColor(color)
                                                .frame(width: 58, height: 58)
                                                .opacity(color == selColor ? 0.5 : 1.0)
                                                .scaleEffect(color == selColor ? 1.1 : 1.0)
                                                .onTapGesture{
                                                    selColor = color
                                                }
                                        }
                                    }.padding()
                                }.frame(width: 265, height: 90).overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1.0)
                                ).background(gray).cornerRadius(10)
                            }.frame(height: 304 ,alignment: .center)
                            
                            
                            VStack{
                            Button(
                                action: {
                                    drinksArray.append(Drink(name: name, alcohol: alcohol, volume: volume,target: 0, progress: 0, taskName:"", task: "", color: selColor))
                                    name = ""
                                    alcohol = ""
                                    volume = ""
                                    selColor = Color.white
                                    self.showAdd = false
                                }){
                                
                                    Text("Add").foregroundColor(Color.white)
                                        .frame(width: 232, height: 69, alignment: .center)
                                        .background((name.isEmpty || alcohol.isEmpty || volume.isEmpty) || (selColor == Color.white) ? Color.gray : yellow)
                                        .cornerRadius(20)
                                }.disabled((name.isEmpty || alcohol.isEmpty || volume.isEmpty) || (selColor == Color.white))
                                
                                
                            }.padding().frame(height: 90, alignment: .bottom)
                        }.frame(width: 320, height: 493, alignment: .top)
                        
                    
                }.frame(width: 320, height:493).background(darkGray)
                    .cornerRadius(20).shadow(radius: 20).padding()
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
                                drinksArray[ind].progress += (Double(volume) ?? 0)/drinksArray[ind].target
                                DrinkedList.append(Drinked(name: name, alcohol: alcohol, volume: volume))
                                allVol = Int(volume) ?? 0
                                allAlc = (Float(alcohol) ?? 0)*0.01
                                promille += Float(allVol)*allAlc*0.8/(koeff*(Float(weightGlobal) ?? 0))
                                
                                
                                name = ""
                                alcohol = ""
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
            
            if(showDelete){
                ZStack{
                    Color.white
                    VStack{
                        
                        Button(action: {
                            name = ""
                            alcohol = ""
                            volume = ""
                            self.showDelete = false
                        }, label:{
                            Text("X")
                        }).position(x: 250, y: 15)
                            .colorMultiply(Color.orange)
                        
                        Spacer()
                        
                        Text("Want to delete?")
                        
                        Spacer()
                        
                        Button(action: {
                            drinksArray.remove(at: ind)
                            self.showDelete = false
                        }, label:{
                            Text("Delete")
                        }).colorMultiply(Color.red)
                        
                        
                    }.padding()
                    
                }.frame(width: 300, height: 200)
                    .cornerRadius(20).shadow(radius: 20)
            }
        }
        
        
        
    }
}

