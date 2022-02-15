//
//  Captcha Setup.swift
//  Captcha
//
//  Created by Emmett Shaughnessy on 1/28/22.
//

import Foundation
import UIKit
import AVFoundation


struct captcha:Equatable {
    let code:String
    let image:UIImage?
    var placement:Int? = nil
}

struct audioCaptcha:Equatable{
    let code: String
    let fileName: String
    
    ///Returns the audio file bundle URL for use with the 'play()' method in AudioViewController
    func sound() -> URL{
    
        let bundlePath = Bundle.main.path(forResource: fileName, ofType: "wav")!
        let url = URL(fileURLWithPath: bundlePath)
        return url
        
    }//end play()
    
}//end audioCaptcha struct

//MARK: Making CAPTCHAs
let captcha1:captcha = captcha(code: "2b827", image: UIImage(named: "2b827")!)
let captcha2:captcha = captcha(code: "2bg48", image: UIImage(named: "2bg48")!)
let captcha3:captcha = captcha(code: "2cegf", image: UIImage(named: "2cegf")!)
let captcha4:captcha = captcha(code: "2cg58", image: UIImage(named: "2cg58")!)
let captcha5:captcha = captcha(code: "2cgyx", image: UIImage(named: "2cgyx")!)
let captcha6:captcha = captcha(code: "2en7g", image: UIImage(named: "2en7g")!)
let captcha7:captcha = captcha(code: "2enf4", image: UIImage(named: "2enf4")!)
let captcha8:captcha = captcha(code: "2fxgd", image: UIImage(named: "2fxgd")!)
let captcha9:captcha = captcha(code: "2g7nm", image: UIImage(named: "2g7nm")!)
let captcha10:captcha = captcha(code: "2g783", image: UIImage(named: "2g783")!)

//MARK: CAPTCHA Array
let captchaArray:[captcha] = [captcha1, captcha2, captcha3, captcha4, captcha5, captcha6, captcha7, captcha8, captcha9, captcha10]

//MARK: Audio CAPTCHAs
let ac1:audioCaptcha = audioCaptcha(code: "rv6te", fileName: "scratched_rv6te")
let ac2:audioCaptcha = audioCaptcha(code: "t6phm", fileName: "cassette_t6phm")
let ac3:audioCaptcha = audioCaptcha(code: "nt6v5", fileName: "helicopter_nt6v5")
let ac4:audioCaptcha = audioCaptcha(code: "cgy3e", fileName: "robot_cgy3e")
let ac5:audioCaptcha = audioCaptcha(code: "cku3k", fileName: "alien_cku3k")
let ac6:audioCaptcha = audioCaptcha(code: "x6tj8", fileName: "magic_x6tj8")
let ac7:audioCaptcha = audioCaptcha(code: "8cd65", fileName: "ocean_8cd65")
let ac8:audioCaptcha = audioCaptcha(code: "e6jv9", fileName: "chord_e6jv9")
let ac9:audioCaptcha = audioCaptcha(code: "bp5k6", fileName: "electricity_bp5k6")

let acArrayy:[audioCaptcha] = [ac1, ac2, ac3, ac4, ac5, ac6, ac7, ac8, ac9]






