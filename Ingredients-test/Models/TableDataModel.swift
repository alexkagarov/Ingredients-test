//
//  TableDataModel.swift
//  Ingredients-test
//
//  Created by Alex Kagarov on 5/29/19.
//  Copyright © 2019 Alex Kagarov. All rights reserved.
//

import Foundation

protocol TableDataModelDelegate: AnyObject {
    func didReceiveUpdate(data: [Ingredient])
    func didFailUpdate(error: Error)
}

class TableDataModel {
    
    weak var delegate: TableDataModelDelegate?
    
    func requestData() {
        do {
            guard let jsonSource = Bundle.main.url(forResource: "ingredients", withExtension: "json") else { return }
            
            let jsonData = try Data(contentsOf: jsonSource)
            
            do {
                let ingredients = try JSONDecoder().decode([Ingredient].self, from: jsonData)
                print(ingredients)
                self.setDataWithResponse(response: ingredients as [AnyObject])
            }
            catch {
                print("Parse error: \(error)")
                    self.delegate?.didFailUpdate(error: error)
            }
        }
        catch let jsonError {
            print("JSON error: \(jsonError)")
        }
    }
    
    private func setDataWithResponse(response: [AnyObject]) {
        var data = [Ingredient]()
        for item in response {
            data.append(item as! Ingredient)
        }
        self.delegate?.didReceiveUpdate(data: data)
    }
}
