//
//  ViewController.swift
//  Flashcards
//
//  Created by Ryan Fang on 10/13/18.
//  Copyright © 2018 Liang Fang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Give it rounded corner
        card.layer.shadowRadius = 15.0;
        card.layer.shadowOpacity = 0.2;
        
        //card.clipsToBounds = true;
        
        frontLabel.layer.cornerRadius = 20.0;
        frontLabel.clipsToBounds = true;
        
        backLabel.layer.cornerRadius = 20.0;
        backLabel.clipsToBounds = true;
        
        
        btnOptionOne.layer.cornerRadius = 20.0;
        btnOptionOne.layer.borderWidth = 3.0;
        btnOptionOne.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1);
        
        btnOptionTwo.layer.cornerRadius = 20.0;
        btnOptionTwo.layer.borderWidth = 3.0;
        btnOptionTwo.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1);
        
        btnOptionThree.layer.cornerRadius = 20.0;
        btnOptionThree.layer.borderWidth = 3.0;
        btnOptionThree.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if(!frontLabel.isHidden){  //current is front
            frontLabel.isHidden = true;
//            backLabel.isHidden = false;
        }
        else{ // current is back
            frontLabel.isHidden = false;
//            backLabel.isHidden = true;
        }
        
    }

    @IBAction func didTapOptionOne(_ sender: Any) {
        btnOptionOne.isHidden = true;
        
    }

    @IBAction func didTapOptionTwo(_ sender: Any) {
        frontLabel.isHidden = true;
        btnOptionOne.isHidden = true;
        btnOptionThree.isHidden = true;
    }

    @IBAction func didTapOptionThree(_ sender: Any) {
        btnOptionThree.isHidden = true;
    }
}

