//
//  ListOfDrinked.swift
//  alcalc
//
//  Created by Boss on 09.05.2022.
//

import SwiftUI

struct ListOfDrinked: View {
    var body: some View {
    List(DrinkedList, id: \.id) { index in
    Text(index.name + " " + "\(index.alcohol)%" + " " + "\(index.volume)ml")
    }
    }
}

struct ListOfDrinked_Previews: PreviewProvider {
    static var previews: some View {
        ListOfDrinked()
    }
}
