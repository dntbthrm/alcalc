//
//  ContentView.swift
//  alcalc
//
//  Created by Mikhail Bulukhto on 19.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        NavigationView {
            NavigationLink{
                startScreen()
            } label:{
                Text("Press to start")
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
