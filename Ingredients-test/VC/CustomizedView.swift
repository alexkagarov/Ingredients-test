//
//  CustomizedView.swift
//  Ingredients-test
//
//  Created by Alex Kagarov on 5/30/19.
//  Copyright © 2019 Alex Kagarov. All rights reserved.
//

import UIKit

class CustomizedView: UIView {
    
    @IBOutlet weak var selectedIngredientView: UIView!
    @IBOutlet weak var ingredientNameView: UIView!
    @IBOutlet weak var caloriesView: UIView!
    @IBOutlet weak var proteinView: UIView!
    @IBOutlet weak var fatView: UIView!
    @IBOutlet weak var carbsView: UIView!
    
    
    func setShadow(view: UIView) {
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.3
    }
    
    func setBorder(view: UIView, color: UIColor, thickness: Float) {
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = CGFloat(thickness)
    }
    
    func setCorners(view: UIView) {
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
    }
    
    override func awakeFromNib() {
        setShadow(view: selectedIngredientView)
        setCorners(view: selectedIngredientView)
        
        
        setCorners(view: caloriesView)
        setBorder(view: caloriesView, color: UIColor.init(red: 0.0, green: 0.3, blue: 0.0, alpha: 1), thickness: 1)
        
        setCorners(view: proteinView)
        setBorder(view: proteinView, color: .darkGray, thickness: 1)
        
        setCorners(view: fatView)
        setBorder(view: fatView, color: .darkGray, thickness: 1)
        
        setCorners(view: carbsView)
        setBorder(view: carbsView, color: .darkGray, thickness: 1)
    }
    
}
