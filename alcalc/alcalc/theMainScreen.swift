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
            ZStack{
                darkGray.ignoresSafeArea()
            VStack{
            HStack{
                Text("Per mille: "+"\(String(format: "%.2f",promille))"+"‰")
                    .font(.title)
                    .fontWeight(.bold).foregroundColor(.white)
                    .onReceive(timer) { _ in
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
                            Image("crown").frame(width:65, height:65, alignment: .center).opacity(1).background(Color.yellow).cornerRadius(10)
                        }
                        .padding(.leading)
                        .sheet(isPresented: $pressP)
                            {
                                Progress_Screen()
                                
                            }.frame(alignment: .trailing).padding()
            
            }.frame(maxWidth: 500, maxHeight: 100,alignment: .bottom).background(gray)
            HStack{
                Image("cat").resizable().frame(width: 200, height: 300, alignment: .center)
            }.frame(maxHeight: .infinity, alignment: .center)
            HStack{
                NavigationLink(destination: Menu(name: "", alcohol: "", volume: "", selColor: Color.white, allVol: $allVol, allAlc: $allAlc, promille: $promille)){
                        Text("Menu").fontWeight(.bold)
                                    .frame( alignment: .leading).foregroundColor(.white)
                                    .frame(width: 162, height: 122)
                                    .background(Color.yellow)
                                    .cornerRadius(10)
                                    
                }
                .padding(.trailing, 7.0)
                Button (action:
                        {
                            self.pressS.toggle()
                        })
                        {
                            Text("Drunk List").fontWeight(.bold).foregroundColor(.white)
                                .frame(width: 162, height: 122)
                                .background(Color.orange)
                                .cornerRadius(10)
                        }
                        .padding(.leading, 7.0)
                        .sheet(isPresented: $pressS)
                            {
                                ListOfDrinked()
                                
                            }.frame(alignment: .trailing)
            }.padding(.bottom, 15.0).frame(maxWidth:500, maxHeight: 150, alignment: .bottom)
        }
            }.navigationBarHidden(true)
        }
}

struct theMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        theMainScreen()
    }
}
