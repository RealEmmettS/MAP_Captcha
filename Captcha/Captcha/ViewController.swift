//
//  ViewController.swift
//  Captcha
//
//  Created by Emmett Shaughnessy on 1/28/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var codeLabel: UILabel!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    var imageViewArray:[UIImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewArray = [image1, image2, image3, image4]
        
    }


}

