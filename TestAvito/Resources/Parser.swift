//
//  Parser.swift
//  testTaskAvito
//
//  Created by Виктория Воробьева on 06.01.2021.
//

import Foundation

class Parser {
    public final func parserResult() -> ResultEntity? {
        let url = Bundle.main.url(forResource: "result", withExtension: "json")!
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: url)
            let entity = try decoder.decode(MenuEntity.self, from: data)
            return entity.result
        }catch {
            assertionFailure(error.localizedDescription)
        }
        return nil
    }
}
