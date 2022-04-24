//
//  ContentView.swift
//  alcalc
//
//  Created by Mikhail Bulukhto on 19.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var birthday = Date()
    @State var weight: String=""
    var gender = ["Male" , "Female"]
    @State var selectedGender: Int = 0
    @State var alert = false
    var toDate = Date()
    var age: Int = 0
    var body: some View {
        
        
        NavigationView{
            
            Form {  //открытие формы
                Section{    //открытие группы формы
                    
                    TextField("Weight", text: $weight,onEditingChanged:{ item in print("onEditingChanged:\(item):\(self.weight)")},
                              onCommit: {print ("Submitted: \(self.weight)")}).keyboardType(.phonePad)
                    //ввод веса
                    
                    DatePicker(
                        "Birhtdate",
                        selection: $birthday,
                        displayedComponents: .date) //выбор даты рождения
                    let time = toDate.timeIntervalSince(self.birthday)
                    let age = Int(time/(60*60*24*365))
                    if (age<18)
                    {
                        Text("Drink some tea, your age is " + "\(age)")
                    }
                    else{
                        Text("Welcome, your age is " + "\(age)")
                    }
                    //instead of if-else must appear an alert
                    Picker(
                        selection: $selectedGender,
                        label: Text("Select Gender"))
                    {
                        ForEach(0 ..< 2) {
                            Text(self.gender[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle()) //выбор пола
                }
                
                
                HStack {
                    NavigationLink("Start Party!!!", destination: theMainScreen())
                }.padding().foregroundColor(.blue)
            }
        }
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
