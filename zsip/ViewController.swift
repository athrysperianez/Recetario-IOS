//
//  ViewController.swift
//  zsip
//
//  Created by ELIAS PERIAÑEZ AGUILERA on 28/11/18.
//  Copyright © 2018 ELIAS PERIAÑEZ AGUILERA. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var tblCategory: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func registerCells() {
        let indentificador = "cellCt"
        let cellNib = UINib(nibName: "TableViewCellCategory" , bundle: nil)
        tblCategory.register(cellNib, forCellReuseIdentifier:indentificador)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Repository.shared.getCategories().count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result: TableViewCellCategory = tableView.dequeueReusableCell(withIdentifier: "cellCt", for: indexPath) as! TableViewCellCategory
        result.titleLbl.text = Repository.shared.getCategories()[indexPath.row].name
        result.wallpaper.sd_setImage(with: URL(string: Repository.shared.getCategories()[indexPath.row].img), placeholderImage: nil, completed: nil)
        result.lblNumber.text = "\(Repository.shared.getCategories()[indexPath.row].arRecipes.count)"
        result.accessoryType = .disclosureIndicator
        return result
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipeController = RecipeViewController(category: Repository.shared.getCategories()[indexPath.row].name)
        navigationController?.pushViewController(recipeController, animated: true)
    }
}
