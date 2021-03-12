//
//  Character.swift
//  BrBd
//
//  Created by Ujjwal on 07/03/2021.
//

import Foundation

struct CharacterElement: Codable {
    let charID: Int
    let name, birthday: String
    let occupation: [String]
    let img: String
    let status, nickname: String
    let appearance: [Int]
    let portrayed, category: String

    enum CodingKeys: String, CodingKey {
        case charID = "char_id"
        case name, birthday, occupation, img, status, nickname, appearance, portrayed, category
    }
}

typealias Character = [CharacterElement]
