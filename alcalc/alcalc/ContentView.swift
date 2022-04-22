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
    @State var check = false
    
    
    
    var body: some View {
        
        
        NavigationView{
            
            Form {  //открытие формы
                Section{    //открытие группы формы
                    
                    TextField("Weight", text: $weight)  //ввод веса
                    
                    DatePicker(
                        "Birhtdate",
                        selection: $birthday,
                        displayedComponents: .date) //выбор даты рождения
                    
                    
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
                            NavigationLink("Start Party!!!", destination: MainScreen())
                                
                            
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
