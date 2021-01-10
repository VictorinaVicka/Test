//
//  ListEntity.swift
//  TestAvito
//
//  Created by Виктория Воробьева on 06.01.2021.
//

import Foundation

struct ListEntity: Codable {
    
    let id: String
    let title: String
    let description: String?
    let icon: IconEntity
    let price: String
    let isSelected: Bool
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try? container.decode(String.self, forKey: .description)
        self.icon = try container.decode(IconEntity.self, forKey: .icon)
        self.price = try container.decode(String.self, forKey: .price)
        self.isSelected = try container.decode(Bool.self, forKey: .isSelected)
    }
}
