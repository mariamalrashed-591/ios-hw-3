//
//  ViewController.swift
//  XOgame
//
//  Created by Mariam on 9/25/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
        
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    @IBOutlet weak var Xwins: UILabel!
    @IBOutlet weak var Owins: UILabel!
    
    @IBOutlet weak var background: UIImageView!
    let backgrounArray = ["blue","purple","green","pink","orange"]
    var index = 0
    
    
    var xWins: Int = 0
    var oWins: Int = 0
    
    var counter = 0
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        buttons = [b1, b2, b3, b4, b5, b6, b7, b8, b9]
        super.viewDidLoad()
        MusicPlayer.shared.startBackgroundMusic()
    }
    
    class MusicPlayer{
        static let shared = MusicPlayer()
        var audioPlayer: AVAudioPlayer?

            func startBackgroundMusic() {
                if let bundle = Bundle.main.path(forResource: "/Users/mariam/Desktop/bensound-happyrock.mp3", ofType: "mp3") {
                            let backgroundMusic = NSURL(fileURLWithPath: bundle)
                    do {
                                   audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                                   guard let audioPlayer = audioPlayer else { return }
                                   audioPlayer.numberOfLoops = -1
                                   audioPlayer.prepareToPlay()
                                   audioPlayer.play()
                               } catch {
                                   print(error)
                               }
            }
    }
    }
    
    
    
    @IBOutlet weak var turnLabel: UILabel!
  
    
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func resetBtn() {
        for b in buttons {
            b.backgroundColor = UIColor.white
            b.setTitle("", for: .normal)
            b.titleLabel?.text = ""
            b.isUserInteractionEnabled = true
            
        }
            
    
        self.index = (self.index >= self.backgrounArray.count-1) ? 0 :self.index+1
        self.background.image = UIImage(named: backgrounArray[index])

    
        //reset other variables to starting conditions
        counter = 0
        turnLabel.text = "X turn"
        resultLabel.text = ""
    }
    
    @IBAction func click(_ sender: UIButton) {
        sender.isUserInteractionEnabled = false
        if counter % 2 == 0 {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(UIColor.yellow, for: .normal)
            sender.backgroundColor = (UIColor.orange)
            turnLabel.text = "O turn" }
        else{
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(UIColor.orange, for: .normal)
            sender.backgroundColor = (UIColor.yellow)
            turnLabel.text = "X turn"
        }
        counter = counter + 1
        winning(winner: "X")
        winning(winner: "O")
    }
    
    func winning(winner: String) {
        if  (b1.titleLabel?.text == winner && b2.titleLabel?.text == winner && b3.titleLabel?.text == winner) ||
            (b4.titleLabel?.text == winner && b5.titleLabel?.text == winner && b6.titleLabel?.text == winner) ||
            (b7.titleLabel?.text == winner && b8.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b1.titleLabel?.text == winner && b4.titleLabel?.text == winner && b7.titleLabel?.text == winner) ||
            (b2.titleLabel?.text == winner && b5.titleLabel?.text == winner && b8.titleLabel?.text == winner) ||
            (b3.titleLabel?.text == winner && b6.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b1.titleLabel?.text == winner && b5.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
            (b3.titleLabel?.text == winner && b5.titleLabel?.text == winner && b7.titleLabel?.text == winner)
        {
        
            let alertController = UIAlertController (title: "\(winner) has won", message: "press restart to play again", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "reset", style: .cancel) { (alert) in
                self.resetBtn()
                
            }
            alertController.addAction(restartAction)
            present(alertController, animated: true, completion: nil)
            resultLabel.text = "\(winner) wins!"
            if winner == "X" {
                xWins += 1
                Xwins.text = "\(xWins)"
            }
            else if winner == "O" {
                oWins += 1
                Owins.text = "\(oWins)"
            }
          
        }
        
    }
        
}


