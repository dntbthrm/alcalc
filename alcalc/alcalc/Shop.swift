//
//  Shop.swift
//  alcalc
//
//  Created by Boss on 24.04.2022.
//

import SwiftUI

struct Shop: View {
    var body: some View {
        
        List(DrinkedList, id: \.id) { index in
                    Text(index.name + " " + "\(index.alcohol)%" + " " + "\(index.volume)ml")
        }
    }
}

struct Shop_Previews: PreviewProvider {
    static var previews: some View {
        Shop()
    }
}
