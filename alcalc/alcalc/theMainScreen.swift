//
//  theMainScreen.swift
//  alcalc
//
//  Created by Boss on 24.04.2022.
//

import SwiftUI

struct Drinked: Identifiable{
    var id = UUID()
    let name: String
    let alcohol: String
    let volume: String
}

var DrinkedList: [Drinked] = []

struct theMainScreen: View {
    @State private var pressM = false
    @State private var pressP = false
    @State private var pressS = false
    var body: some View {
        HStack{
            Text("here will be percentage").frame(alignment: .leading)
            Button (action:
                    {
                        self.pressP.toggle()
                    })
                    {
                        Text("A").foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.yellow)
                            .cornerRadius(15)
                            .padding()
                    }
                    .padding(.leading)
                    .sheet(isPresented: $pressP)
                        {
                            yourProgress()
                            
                        }.frame(alignment: .trailing).padding()
        
        }.frame( maxHeight: .infinity, alignment: .topLeading)
        HStack{
            Image("cat").resizable().frame(width: 200, height: 300, alignment: .center)
        }.frame(maxHeight: .infinity, alignment: .bottom)
        HStack{
            HStack{
                NavigationLink("Menu", destination: Menu(name: "", alcohol: "", volume: ""))
            }
            Button (action:
                    {
                        self.pressS.toggle()
                    })
                    {
                        Text("Shop").foregroundColor(.white)
                            .frame(width: 100, height: 100)
                            .background(Color.red)
                            .cornerRadius(15)
                            .padding()
                    }
                    .padding(.leading)
                    .sheet(isPresented: $pressS)
                        {
                            Shop()
                            
                        }.frame(alignment: .trailing).padding()
    }.frame(maxHeight: .infinity, alignment: .bottom)
    }
}

struct theMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        theMainScreen()
    }
}
