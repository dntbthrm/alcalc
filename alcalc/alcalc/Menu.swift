//
//  Menu.swift
//  alcalc
//
//  Created by Komarzz on 23.04.2022.
//

import SwiftUI


struct Menu: View {
    
    struct Drink: Identifiable{
        var id = UUID()
        let name: String
        let alcohol: Int
        let volume: Int
    }
    
   var drinksArray = [
        Drink(name:"Vodka", alcohol:40, volume:50),
        Drink(name:"Vine", alcohol:8, volume:150),
        Drink(name:"Bear", alcohol:4, volume:500),
        Drink(name:"Rom", alcohol:40, volume:50)
    ]
    
    @State private var showPopUp: Bool = false
    
    
    
    
    
    var body: some View {
        List(drinksArray) {
            Text($0.name + "  " + "\($0.alcohol)%" + "  " + "\($0.volume)ml")
        }
            
            ZStack {
                            NavigationView {
                                ZStack(alignment: .center) {
                                    Button(action: {

                                            showPopUp.toggle()
                                        
                                    }, label: {
                                        Text("Add Drink")
                                    })
                                }
                            }

                            AddDrink_PopUp(name: "", alcohol: "", volume: "", show: $showPopUp)
                        }

    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
