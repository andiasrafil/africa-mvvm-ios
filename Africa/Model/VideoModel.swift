//
//  VideoModel.swift
//  Africa
//
//  Created by Accounting on 07/07/21.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
