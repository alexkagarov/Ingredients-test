//
//  TableDataModelDelegate.swift
//  Ingredients-test
//
//  Created by Alex Kagarov on 5/30/19.
//  Copyright © 2019 Alex Kagarov. All rights reserved.
//

import Foundation

protocol TableDataModelDelegate: AnyObject {
    func didReceiveUpdate(data: [Ingredient])
    func didFailUpdate(error: Error)
}
