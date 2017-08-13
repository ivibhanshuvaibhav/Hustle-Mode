//
//  ViewController.swift
//  Hustle Mode
//
//  Created by Vibhanshu Vaibhav on 12/08/17.
//  Copyright © 2017 Vibhanshu Vaibhav. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainBackground: UIImageView!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var cloudView: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleLabel: UILabel!
    @IBOutlet weak var onLabel: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")
        let url = URL(fileURLWithPath: path!)
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print(error)
        }
    }

    @IBAction func powerButtonPressed(_ sender: Any) {
        powerButton.isHidden = true
        mainBackground.isHidden = true
        cloudView.isHidden = false
        
        player.play()
        
        UIView.animate(withDuration: 2, animations: { 
            self.rocket.frame = CGRect(x: 0 , y: 150, width: 375, height: 358)
        }) { (finished) in
            self.hustleLabel.isHidden = false
            self.onLabel.isHidden = false
        }
    }
}

