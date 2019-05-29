//
//  IngredientTableViewCell.swift
//  Ingredients-test
//
//  Created by Alex Kagarov on 5/29/19.
//  Copyright © 2019 Alex Kagarov. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    @IBOutlet weak var itemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCellWithItem(item: Ingredient) {
        itemName?.text = item.name
    }

}
