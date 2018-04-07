//
//  LandingScreenCollectionViewCell.swift
//  TheMoviesApp
//
//  Created by Nitesh Vishwakarma on 25/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

class LandingScreenCollectionViewCell : UICollectionViewCell
{
    //MARK : Outlets
    @IBOutlet weak var MoviePoster: UIImageView!
    @IBOutlet weak var MovieTitle: UILabel!
    
    
    
    //MARK : Class Override Functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
