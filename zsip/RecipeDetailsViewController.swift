//
//  RecipeDetailsViewController.swift
//  zsip
//
//  Created by ELIAS PERIAÑEZ AGUILERA on 30/11/18.
//  Copyright © 2018 ELIAS PERIAÑEZ AGUILERA. All rights reserved.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
    
    @IBOutlet weak var difficulty: UILabel!
    @IBOutlet weak var textIng: UITextView!
    @IBOutlet weak var textSteps: UITextView!
    @IBOutlet weak var img: UIImageView!
    
    var recipe:Recipe!
    
    convenience init(recipe: Recipe) {
        self.init()
        self.recipe = recipe
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        difficulty.text = recipe.dififculty
        img.sd_setImage(with: URL(string: recipe.img), completed: nil)
        setTexts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnMap(_ sender: Any) {
        let map = MapViewController(lat: recipe.geo.lat, lng: recipe.geo.long)
        navigationController?.pushViewController(map, animated: true)
    }
    
    internal func setTexts(){
        var txtTmp = ""
        var i:Int = 1
        for tx in recipe.ingredients{
            txtTmp = "\(txtTmp)\n\(i). \(tx)"
            i = i+1
        }
        textIng.text = txtTmp

        txtTmp = ""
        i = 1
        for tx in recipe.steps{
            txtTmp = "\(txtTmp)\n\(i). \(tx)"
            i = i+1
        }
        textSteps.text = txtTmp

        
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
