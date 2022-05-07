//
//  Progress_Screen.swift
//  alcalc
//
//  Created by Komarzz on 07.05.2022.
//

import SwiftUI


let VodkaTarget: Double = 1000.0
var circleProgress: Double = 0.0;

struct Progress_Screen: View {
    var body: some View {
        ZStack{
            List{
                HStack{
                    Text("Drink Liter Vodka").bold()
                    Spacer()
                    Text("Progress:")
                    Circle().trim(from: 0.0, to: circleProgress)
                        .stroke(Color.blue, lineWidth: 5)
                        .frame(width: 30, height: 30)
                        .rotationEffect(Angle(degrees: -90))
                    
                }
            }
        }
        
    }
    
}

struct Progress_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Progress_Screen()
    }
}

