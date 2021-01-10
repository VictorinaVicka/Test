//
//  NoticeResources.swift
//  TestAvito
//
//  Created by Виктория Воробьева on 10.01.2021.
//

import Foundation

struct NoticeResources {
    
    private var parser = Parser()
    
    private var resultEntity: ResultEntity!
    
    private(set) var title: String
    private(set) var actionTitle: String
    private(set) var selectedActionTitle: String
    private(set) var list = [ListEntity]()
    
    init() {
        resultEntity = parser.parserResult()
        self.title = resultEntity.title
        self.actionTitle = resultEntity.actionTitle
        self.selectedActionTitle = resultEntity.selectedActionTitle
        list = resultEntity.list
    }
}
