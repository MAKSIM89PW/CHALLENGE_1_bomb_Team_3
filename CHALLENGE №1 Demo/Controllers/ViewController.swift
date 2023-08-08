//  Team №3
//  ViewController.swift
//  CHALLENGE №1 
//
//  Created by Vanopr on 07.08.2023.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    let gradientLayer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func askButton(_ sender: UIButton) {
        func performSegue(withIdentifier identifier: String, sender: Any?) {
            if identifier == "AskViewAction" {
              // Do something before the segue is performed
              super.performSegue(withIdentifier: "AskViewAction", sender: nil)
            }
          }
    }
    @IBAction func CategoryButton(_ sender: Any) {
        func performSegue(withIdentifier identifier: String, sender: Any?) {
            if identifier == "CategoryViewAction" {
              // Do something before the segue is performed
              super.performSegue(withIdentifier: "CategoryViewAction", sender: nil)
            }
          }
    }
    
    @IBAction func startGameButton(_ sender: UIButton) {
        
        func performSegue(withIdentifier identifier: String, sender: Any?) {
            if identifier == "GameStartViewAction" {
              // Do something before the segue is performed
              super.performSegue(withIdentifier: "GameStartViewAction", sender: nil)
            }
          }
    }
    
   
}
