//
//  RatingControl.swift
//  FoodTracker2
//
//  Created by David Laiymani on 28/09/2016.
//  Copyright © 2016 IUT. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    var rating = 0
    
    
    var ratingButtons = [UIButton]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let emptyStarImage = UIImage(named: "emptyStar")
        let filledStarImage = UIImage(named: "filledStar")

        
        for _ in 0..<5 {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            
            button.setImage(emptyStarImage, for: UIControlState())
            button.setImage(filledStarImage, for: .selected)

            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), for: .touchDown)
            ratingButtons.append(button)        
            addSubview(button)
        }
        
    }
    
    override func layoutSubviews() {
        var buttonFrame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        for (index,button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (44+5))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    func ratingButtonTapped(_ button: UIButton) {
        
        rating = ratingButtons.index(of: button)! + 1
        if rating == 1 {
            if ratingButtons[0].isSelected == true {
                for (index,button) in ratingButtons.enumerated() {
                    button.isSelected = false
                }
                rating = 0
                
            } else {
                ratingButtons[0].isSelected = true
            }
        } else {
            updateButtonSelectionStates()

        }
        
        
    }

    func  updateButtonSelectionStates() {
        
        for (index,button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
        
    }
    
    

}
