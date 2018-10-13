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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        card.layer.cornerRadius = 20.0
        card.clipsToBounds = true
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if (questionLabel.isHidden) {
            questionLabel.isHidden = false
        } else {
            questionLabel.isHidden = true
        }
    }
    
}

