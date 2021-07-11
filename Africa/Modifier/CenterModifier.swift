//
//  CenterModifier.swift
//  Africa
//
//  Created by Accounting on 08/07/21.
//

import Foundation
import SwiftUI


struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
