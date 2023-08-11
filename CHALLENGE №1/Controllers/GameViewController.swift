//
//  GameViewController.swift
//  CHALLENGE №1
//
//  Created by Vanopr on 07.08.2023.
//

import UIKit
import Lottie
import AVFoundation
import Foundation

class GameViewController: UIViewController {
    
    
    var animationCurrentTime = UserDefaults.standard.integer(forKey: "animationCurrentTime")
    var timer: Timer?
    
    

    
    var category = Category()
    var audio = Audio()
    
    var questionsActual = UserDefaults.standard.array(forKey: "questions") as! [String]
    var memory = MemoryCategory()
    var memorySettings = MemorySettings()
    
    var questionSaved = UserDefaults.standard.string( forKey: "questionSaved")
    
//    let ifAboutDifferentOn     = UserDefaults.standard.bool(forKey: "ifAboutDifferentOn")
//    let ifHobbiesAndSportsOn   = UserDefaults.standard.bool(forKey: "ifHobbiesAndSportsOn")
//    let ifLifeQuestionsOn      = UserDefaults.standard.bool(forKey: "ifLifeQuestionsOn")
//    let ifCelebrityQuestionsOn = UserDefaults.standard.bool(forKey: "ifCelebrityQuestionsOn")
//    let ifFilmArtQuestionsOn   = UserDefaults.standard.bool(forKey: "ifFilmArtQuestionsOn")
//    let ifNatureQuestionsOn    = UserDefaults.standard.bool(forKey: "ifNatureQuestionsOn")
//    var musicOnOff             = UserDefaults.standard.bool( forKey: "musicOnOff")
    
    let gameTimeActual =  UserDefaults.standard.integer(forKey: "gameTime")
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet private var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(true, forKey: "continue")

  
        
        
        
        
        
//        if questionsActual.isEmpty {
//           questionsActual = category.addAllCategories(
//                ifAboutDifferentOn     : memory.ifAboutDifferent,
//                ifHobbiesAndSportsOn   : memory.ifHobbiesAndSports,
//                ifLifeQuestionsOn      : memory.ifLifeQuestions,
//                ifCelebrityQuestionsOn : memory.ifCelebrityQuestions,
//                ifFilmArtQuestionsOn   : memory.ifFilmArtQuestions,
//                ifNatureQuestionsOn    : memory.ifNatureQuestions)
//
//
//        }
        
        
        // MARK: Проверка:
        
        print(questionsActual)
        print(gameTimeActual)
        print(animationCurrentTime)

        
          animationView!.frame = view.bounds
          
          
        animationView!.contentMode = .scaleAspectFit
     
   
          
          
          //  Play animation
          
          animationView!.stop()
        // изменить на .play чтобы запустить анимацию
        stopButton.isHidden = true
        
       

        audio.setupAudioPlayers()
    }
    

    
    @IBAction func goBackFromStartScreenButtonAction(_ sender: UIButton) {
        animationView.stop()
        
//        audio.backgroundMusic?.stop()
//        audio.tickingMusic?.stop()
//        audio.burnMusic?.stop()
        
        audio.stopMusic()
        timer?.invalidate()
        timer = nil
        
        UserDefaults.standard.set(animationCurrentTime, forKey: "animationCurrentTime")
        
        
        let startOver = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        startOver.modalPresentationStyle = .fullScreen
        self.present(startOver, animated: true)
    }
    
    
    @IBAction func goButtonAction(_ sender: UIButton) {
        
        if animationCurrentTime == 0  {
            let questionSaved = category.getRandomNonRepeatingQuestion(questionsModify: questionsActual)
            questionLabel.text = questionSaved
            UserDefaults.standard.set(questionSaved, forKey: "questionSaved")
            UserDefaults.standard.set(category.newArrayOfQuestion, forKey: "questions")
            UserDefaults.standard.synchronize() // Синхронизация
        } else {
            questionLabel.text = questionSaved
        }
            
          
        
       
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateAnimationCurrentTime), userInfo: nil, repeats: true)

      
            
            animationView!.loopMode = .loop
            animationView.play()
        
//        audio.backgroundMusic?.play()
//        audio.tickingMusic?.play()
//        audio.burnMusic?.play()
        
            audio.playMusic()
            goButton.isHidden = true
            stopButton.isHidden = false
    }
    
    @IBAction func stopButtonAction(_ sender: UIButton) {
        animationView.pause()
        
//        audio.backgroundMusic?.pause()
//        audio.tickingMusic?.pause()
//        audio.burnMusic?.pause()
        
        audio.pauseMusic()
        goButton.isHidden = false
        stopButton.isHidden = true
        timer?.invalidate()
        timer = nil
      
       
    }

    func gameOver() {
        
                let endGameViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EndGameViewController") as! EndGameViewController
        endGameViewController.modalPresentationStyle = .fullScreen
                self.present(endGameViewController, animated: true)
        
        
        animationView.isHidden = true
        
//        audio.backgroundMusic?.stop()
//        audio.tickingMusic?.stop()
//        audio.burnMusic?.stop()
        
        audio.stopMusic()
        audio.explosionMusic?.play()
        timer?.invalidate()
        timer = nil
        
        
//        animationCurrentTime = 0

       
       
        

    }
    
    @objc func updateAnimationCurrentTime() {
        
        if goButton.isHidden == true && animationCurrentTime < gameTimeActual {
            animationCurrentTime += 1
        } else {
            gameOver()
        }
        
     
        
    }
    
    
 
    
}

