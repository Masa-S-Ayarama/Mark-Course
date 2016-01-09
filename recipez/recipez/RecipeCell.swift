//
//  RecipeCell.swift
//  recipez
//
//  Created by Nas@Mac on 2/1/59.
//  Copyright © พ.ศ. 2559 Nas@Mac. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(recipe: Recipe) {
        recipeTitle.text = recipe.title
        recipeImage.image = recipe.getRecipeImg()
    }

}
