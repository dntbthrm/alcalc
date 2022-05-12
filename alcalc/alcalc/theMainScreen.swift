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
    @State private var allVol: Int = 0
    @State private var allAlc: Float = 0
    @State private var promille: Float = 0
    @State var timeRemaining = 84600
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        
        HStack{
        Text("\(String(format: "%.2f",promille))"+"‰").onReceive(timer) { _ in
                if timeRemaining > 0 && promille > 0{
                            timeRemaining -= 1
                            promille -= 1/84600
                }
            }

            Button (action:
                    {
                        self.pressP.toggle()
                    })
                    {
                        Text("A").foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.yellow)
                            .cornerRadius(15)
                            .padding(.leading, 100.0)
                    }
                    .padding(.leading)
                    .sheet(isPresented: $pressP)
                        {
                            Progress_Screen()
                            
                        }.frame(alignment: .trailing).padding()
        
        }.frame( maxHeight: .infinity, alignment: .topLeading)
        HStack{
            Image("cat").resizable().frame(width: 200, height: 300, alignment: .center)
        }.frame(maxHeight: .infinity, alignment: .bottom)
        HStack{
            HStack{
                NavigationLink("Menu", destination: Menu(name: "", alcohol: "", volume: "", selColor: Color.white, allVol: $allVol, allAlc: $allAlc, promille: $promille)).frame( alignment: .leading).padding()
            }.foregroundColor(.white)
                .frame(width: 100, height: 100)
                .background(Color.green)
                .cornerRadius(15)
                .padding()
            Button (action:
                    {
                        self.pressS.toggle()
                    })
                    {
                        Text("Drunk List").foregroundColor(.white)
                            .frame(width: 100, height: 100)
                            .background(Color.red)
                            .cornerRadius(15)
                            .padding()
                    }
                    .padding(.leading)
                    .sheet(isPresented: $pressS)
                        {
                            ListOfDrinked()
                            
                        }.frame(alignment: .trailing).padding(.leading, 20.0)
        }.frame(maxHeight: .infinity, alignment: .bottom).padding(.horizontal, 50.0)
    }
}

struct theMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        theMainScreen()
    }
}
