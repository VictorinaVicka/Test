//
//  IconEntity.swift
//  TestAvito
//
//  Created by Виктория Воробьева on 06.01.2021.
//

import Foundation

struct IconEntity: Codable {
    
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "52x52"
    }
}
