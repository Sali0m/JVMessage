//
//  ViewController.swift
//  JVMessage
//
//  Created by Jehan Vossen on 31/01/2016.
//  Copyright © 2016 Jehan Vossen. All rights reserved.
//

import UIKit
import JVMessage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showMessagePressed(_ sender: UIButton) {
        JVMessage.showMessage("Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine.", inView: self.view)
    }

    @IBAction func showErrorMessagePressed(_ sender: UIButton) {
        JVMessage.showErrorMessage("Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine.", inView: self.view)
    }
}

