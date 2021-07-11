//
//  CreditView.swift
//  Africa
//
//  Created by Accounting on 08/07/21.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack() {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("""
                Copyright Andi Asrafil
                All right reserved
                Better Apps 🥶 Less Code
                """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
