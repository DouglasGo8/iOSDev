//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageViewOne: UIImageView!
    
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        //diceImageViewOne.image = UIImage(imageLiteralResourceName: "DiceSix")
        diceImageViewOne.alpha = 0.5
        diceImageViewTwo.alpha = 0.5
        //
        
    }
    

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        print("Pressed button")
        //
        diceImageViewTwo.image = UIImage(imageLiteralResourceName: "DiceTwo")
    }
    
}

