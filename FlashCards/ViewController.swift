//
//  ViewController.swift
//  FlashCards
//
//  Created by Peter Chuong on 10/13/18.
//  Copyright © 2018 Peter Chuong. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!

    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 20.0
        card.layer.shadowOpacity = 0.5
        answerLabel.layer.cornerRadius = 20.0
        questionLabel.layer.cornerRadius = 20.0
        answerLabel.clipsToBounds = true
        questionLabel.clipsToBounds = true
        
        btn1.layer.cornerRadius = 20.0
        btn2.layer.cornerRadius = 20.0
        btn3.layer.cornerRadius = 20.0
        
        btn1.layer.borderWidth = 3.0
        btn1.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
        btn2.layer.borderWidth = 3.0
        btn2.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        
        btn3.layer.borderWidth = 3.0
        btn3.layer.borderColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        
        readSavedFlashcards()
        
        if (flashcards.count == 0) {
            updateFlashcard(question: "What is my purpose?", answer: "Pass Butter")
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardController = self
        creationController.initialQuestion = questionLabel.text
        creationController.initialAnswer = answerLabel.text
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        flipFlashcard()
    }
    
    func flipFlashcard() {
        UIView.transition(with: card, duration: 0.3, options: .transitionFlipFromRight, animations: {
            if (self.questionLabel.isHidden) {
                self.questionLabel.isHidden = false
            } else {
                self.questionLabel.isHidden = true
            }
        })
        
    }
    
    func saveAllFlashcardsToDisk() {
        let dictionary = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer]
        }
        UserDefaults.standard.set(dictionary, forKey: "flashcards")
        print("Flashcards saved to UserDefaults")
    }
    
    func readSavedFlashcards() {
        if let dictionary = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            let savedCards = dictionary.map { (dictionaryArray) -> Flashcard in
                return Flashcard(question: dictionaryArray["question"]! , answer: dictionaryArray["answer"]!)
            }
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    func updateFlashcard(question: String, answer: String) {
        let flashcard = Flashcard(question: question, answer: answer)
        questionLabel.text = flashcard.question
        answerLabel.text = flashcard.answer
        
        flashcards.append(flashcard)
        print("Added flashcard :D")
        print("We now have \(flashcards.count) flashcards")
        saveAllFlashcardsToDisk()
        
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex)")
        
        updateNextPrevButtons()
        updateLabels()
    }
    
    func updateNextPrevButtons() {
        if (flashcards.count == 1) {
            prevButton.isEnabled = false
            nextButton.isEnabled = false
        } else if (currentIndex == 0) {
            prevButton.isEnabled = false
            nextButton.isEnabled = true
        } else if (currentIndex == flashcards.count - 1) {
            prevButton.isEnabled = true
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels() {
        let currentFlashcard = flashcards[currentIndex]
        questionLabel.text = currentFlashcard.question
        answerLabel.text = currentFlashcard.answer
    }
    
    @IBAction func btn1(_ sender: Any) {
        btn1.isHidden = true
    }
    
    @IBAction func btn2(_ sender: Any) {
        didTapOnFlashcard(0)
        btn1.isHidden = false
        btn3.isHidden = false
    }
    
    @IBAction func btn3(_ sender: Any) {
        btn3.isHidden = true
    }
    
    //***************************************
    // Next and Previous Button Tap Action
    //***************************************
    @IBAction func didTapOnPrev(_ sender: Any) {
        if (currentIndex > 0) {
            currentIndex -= 1
            updateNextPrevButtons()
            animateCardOut(direction: "left")
        }
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        if (currentIndex + 1 < flashcards.count) {
            currentIndex += 1
            updateNextPrevButtons()
            animateCardOut(direction: "right")
        }
    }
    
    //********************************
    // Animation of the flashcards
    //********************************
    func animateCardOut(direction: String) {
        
        UIView.animate(withDuration: 0.3, animations: {
            if (direction == "right") {
                self.card.transform = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0)
            } else {
                self.card.transform = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0)
            }
        }, completion: { finished in
            self.updateLabels()
            self.animateCardIn(direction: direction)
        })
    }
    
    func animateCardIn(direction: String) {
        
        if (direction == "right") {
            card.transform = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0)
        } else {
            card.transform = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0)
        }
        UIView.animate(withDuration: 0.3) {
            self.card.transform = CGAffineTransform.identity
        }
    }
}

