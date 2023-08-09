//  Team №3
//  GameViewController.swift
//  CHALLENGE №1
//
//  Created by Vanopr on 07.08.2023.

import UIKit
import Lottie
import AVFoundation

class GameViewController: UIViewController {
    @IBOutlet weak var initiateButton: UIButton!
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
    
    var timer: Timer?
    var player: AVAudioPlayer?
    var musicDuration: TimeInterval = 25.0

    @objc func firstTimer() {
        // Загрузка и воспроизведение первой мелодии
        if let firstSoundURL = Bundle.main.url(forResource: "timerSound", withExtension: "mp3") {
            player = try? AVAudioPlayer(contentsOf: firstSoundURL)
            player?.play()
            // Set the duration of the sound to 25 seconds
            
            Timer.scheduledTimer(withTimeInterval: musicDuration, repeats: false) { _ in
                self.player?.stop()
                self.secondTimer()
            }
        }
    }
    
    @objc func secondTimer() {
            // Смена мелодии
            if let secondSoundURL = Bundle.main.url(forResource: "timerOverSound", withExtension: "mp3") {
                player = try? AVAudioPlayer(contentsOf: secondSoundURL)
                player?.play()
            }
            // Завершение таймера
            timer?.invalidate()
            timer = nil
        }
    
    
    
    
    // IBAction intitiateButton - запуск таймера со звуками
    @IBAction func initiateButtonPressed(_ sender: UIButton) {
        //timer?.invalidate()
        firstTimer()
    }
    
    // Return to start screen button
    @IBAction func goBackFromStartScreenButton(_ sender: UIButton) {
        func performSegue(withIdentifier identifier: String, sender: Any?) {
            if identifier == "GoBackFromStartScreen" {
              // Do something before the segue is performed
              super.performSegue(withIdentifier: "GoBackFromStartScreen", sender: nil)
            }
        }
    }
}

