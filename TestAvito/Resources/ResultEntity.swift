//
//  ResultEntity.swift
//  TestAvito
//
//  Created by Виктория Воробьева on 06.01.2021.
//

import Foundation

struct ResultEntity: Codable {
        
    let title: String
    let actionTitle: String
    let selectedActionTitle: String
    let list: [ListEntity]
}
