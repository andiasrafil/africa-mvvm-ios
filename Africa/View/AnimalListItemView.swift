//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Accounting on 07/07/21.
//

import SwiftUI

struct AnimalListItemView: View {
    
    let animal: AnimalElement
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 16, content: {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            VStack(alignment: .leading, spacing: 8, content: {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .lineLimit(2)
                    .padding(.trailing, 8)
                
            })
        })
    }
}

struct AnimalListItemView_Previews: PreviewProvider {
    static let animals: [AnimalElement] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalListItemView(animal: animals[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
