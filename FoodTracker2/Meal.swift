//
//  Meal.swift
//  FoodTracker2
//
//  Created by David Laiymani on 05/10/2016.
//  Copyright © 2016 IUT. All rights reserved.
//

import UIKit

class Meal {
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    
}
