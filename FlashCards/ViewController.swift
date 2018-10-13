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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if (questionLabel.isHidden) {
            questionLabel.isHidden = false
        } else {
            questionLabel.isHidden = true
        }
    }
    
}

