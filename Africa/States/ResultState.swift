//
//  ResultState.swift
//  Africa
//
//  Created by Accounting on 11/07/21.
//

import Foundation

enum ResultState {
    case loading
    case success(content: Animals)
    case failed(error: Error)
}
