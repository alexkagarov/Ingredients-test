//
//  IngredientsModel.swift
//  Ingredients-test
//
//  Created by Alex Kagarov on 5/29/19.
//  Copyright © 2019 Alex Kagarov. All rights reserved.
//

import Foundation

struct Ingredient: Decodable {
    var name: String?
    var calories: Int?
    var protein: Float?
    var fat: Float?
    var carbs: Float?
}
