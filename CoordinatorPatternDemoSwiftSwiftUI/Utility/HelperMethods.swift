//
//  JSONMethods.swift
//  CoordinatorPatternDemo
//
//  Created by Daniyal Yousuf on 2023-05-28.
//

import Foundation

enum JSONErrors: Error {
    case fileNotFound
    case invalid(String)
}

func readLocalJSONFile(forName name: String) -> Result<Data, JSONErrors> {
    do {
        if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
            let fileUrl = URL(fileURLWithPath: filePath)
            let data = try Data(contentsOf: fileUrl)
            return .success(data)
        } else {
            return .failure(.fileNotFound)
        }
    } catch {
        return .failure(.invalid(error.localizedDescription))
    }
}

func parse<T: Codable>(jsonData: Data) -> Result<T, JSONErrors> {
    do {
        let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
        return .success(decodedData)
    } catch {
        return .failure(.invalid(error.localizedDescription))
    }
}


