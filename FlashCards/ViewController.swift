//
//  ViewController.swift
//  FlashCards
//
//  Created by Peter Chuong on 10/13/18.
//  Copyright © 2018 Peter Chuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!

    
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
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if (questionLabel.isHidden) {
            questionLabel.isHidden = false
        } else {
            questionLabel.isHidden = true
        }
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
}

