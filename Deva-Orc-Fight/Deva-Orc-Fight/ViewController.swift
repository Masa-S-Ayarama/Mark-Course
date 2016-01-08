//
//  ViewController.swift
//  Deva-Orc-Fight
//
//  Created by Nas@Mac on 22/12/58.
//  Copyright © พ.ศ. 2558 Nas@Mac. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var enemyHpLbl: UILabel!
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var playerImg: UIImageView!
    @IBOutlet weak var startGameBtn: UIButton!
    @IBOutlet weak var enemyAttkBtn: UIButton!
    @IBOutlet weak var playerAttkBtn: UIButton!
    
    // iVars
    var player: Player!
    var enemy: Enemy!
    
    var lootMessage: String!
    var bgSoundPlayer: AVAudioPlayer!
    var actionFXSoundPlayer: AVAudioPlayer!
    
    
    
    // View's life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        disablePlayGame()
    }
    
    func disablePlayGame() {
        
        enemyAttkBtn.enabled = false
        playerAttkBtn.enabled = false
        startGameBtn.hidden = false
        messageLbl.text = "Tap 'New Game' to play"
    }
    
    func setUpPlayers() {
        
        player = Player(name: "RomanDeva", hp: 80, attackPwr: 15)
        generateRandomEnemy()
        
        playerHpLbl.text = "\(player.hp) HP"
        enemyHpLbl.text = "\(enemy.hp) HP"
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if (rand == 0) {
            enemy = Kimara(startingHP: 110, attackPwr: 12)
        } else {
            enemy = DevilWizard(startingHP: 60, attackPwr: 15)
        }
    }
    
    func playBackgroundSound() {
        
        if (bgSoundPlayer != nil) {
            
            bgSoundPlayer!.stop()
            bgSoundPlayer = nil
            
        }
        
        let fileURL:NSURL = NSBundle.mainBundle().URLForResource("02 HHavok-main", withExtension: "mp3")!
        
        do {
            
            bgSoundPlayer = try AVAudioPlayer(contentsOfURL: fileURL)
            
        } catch _{
            
            bgSoundPlayer = nil
        }
        
        //bgSoundPlayer!.volume = bgSoundVolume
        bgSoundPlayer!.numberOfLoops = -1
        bgSoundPlayer!.prepareToPlay()
        bgSoundPlayer!.play()
        
    }
    
    func playActionFXSound(name: String) {
        
        if (actionFXSoundPlayer != nil) {
            
            actionFXSoundPlayer!.stop()
            actionFXSoundPlayer = nil
        }
        
        let fileURL:NSURL = NSBundle.mainBundle().URLForResource(name, withExtension: "wav")!
        
        do {
            actionFXSoundPlayer = try AVAudioPlayer(contentsOfURL: fileURL)
            
        } catch _{
            actionFXSoundPlayer = nil
            
        }
        
        actionFXSoundPlayer!.prepareToPlay()
        actionFXSoundPlayer!.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func enemyAttkBtnTapped(sender: AnyObject) {
        
        if (player.attemptAttack(enemy.attackPwr) == true) {
            playerHpLbl.text = "\(player.hp) HP"
            messageLbl.text = "\(enemy.type) attack \(player.name) for \(enemy.attackPwr) HP"
            playActionFXSound("198610__18hiltc__punching-and-uppercut")
            playerAttkBtn.enabled = false
            updateStatus()
            
            if enemy.isAlive {
                
                NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "waitToAttack", userInfo: nil, repeats: false)
                
            } else {
                enemyAttkBtn.enabled = false
                playerAttkBtn.enabled = false
            }
            
        } else {
            messageLbl.text = "Attack was unsuccessful !"
        }
        
    }
    
    @IBAction func playerAttkBtnTapped(sender: AnyObject) {
        if (enemy.attemptAttack(player.attackPwr) == true) {
            enemyHpLbl.text = "\(enemy.hp) HP"
            messageLbl.text = "\(player.name) attack \(enemy.type) for \(player.attackPwr) HP"
            playActionFXSound("198610__18hiltc__punching-and-uppercut")
            enemyAttkBtn.enabled = false
            updateStatus()
            if player.isAlive {
                
                NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "waitToAttack", userInfo: nil, repeats: false)
                
            } else {
                enemyAttkBtn.enabled = false
                playerAttkBtn.enabled = false
            }
            
            
        } else {
            messageLbl.text = "Attack was unsuccessful !"
        }
    }
    
    @IBAction func startGameTapped(sender: AnyObject) {
        startGameBtn.hidden = true
        enemyAttkBtn.enabled = true
        playerAttkBtn.enabled = true
        messageLbl.text = "Attack enemy to reduce HP"
        playerImg.hidden = false
        enemyImg.hidden = false
        setUpPlayers()
        playBackgroundSound()
    }
    
    
    func getLoot() {
        if let loot = enemy.dropLoot() {
            lootMessage = "\(player.name) found \(loot)"
        }
    }
    
    func updateStatus() {
        
        let wait:NSTimeInterval = 3.0
        
        enemyAttkBtn.enabled = false
        playerAttkBtn.enabled = false

        if !player.isAlive {
            playerHpLbl.text = ""
            messageLbl.text = "The winner is \(enemy.type)"
            playerImg.hidden = true
            playActionFXSound("173126__replix__death-sound-male")
            bgSoundPlayer!.stop()

                NSTimer.scheduledTimerWithTimeInterval(wait, target: self, selector: "disablePlayGame", userInfo: nil, repeats: false)
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            messageLbl.text = "The winner is \(player.name)"
            enemyImg.hidden = true
            playActionFXSound("137036__pyrocamancer__beast-death")
            bgSoundPlayer!.stop()

                NSTimer.scheduledTimerWithTimeInterval(wait, target: self, selector: "disablePlayGame", userInfo: nil, repeats: false)

        }
    }
    
    func waitToAttack() {
        
        if playerAttkBtn.enabled == false {
            playerAttkBtn.enabled = true
        }
        if enemyAttkBtn.enabled == false {
            enemyAttkBtn.enabled = true
        }
    }
    
    func messageOfWinner(name: String) {
        messageLbl.text = "The winner is \(name)"
    }
    

}

