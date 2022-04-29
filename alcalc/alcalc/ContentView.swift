//
//  ContentView.swift
//  alcalc
//
//  Created by Mikhail Bulukhto on 19.04.2022.
//

import SwiftUI
struct Person: Identifiable{
    var id = UUID()
    let theWeight: String
    let chosenGender: Int
}
var someone = Person(theWeight: "", chosenGender: 0)
struct ContentView: View {
    
    @State var birthday = Date()
    @State var weight: String=""
    var gender = ["Male" , "Female"]
    @State var selectedGender: Int = 0
    var toDate = Date()
    var age: Int = 0
    @State var good = false
    
  

    
    @State var alert = false
    
    var body: some View {
        
        
        NavigationView{
            
            Form {  //открытие формы
                Section{    //открытие группы формы
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
                    
                    DatePicker(
                        "Birhtdate",
                        selection: $birthday,
                        displayedComponents: .date)
                    //*let time = toDate.timeIntervalSince(self.birthday)
                    //let age = Int(time/(60*60*24*365))
                    //Button(action: {
                        //someone = Person(theWeight: weight, chosenGender: selectedGender)
                        //self.good = true
                    //}, label:
                    //{
                        //Text("Confirm")
                   // }).disabled(weight.isEmpty || age < 18 ).colorMultiply(Color.green)

                    
//выбор даты рождения
                }
                .padding()
                
                Section{
                    VStack {
                        NavigationLink("Start Party!!!", destination: theMainScreen())//.disabled(good == false)
                    }.foregroundColor(.purple).padding()
                    VStack{ NavigationLink("Settings",destination: settingsScreen())
                    }.foregroundColor(.purple).padding()
                }
                
                Section{
                    Text("Version: 0.1").fontWeight(.ultraLight).padding(.leading, 130.0)
                }
                
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
