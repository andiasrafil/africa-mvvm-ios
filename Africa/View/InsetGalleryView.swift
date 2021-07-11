//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Accounting on 07/07/21.
//

import SwiftUI

struct InsetGalleryView: View {
    
    let animal: AnimalElement
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 15, content: {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            })
        }
        
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetGalleryView(animal: AnimalElement.dummyData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
