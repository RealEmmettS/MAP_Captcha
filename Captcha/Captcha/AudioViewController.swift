//
//  AudioViewController.swift
//  Captcha
//
//  Created by Emmett Shaughnessy on 2/9/22.
//

import UIKit
import AVFoundation


class AudioViewController: UIViewController {
    
    //MARK: Audio Setup
    //https://www.hackingwithswift.com/example-code/media/how-to-play-sounds-using-avaudioplayer
    
    var sound: AVAudioPlayer?
    ///AC = Audio CAPTCHA. Stores the randomly chosen audio CAPTCHA
    var chosenAC: audioCaptcha?

    @IBOutlet weak var userCaptchaField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()

    }
    
    //MARK: viewWillAppear()
    override func viewWillAppear(_ animated: Bool) {
        
        //Replace 0 with the minimum, and replace 6 with the maximum
        let r = Int.random(in: 0..<acArrayy.count)
        chosenAC = acArrayy[r]
        print( (chosenAC?.code)! )
        
    }
    
    //MARK: Button Actions
    @IBAction func button(_ sender: Any) {
        play( (chosenAC!.sound()) )
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        if userCaptchaField.text != "" || userCaptchaField.text != nil{
            
            submitButton.isEnabled = false
            
            if userCaptchaField.text?.lowercased() == chosenAC?.code{
                view.backgroundColor = .green
                
            }else{
                view.backgroundColor = .red
            }
            
            runTimer(3)
            
            
        }
    }
    
    //MARK: play()
    func play(_ url: URL){
        
        do {
            sound = try AVAudioPlayer(contentsOf: url)
            sound?.play()
        } catch {
            // couldn't load file :(
        }
        
    }//end playSound()
    
    
    //MARK: Timer
        func runTimer(_ totalTime: Int = 10){
                    
            print("Timer Started")
            var timeLeft = totalTime
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            
                //This code runs every second
                print("Time Left: \(timeLeft)")
                timeLeft -= 1
                
                if timeLeft == 0 {
                    //This code runs when the timer is up
                    timer.invalidate()
                    self.view.backgroundColor = .systemBackground
                    self.submitButton.isEnabled = true
                }

            }//End of Timer
        }//End of restartTimer()
    

}
