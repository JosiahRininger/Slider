//
//  ViewController.swift
//  BullsEye
//
//  Created by Josiah Rininger on 1/9/19.
//  Copyright © 2019 Josiah Rininger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    var roundNumber: Int = 0
    var score = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let roundedValue = slider.value.rounded()
        
        currentValue = Int(roundedValue)
        newGame()
        
//        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
//        slider.setThumbImage(thumbImageNormal, for: .normal)
//
//        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
//        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
//        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
//
//        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
//        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
//        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
//
//        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
//        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
//        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }
    
    @IBAction func showAlert() {
        
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference == 100 ? 200 : 100 - difference
        points = points < 85 ? -100 : points
        var word: String
        var otherWord: String
        
        roundNumber += 1
        score += points
        
        switch points {
        case 200: word = "Perfect!"; otherWord = "Awesome!"
        case 95...99: word = "Close"; otherWord = "Great!"
        case 85...94: word = "OK"; otherWord = "Alright"
        default: word = "..."; otherWord = "hmm"
        }
        
        let message = "You scored \(points) points!"
        let alert = UIAlertController(title: word, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: otherWord, style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func newGame() {
        score = 0
        roundNumber = 1
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        roundLabel.text = String(roundNumber)
        scoreLabel.text = String(score)
    }
    
}
