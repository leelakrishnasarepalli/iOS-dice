//
//  ViewController.swift
//  dice
//
//  Created by Leela krishna Sarepalli on 18/06/18.
//  Copyright © 2018 Leela krishna Sarepalli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var random1 : Int = 0
    var random2 : Int = 0
    var dicesList : [String] = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    var canStart : Bool = true
    
    @IBOutlet weak var myimage: UIImageView!
    @IBOutlet weak var rollDice1: UIImageView!
    @IBOutlet weak var rollDice2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetDice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func resetDice(){
        rollDice1.image = UIImage(named : "dice1")
        rollDice2.image = UIImage(named : "dice6")
    }
    func updateImage(){
        if(canStart){
        random1 = Int(arc4random_uniform(6))
        random2 = Int(arc4random_uniform(6))
        rollDice1.image = UIImage(named : dicesList[random1])
        rollDice2.image = UIImage(named : dicesList[random2])
        }}
    @IBAction func runWhenClickOrShake(_ sender: UIButton) {
        updateImage()
        youWin()
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateImage()
        youWin()
    }
    
    func youWin(){
        if(random1 + random2 == 6){
            myimage.image = UIImage(named: "you win")
            canStart = false
        }
    }
   
    @IBAction func resetGame(_ sender: UIButton) {
        myimage.image = UIImage(named: "diceeLogo")
        resetDice()
        canStart = true
    }
}

