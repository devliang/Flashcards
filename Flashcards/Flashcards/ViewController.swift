//
//  ViewController.swift
//  Flashcards
//
//  Created by Ryan Fang on 10/13/18.
//  Copyright © 2018 Liang Fang. All rights reserved.
//

import UIKit

protocol EditDelegate: class {
    func onEditFinished(label1: String, label2: String, btn1: String, btn2: String, btn3: String)
}


class ViewController: UIViewController, EditDelegate {
    func onEditFinished(label1: String, label2: String, btn1: String, btn2: String, btn3: String) {
        frontLabel.text = label1
        backLabel.text = label2
        btnOptionOne.setTitle(btn1, for: .normal)
        btnOptionTwo.setTitle(btn2, for: .normal)
        btnOptionThree.setTitle(btn3, for: .normal)
    }

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("didload")
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
        frontLabel.isHidden = !frontLabel.isHidden
//        if(!frontLabel.isHidden){  //current is front
//            frontLabel.isHidden = true;
//        }
//        else{ // current is back
//            frontLabel.isHidden = false;
//        }
        
    }

    func updateFlashcard(question: String, answer: String) {
        dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //We know the destination of the segue is the navagation controller
        let navigationController = segue.destination as! UINavigationController
        
        //We know the navigation controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        //We set the flashcardsController property to self
        creationController.flashcardsController = self
        creationController.delegate = self
        
        creationController.initialQuestion = frontLabel.text
        creationController.initialAnswer = backLabel.text
        
        if segue.identifier == "EditSegue"{
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
        }
    }
    
    @IBAction func didTapOptionOne(_ sender: Any) {
        if let text = btnOptionOne.titleLabel!.text {
            if(text == backLabel.text!){
                frontLabel.isHidden = true;
                btnOptionTwo.isHidden = true;
                btnOptionThree.isHidden = true;
            }
        }
    }
    
    @IBAction func didTapOptionTwo(_ sender: Any) {
        if let text = btnOptionTwo.titleLabel!.text {
            if(text == backLabel.text!){
                frontLabel.isHidden = true;
                btnOptionOne.isHidden = true;
                btnOptionThree.isHidden = true;
            }
        }
    }

    @IBAction func didTapOptionThree(_ sender: Any) {
        if let text = btnOptionThree.titleLabel!.text {
            if(text == backLabel.text!){
                frontLabel.isHidden = true;
                btnOptionOne.isHidden = true;
                btnOptionTwo.isHidden = true;
            }
        }
    }
    
    
    
}

