//
//  startScreen.swift
//  alcalc
//
//  Created by Boss on 22.04.2022.
//

import SwiftUI

struct startScreen: View {
    @State private var age: String=""
    @State private var weight: String=""
    @State private var isFemale = false
    @State private var isMale = false
    var body: some View {
        
        TextField("Вес:", text: $weight,onEditingChanged:{ item in print("onEditingChanged:\(item):\(self.weight)")},
                          onCommit: {print ("After submitting: \(self.weight)")}).keyboardType(.phonePad)
        TextField("Возраст:", text: $age,onEditingChanged:{ item in print("onEditingChanged:\(item):\(self.age)")},
                          onCommit: {print ("After submitting: \(self.age)")}).keyboardType(.phonePad)
        Text("Please, choose your gender")
        NavigationLink{
            theMainScreenMale()
        }
    label:{
        Text("Мужской")
    }
        NavigationLink{
            theMainScreenFemale()
        }
    label:{
        Text("Женский")
    }
    }
}

struct startScreen_Previews: PreviewProvider {
    static var previews: some View {
        startScreen()
    }
}
