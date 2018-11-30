//
//  RecipeViewController.swift
//  zsip
//
//  Created by ELIAS PERIAÑEZ AGUILERA on 28/11/18.
//  Copyright © 2018 ELIAS PERIAÑEZ AGUILERA. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var tableRecipe: UITableView!
    var category:String!
    
    convenience init(category:String) {
        self.init()
        self.category = category
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }

    func registerCells(){
        let indentificador = "recipeCell"
        let cellNib = UINib(nibName: "RecipeTableViewCell" , bundle: nil)
        tableRecipe.register(cellNib, forCellReuseIdentifier:indentificador)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension RecipeViewController: UITableViewDelegate, UITableViewDataSource{
    
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Repository.shared.getRecipes(category: category).count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let result: RecipeTableViewCell  = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeTableViewCell
            result.titleLbl.text = Repository.shared.getRecipes(category: category)[indexPath.row].title
            result.img.sd_setImage(with: URL(string: Repository.shared.getRecipes(category: category)[indexPath.row].img), completed: nil)


            return result
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let recipeController = RecipeDetailsViewController(recipe:Repository.shared.getRecipes(category: category)[indexPath.row])
            navigationController?.pushViewController(recipeController, animated: true)
        }
    }

