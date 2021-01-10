//
//  Parser.swift
//  testTaskAvito
//
//  Created by Виктория Воробьева on 06.01.2021.
//

import Foundation

//struct Parser<Type> where Type: Codable {
//
//    func parse(filename: String) -> Type? {
//        guard
//            let url = Bundle.main.url(forResource: filename, withExtension: nil),
//            let data = try? Data(contentsOf: url)
//        else { return nil }
//        do {
//            let entity = try JSONDecoder().decode(Type.self, from: data)
//            return entity
//        } catch {
//            assertionFailure(error.localizedDescription)
//        }
//
//        return nil
//    }
//}

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
