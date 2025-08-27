//
//  SampleViewController.swift
//  HackNews
//
//  Created by Sai Avinash Vagicherla on 8/23/25.
//

import UIKit

class SampleViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    override func loadView() {
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
        @IBAction func buttonAction(_ sender: Any) {
            if let userName = userNameTextField.text, userName.count > 6 {
                view.backgroundColor = .systemGreen
            } else {
                view.backgroundColor = .systemRed
            }
        }
}
