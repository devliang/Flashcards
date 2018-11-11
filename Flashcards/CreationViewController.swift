//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Ryan Fang on 11/7/18.
//  Copyright © 2018 Liang Fang. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var btn1AnswerTextField: UITextField!
    @IBOutlet weak var btn2AnswerTextField: UITextField!
    @IBOutlet weak var btn3AnswerTextField: UITextField!
    
    
    var initialQuestion: String?
    var initialAnswer: String?
    
    weak var delegate: EditDelegate?
    
    var flashcardsController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
    }

    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        //get the text in the question text field
        let questionText = questionTextField.text
        
        //get the text in the answer text field
        let answerText = answerTextField.text
        
        let btn1Text = btn1AnswerTextField.text
        let btn2Text = btn2AnswerTextField.text
        let btn3Text = btn3AnswerTextField.text
        
        //Check if empty
        if (questionText == nil || answerText == nil || btn1Text == nil || btn2Text == nil || btn3Text == nil || questionText!.isEmpty || answerText!.isEmpty || btn1Text!.isEmpty || btn2Text!.isEmpty || btn3Text!.isEmpty){
            
            //show error
            let alert = UIAlertController(title: "Missing Text", message: "You need to enter all the question and answer", preferredStyle: .alert)
            present(alert, animated: true)
            //dismiss the alert
            let okAction = UIAlertAction(title: "Ship it", style: .default)
            alert.addAction(okAction)
        }
        else{
            //call the function to update the flashcard
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
            
            //dismiss
            delegate?.onEditFinished(label1: questionText!, label2: answerText!,btn1: btn1AnswerTextField.text!, btn2: btn2AnswerTextField.text!, btn3: btn3AnswerTextField.text!)
            dismiss(animated: true)
        }
        
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
