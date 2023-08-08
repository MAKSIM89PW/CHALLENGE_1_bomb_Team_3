//  Team №3
//  GameViewController.swift
//  CHALLENGE №1
//
//  Created by Vanopr on 07.08.2023.
//

import UIKit
import Lottie
class GameViewController: UIViewController {

  
    @IBOutlet private var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //  Start LottieAnimationView with animation name (without extension)
          
          animationView = .init(name: "animation_ll0q8l7d")
          
          animationView!.frame = view.bounds
          
          
        animationView!.contentMode = .scaleAspectFit
          //  Set animation loop mode
          
          animationView!.loopMode = .loop
          
          //  Adjust animation speed
          
        // animationView!.animationSpeed = 8/30 // 30 секунд в дальнейшем можно изменять скорость
          
          
          //  Play animation
          
          animationView!.stop() // изменить на .play чтобы запустить анимацию
        
    }
    
    @IBAction func goBackFromStartScreenButton(_ sender: UIButton) {
        func performSegue(withIdentifier identifier: String, sender: Any?) {
            if identifier == "GoBackFromStartScreen" {
              // Do something before the segue is performed
              super.performSegue(withIdentifier: "GoBackFromStartScreen", sender: nil)
            }
          }
    }
    

}

