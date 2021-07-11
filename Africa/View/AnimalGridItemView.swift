//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Accounting on 08/07/21.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal: AnimalElement
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(8)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [AnimalElement] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
    }
}
