//
//  Captcha Setup.swift
//  Captcha
//
//  Created by Emmett Shaughnessy on 1/28/22.
//

import Foundation
import UIKit

struct captcha{
    let code:String
    let image:UIImage
}

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
