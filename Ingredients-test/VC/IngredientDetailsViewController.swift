//
//  IngredientDetailsViewController.swift
//  Ingredients-test
//
//  Created by Alex Kagarov on 5/29/19.
//  Copyright © 2019 Alex Kagarov. All rights reserved.
//

import UIKit

class IngredientDetailsViewController: UIViewController {
    
    @IBOutlet weak var selectedIngredientName: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    var selectedIngredient: Ingredient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataFilling(item: selectedIngredient)
    }
    
    func dataFilling(item: Ingredient?) {
        if let name = item?.name, let protein = item?.protein, let fat = item?.fat, let carbs = item?.carbs, let calories = item?.calories {
            selectedIngredientName.text = name
            proteinLabel.text = String(protein)
            fatLabel.text = String(fat)
            carbsLabel.text = String(carbs)
            caloriesLabel.text = String(calories)
        }
    }
}

