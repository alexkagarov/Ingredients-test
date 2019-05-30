//
//  ViewController.swift
//  Ingredients-test
//
//  Created by Alex Kagarov on 5/29/19.
//  Copyright © 2019 Alex Kagarov. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController {
    
    fileprivate var dataArray = [Ingredient]() {
        didSet {
            tableView?.reloadData()
        }
    }
    @IBOutlet weak var backBtn: UINavigationItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    private let dataSource = TableDataModel()
    
    var selectedIngredient: Ingredient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        dataSource.requestData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ingredientSegue" {
            guard let ingredientDetails = segue.destination as? IngredientDetailsViewController else { return }
            ingredientDetails.selectedIngredient = selectedIngredient
        }
    }
}

extension IngredientsViewController: TableDataModelDelegate {
    func didReceiveUpdate(data: [Ingredient]) {
        dataArray = data
    }
    
    func didFailUpdate(error: Error) {
        print("Error: \(error)")
        let alert = UIAlertController(title: "Update failed", message: "Data update failed. Check the program logs for info.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension IngredientsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIngredient = dataArray[indexPath.row]
        print("Selected item: \(selectedIngredient)")
        performSegue(withIdentifier: "ingredientSegue", sender: nil)
    }
}

extension IngredientsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient", for: indexPath) as? IngredientTableViewCell {
            cell.configureCellWithItem(item: dataArray[indexPath.item])
            return cell
        }
        return UITableViewCell()
    }
}
