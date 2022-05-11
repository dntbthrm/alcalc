//
//  Progress_Screen.swift
//  alcalc
//
//  Created by Komarzz on 07.05.2022.
//

import SwiftUI

struct Progress_Screen: View {
    var body: some View {
        ZStack{
            List(drinksArray, id: \.id) { index in
                if (index.target != 0){
                HStack{
                    VStack(alignment: .leading, spacing: 5){
                        Text(index.taskName).bold()
                        Text(index.task)
                    }
                    Spacer()
                    Text("Progress:")
                    Circle().trim(from: 0.0, to: index.progress)
                        .stroke(Color.blue, lineWidth: 5)
                        .frame(width: 30, height: 30)
                        .rotationEffect(Angle(degrees: -90))
                    
                }
                    Spacer()
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

