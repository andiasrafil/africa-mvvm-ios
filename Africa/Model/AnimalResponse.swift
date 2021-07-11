//
//  AnimalResponse.swift
//  Africa
//
//  Created by Accounting on 11/07/21.
//

import Foundation


struct AnimalElement: Codable, Identifiable {
    let id, name, headline, animalDescription: String
    let link: String
    let image: String
    let gallery, fact: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, headline
        case animalDescription = "description"
        case link, image, gallery, fact
    }
}

typealias Animals = [AnimalElement]

extension AnimalElement {
    static var dummyData: [AnimalElement] {
        .init(
            repeating: AnimalElement(
                id: "TEST",
                name: "LION",
                headline: "LION HAUMMM",
                animalDescription: "HAUMMM LION",
                link: "https://en.wikipedia.org/wiki/Lion",
                image: "lion",
                gallery: ["lion-1", "lion-2", "lion-3"],
                fact: ["Female lions raise the cubs and are also the primary hunters."]),
            count: 1)
//        .init(id: "test", name: "nyoba", headline: "nyoba dong", animalDescription: "description dong", link: "https://en.wikipedia.org/wiki/Lion", image: "lion", gallery: ["lion-1", "lion-2", "lion-3"], fact: ["Female lions raise the cubs and are also the primary hunters."])
    }
}
