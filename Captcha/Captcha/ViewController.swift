//
//  ViewController.swift
//  Captcha
//
//  Created by Emmett Shaughnessy on 1/28/22.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    //MARK: Setup
    @IBOutlet weak var codeLabel: UILabel!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    var basicImageArray:[UIImageView] = []
    var imageArray:[image] = []
    var chosenCAPTCHA:captcha = captcha(code: "", image: nil)
    var previouslyUsedCAPTCHAS:[Int] = []
    var wrongCount:Int = 0
    
    var badSound: AVAudioPlayer?
    
    
    
    
    
    //MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    //MARK: viewWillAppear()
    override func viewWillAppear(_ animated: Bool) {
        basicImageArray = [image1, image2, image3, image4]
        
        var tempID = 0
        for item in basicImageArray{
            let newImage = image(imageView: item, id: tempID)
            imageArray.append(newImage)
            tempID += 1
        }
        
        initiateImageViews()
        
        refreshCAPTCHA()
        
        //Audio Setup
        //https://www.hackingwithswift.com/example-code/media/how-to-play-sounds-using-avaudioplayer
    }// end of viewWillAppear()
    
    
    
    
    
    //MARK: -refreshCAPTCHA()
    func refreshCAPTCHA(){
        
        previouslyUsedCAPTCHAS = []
        image1.isHidden = false
        image2.isHidden = false
        image3.isHidden = false
        image4.isHidden = false
        view.backgroundColor = .systemBackground
        wrongCount = 0
        
        let r = Int.random(in: 0..<imageArray.count)
        let chosenImage:UIImageView = imageArray[r].imageView
        
        for image in imageArray{
            
            var randomInt = Int.random(in: 0..<captchaArray.count)
            while previouslyUsedCAPTCHAS.contains(randomInt){
                randomInt = Int.random(in: 0..<captchaArray.count)
            }
            
            image.imageView.image = captchaArray[randomInt].image
            previouslyUsedCAPTCHAS.append(randomInt)
            if image.imageView == chosenImage{
                chosenCAPTCHA = captchaArray[randomInt]
                chosenCAPTCHA.placement = r
                print("Chosen CAPTCHA is \"\(chosenCAPTCHA.code)\"")
            }//end of if
            
        }//end of for loop
        
        codeLabel.text = "Code: \(chosenCAPTCHA.code)"
        
    }//end of refreshCAPTCHA()
    
    
    
    
    
    
    
    
    
    //MARK: Gesture Recognition
    func initiateImageViews(){
        
        let tapRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(tapped1(gestureRecognizer:)))
        image1.addGestureRecognizer(tapRecognizer1)
        tapRecognizer1.delegate = self
        image1.isUserInteractionEnabled = true
        
        let tapRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(tapped2(gestureRecognizer:)))
        image2.addGestureRecognizer(tapRecognizer2)
        tapRecognizer2.delegate = self
        image2.isUserInteractionEnabled = true
        
        let tapRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(tapped3(gestureRecognizer:)))
        image3.addGestureRecognizer(tapRecognizer3)
        tapRecognizer3.delegate = self
        image3.isUserInteractionEnabled = true
        
        let tapRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(tapped4(gestureRecognizer:)))
        image4.addGestureRecognizer(tapRecognizer4)
        tapRecognizer4.delegate = self
        image4.isUserInteractionEnabled = true
        
        print("\nImages are ready for tapping.\n")
        
    }
    
    
    
    
    
    
    
    
    
    
    
    //MARK: Where stuff happens
    @objc func tapped1(gestureRecognizer: UITapGestureRecognizer) {
        print("tapped 1")
        if chosenCAPTCHA.placement == 0{
            correctSelection()
        }else{
            wrongSelection(image1)
        }
    }
    
    @objc func tapped2(gestureRecognizer: UITapGestureRecognizer) {
        print("tapped 2")
        if chosenCAPTCHA.placement == 1{
            correctSelection()
        }else{
            wrongSelection(image2)
        }
    }
    
    @objc func tapped3(gestureRecognizer: UITapGestureRecognizer) {
        print("tapped 3")
        if chosenCAPTCHA.placement == 2{
            correctSelection()
        }else{
            wrongSelection(image3)
        }
    }
    
    @objc func tapped4(gestureRecognizer: UITapGestureRecognizer) {
        print("tapped 4")
        if chosenCAPTCHA.placement == 3{
            correctSelection()
        }else{
            wrongSelection(image4)
        }
    }
    
    // Correct / Wrong Selection Methods
    func correctSelection(){
        print("Correct")
        wrongCount = 0
        view.backgroundColor = .green
        //runTimer(3)
        refreshCAPTCHA()
    }
    
    func wrongSelection(_ image: UIImageView){
        print("Incorrect")
        wrongCount += 1
        image.shake()
        
        if wrongCount >= 3 {
            image1.isHidden = true
            image2.isHidden = true
            image3.isHidden = true
            image4.isHidden = true
            view.backgroundColor = .red
            runTimer(3)
        }
        
    }//end of wrongSelection()
    
    
    
    
    
    
    
    
    
    
    
    
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
                self.refreshCAPTCHA()
            }
            
        }//End of Timer
    }//End of restartTimer()
    
    
    
    
}

