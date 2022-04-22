//
//  MainScreen.swift
//  alcalc
//
//  Created by Komarzz on 22.04.2022.
//

import SwiftUI

struct MainScreen: View {
    @State private var press = false
    var body: some View {
        Button (action:
                            {
                    self.press.toggle()
                })
                {
                    Text("choose a drink")
                }.sheet(isPresented: $press)
                {
                    Menu()
                }

    }
    
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
