//
//  ContentView.swift
//  alcalc
//
//  Created by Mikhail Bulukhto on 19.04.2022.
//

import SwiftUI

var weightGlobal: String = ""
var koeff: Float = 0

struct ContentView: View {
    
    @State var birthday = Date()
    @State var weight: String=""
    var gender = ["Male" , "Female"]
    @State var selectedGender: Int = 0
    var toDate = Date()
    var age: Int = 0
    @State var good = false
    @State var alertCont = false
    
    var body: some View {
        
        
        NavigationView{
            
            Form{  //открытие формы
                Section{//открытие группы формы
                    Picker(
                        selection: $selectedGender,
                        label: Text("Select Gender"))
                    {
                        ForEach(0 ..< 2) {
                            Text(self.gender[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle()) //выбор пола
                    
                    
                    TextField("Weight",text: $weight)
                        .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                    //ввод веса
                    
                    DatePicker("Birthdate", selection: $birthday, in: ...Date(), displayedComponents: .date)
                   
                    let timeRange = Calendar.current.dateComponents([.year, .month, .day], from: birthday, to: Date())
                    let age = Int(timeRange.year ?? 0)
                    Button(action: {
                        weightGlobal = weight
                        if selectedGender == 0{
                            koeff = 0.7
                        }
                        else{
                            koeff = 0.6
                        }
                        if age < 18{
                            self.alertCont = true
                        }
                        self.good = true
                    }, label:
                    {
                        Text("Confirm")
                    }).colorMultiply(Color.green).disabled(weight.isEmpty)
                        .alert(isPresented: $alertCont) {
                            Alert(title: Text("Message"), message: Text("You're too young"), dismissButton: .destructive(Text("OK"), action: {
                                self.good = false
                            }))
                        }
//выбор даты рождения
                }
                .padding()
                
                Section{
                    VStack {
                        NavigationLink("Start Party!!!", destination: theMainScreen()).disabled(good == false)
                    }.foregroundColor(.purple).padding()
                    VStack{ NavigationLink("Settings",destination: settingsScreen())
                    }.foregroundColor(.purple).padding()
                }
                Section{
                    Text("Version 0.1")
                        .fontWeight(.ultraLight)
                        .padding(.leading,120)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
