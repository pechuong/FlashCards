//
//  CreationViewController.swift
//  FlashCards
//
//  Created by Peter Chuong on 10/27/18.
//  Copyright © 2018 Peter Chuong. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {

    var flashcardController: ViewController!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    var initialQuestion: String?
    var initialAnswer: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        
        if (questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty) {
            let alert = UIAlertController(title: "Missing Info", message: "You need to enter both a question and answer", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        } else {
            flashcardController.updateFlashcard(question: questionText!, answer: answerText!)
            dismiss(animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
